package com.myyteam.shesg.domain.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.Header;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.myyteam.shesg.domain.OpenAIService;
import com.myyteam.shesg.infrastructure.persistence.mapper.ShesgProductMapper;
import com.myyteam.shesg.infrastructure.persistence.mapper.ShesgUserSocialPostMapper;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgProductDO;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgUserSocialPostDO;
import com.myyteam.shesg.web.param.ChatParam;
import com.myyteam.shesg.web.param.SaveSocialPostParam;
import com.myyteam.shesg.web.vo.AIRecommendVO;
import com.myyteam.shesg.web.vo.ChatVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class OpenAIServiceImpl implements OpenAIService {

    @Value("${openai.api-key:bc878d186dbb46458b1c3521c19b50d7}")
    private String token;

    private final ShesgProductMapper shesgProductMapper;
    private final ShesgUserSocialPostMapper shesgUserSocialPostMapper;

    @Override
    public List<AIRecommendVO> recommend(String userId) {
        // 根据userId查询最新保存的post对应的ai推荐的类目
        ShesgUserSocialPostDO shesgUserSocialPostDO = shesgUserSocialPostMapper.selectOne(Wrappers.<ShesgUserSocialPostDO>lambdaQuery()
                .eq(ShesgUserSocialPostDO::getUserId, userId)
                .orderByDesc(ShesgUserSocialPostDO::getCreatedAt)
                .last("limit 1"));
        String openaiRecommendCategory = "";
        if (ObjectUtil.isNotNull(shesgUserSocialPostDO)) {
            openaiRecommendCategory = shesgUserSocialPostDO.getOpenaiRecommendCategory();
        }
        List<ShesgProductDO> shesgProductList = shesgProductMapper.selectList(Wrappers.<ShesgProductDO>lambdaQuery().
                eq(StringUtils.isNotBlank(openaiRecommendCategory), ShesgProductDO::getCollection, openaiRecommendCategory)
                // ai没有推荐，则数据库random兜底
                .last("order by RAND() limit 20"));
        return shesgProductList.stream().map(product -> {
            AIRecommendVO aiRecommendVO = new AIRecommendVO();
            aiRecommendVO.setProductId(product.getProductId());
            aiRecommendVO.setTitle(product.getProductTitle());
            aiRecommendVO.setImageUrl(product.getProductImageUrl());
            aiRecommendVO.setPrice(product.getProductPrice());
            aiRecommendVO.setProductUrl(product.getProductUrl());
            aiRecommendVO.setDetails(product.getDetails());
            return aiRecommendVO;
        }).collect(Collectors.toList());
    }

    @Override
    public Boolean saveSocialPost(SaveSocialPostParam saveSocialPostParam) {
        log.info("socialPostParam: [{}]", saveSocialPostParam);
        ShesgUserSocialPostDO shesgUserSocialPostDO = ShesgUserSocialPostDO.builder()
                .userId(saveSocialPostParam.getUserId())
                .socialPost(saveSocialPostParam.getSocialPost())
                .createdAt(new Date())
                .updatedAt(new Date())
                .build();
        if (shesgUserSocialPostMapper.insert(shesgUserSocialPostDO) > 0) {
            // 异步调用openai分析类目
            CompletableFuture.runAsync(() -> parsePost(saveSocialPostParam.getSocialPost(), shesgUserSocialPostDO.getId())).exceptionally(e -> {
                log.error("解析post出错", e);
                return null;
            });
            return true;
        }
        return false;
    }

    @Override
    public ChatVO chat(ChatParam chatParam) {
        JSONObject data = requestChatGPT(chatParam.getText(), chatParam.getMsgId());
        if (ObjectUtil.isNotNull(data)) {
            return new ChatVO(data.getString("id"), data.getString("text"));
        }
        return new ChatVO();
    }

    @Override
    public String summary(String productId) {
        if (StringUtils.isBlank(productId)) {
            // 不传则对所有商品进行摘要
            return "all done";
        } else {
            ShesgProductDO shesgProductDO = shesgProductMapper.selectById(productId);
            String summaryProductDetails = summaryProductDetails(shesgProductDO.getDetails());
            shesgProductMapper.update(null, Wrappers.<ShesgProductDO>lambdaUpdate()
                    .eq(ShesgProductDO::getProductId, productId)
                    .set(ShesgProductDO::getDetailsSummary, summaryProductDetails));
            return summaryProductDetails;
        }
    }

    private String summaryProductDetails(String details) {
        String prompt = "帮我压缩这段信息,压缩结果不要超过50个字,这是需要压缩的信息:" + details;
        JSONObject data = requestChatGPT(prompt, null);
        return Optional.ofNullable(data).map(d -> d.getString("text")).orElse("");
    }

    private JSONObject requestChatGPT(String prompt, String msgId) {
        String url = "http://chatgpt-api.dhgateinternal.com/api/v3/chat/completions";
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("prompt", prompt);
        Map<String, Object> optionsMap = new HashMap<>();
        optionsMap.put("parentMessageId", msgId);
        paramMap.put("options", optionsMap);
        String authorization = "Bearer " + token;
        String param = JSON.toJSONString(paramMap);
        log.info("param: {}", param);
        String body = HttpUtil.createPost(url)
                .body(param)
                .header(Header.AUTHORIZATION, authorization)
                .header(Header.CONTENT_TYPE, "application/json; charset=utf-8")
                .execute()
                .body();
        log.info("chatgpt response: {}", body);
        JSONObject jsonObject = JSON.parseObject(body);
        return jsonObject.getJSONObject("data");
    }

    private void parsePost(String post, Long id) {
        String prompt = "我会给你发一段网红发布的post,请分析后从我提供的类目中选择一个更适合他带货的类目,以下是我提供的类目列表:['Accessories','Activewear','Bags','Basics & Intimates','Bottoms','Denim','Dresses & Playsuits','Lingerie','Outerwear','Shirts','Shoes','Swimwear','Womenswear],接下来是你需要分析的post原文,请直接告诉我类目名,不要包含任何其它的单词:" + post;
        JSONObject data = requestChatGPT(prompt, null);
        if (ObjectUtil.isNotNull(data)) {
            String result = data.getString("text");
            String[] arr = result.split(" ");
            log.info("arr: [{}]", Arrays.toString(arr));
            String recommendCategory = arr[arr.length - 1];
            recommendCategory = recommendCategory.replaceAll("\"", "").replace(".", "").replaceAll("'", "");
            // 将recommendCategory保存到数据库
            shesgUserSocialPostMapper.update(null, Wrappers.<ShesgUserSocialPostDO>lambdaUpdate().eq(ShesgUserSocialPostDO::getId, id).set(ShesgUserSocialPostDO::getOpenaiRecommendCategory, recommendCategory));
        }
    }
}
