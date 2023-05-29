package com.myyteam.shesg.domain.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.Header;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.myyteam.shesg.domain.OpenAIService;
import com.myyteam.shesg.infrastructure.persistence.mapper.ShesgProductMapper;
import com.myyteam.shesg.infrastructure.persistence.mapper.ShesgUserSocialPostMapper;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgProductDO;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgUserSocialPostDO;
import com.myyteam.shesg.web.param.SaveSocialPostParam;
import com.myyteam.shesg.web.vo.AIRecommendVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class OpenAIServiceImpl implements OpenAIService {

    @Value("${openai.api-key}")
    private String token;

    private final ShesgProductMapper shesgProductMapper;
    private final ShesgUserSocialPostMapper shesgUserSocialPostMapper;

    @Override
    public List<AIRecommendVO> recommend(String userId) {
        // 根据userId查询最新保存的post对应的ai推荐的类目
        ShesgUserSocialPostDO shesgUserSocialPostDO = shesgUserSocialPostMapper.selectOne(Wrappers.<ShesgUserSocialPostDO>lambdaQuery()
                .eq(ShesgUserSocialPostDO::getUserId, userId)
                .ne(ShesgUserSocialPostDO::getOpenaiRecommendCategory, "")
                .orderByDesc(ShesgUserSocialPostDO::getCreatedAt)
                .last("limit 1"));
        String openaiRecommendCategory = "";
        if (ObjectUtil.isNotNull(shesgUserSocialPostDO)) {
            openaiRecommendCategory = shesgUserSocialPostDO.getOpenaiRecommendCategory();
        }

        // 调用ChatGPT进行分析
        List<ShesgProductDO> productList = shesgProductMapper.selectList(Wrappers.<ShesgProductDO>lambdaQuery()
                .select(ShesgProductDO::getProductId, ShesgProductDO::getDetailsSummary)
                .isNotNull(ShesgProductDO::getDetailsSummary)
                .ne(ShesgProductDO::getDetailsSummary, "")
                .eq(ShesgProductDO::getCollection, openaiRecommendCategory));
        List<ShesgProductDO> shesgProductList = null;
        if (CollUtil.isNotEmpty(productList)) {
            String text = "I have some product information, I will send you in JSON format, please analyze and provide productId of TOP 20 products that are more suitable this instagram post.this is the instagram post: " + shesgUserSocialPostDO.getSocialPost();

            try {
                JSONObject jsonObject = requestChatGPT(text, null);
                String msgId = jsonObject.getString("id");
                String text2 = "Regardless of the matching results, you must return 20 products to me.The following are the product information you need to analyze:" + JSON.toJSONString(productList);
                JSONObject jsonObject2 = requestChatGPT(text2, msgId);
                String productIdStr = jsonObject2.getString("text");
                // 通过正则匹配到商品id
                Pattern pattern = Pattern.compile("\\d+");
                Matcher matcher = pattern.matcher(productIdStr);
                List<Long> idList = new ArrayList<>();
                while (matcher.find()) {
                    String number = matcher.group();
                    if (number.length() == 12) {
                        idList.add(Long.parseLong(number));
                    }
                }
                // 根据ChatGPT分析的结果，从数据库查询商品信息
                shesgProductList = shesgProductMapper.selectBatchIds(idList);
            } catch (Exception e) {
                log.error("analyze error", e);
            }
        }

        // 如果ChatGPT没有数据，则走类目匹配
        if (CollUtil.isEmpty(shesgProductList)) {
            log.info("no result from gpt, get by category.");
            shesgProductList = shesgProductMapper.selectList(Wrappers.<ShesgProductDO>lambdaQuery().
                    eq(StrUtil.isNotBlank(openaiRecommendCategory), ShesgProductDO::getCollection, openaiRecommendCategory)
                    .last("limit 20"));
        }
        if (CollUtil.isEmpty(shesgProductList)) {
            log.info("no result form gpt and category. get by random.");
            // 如果类目没有匹配上，则数据库random兜底
            shesgProductList = shesgProductMapper.selectList(Wrappers.<ShesgProductDO>lambdaQuery().last("order by RAND() limit 20"));
        }
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
    public String summary(String productId) {
        if (StrUtil.isBlank(productId)) {
            // 不传则对所有商品进行摘要
            int page = 1;
            boolean flag = true;
            while (flag) {
                Page<ShesgProductDO> result = shesgProductMapper.selectPage(new Page<>(page, 10),
                        Wrappers.<ShesgProductDO>lambdaQuery().eq(ShesgProductDO::getIsDelete, false)
                                .and(wrapper -> wrapper.isNull(ShesgProductDO::getDetailsSummary).or().eq(ShesgProductDO::getDetailsSummary, "")));
                log.info("summary product: {}/{}", result.getCurrent(), result.getPages());
                result.getRecords().forEach(item -> {
                    // 摘要商品
                    try {
                        String summaryProductDetails = summaryProductDetails(item.getDetails());
                        if (StrUtil.isNotBlank(summaryProductDetails)) {
                            shesgProductMapper.update(null, Wrappers.<ShesgProductDO>lambdaUpdate()
                                    .eq(ShesgProductDO::getProductId, item.getProductId())
                                    .set(ShesgProductDO::getDetailsSummary, summaryProductDetails));
                        }
                        // 每调用一次ChatGPT都暂停10秒，不要频率太快
                        Thread.sleep(10000);
                    } catch (Exception ignored) {}
                });
                if (result.getCurrent() == result.getSize()) {
                    flag = false;
                } else {
                    page += 1;
                }
            }
            return "all done";
        } else {
            ShesgProductDO shesgProductDO = shesgProductMapper.selectById(productId);
            String summaryProductDetails = null;
            try {
                summaryProductDetails = summaryProductDetails(shesgProductDO.getDetails());
                if (StrUtil.isNotBlank(summaryProductDetails)) {
                    shesgProductMapper.update(null, Wrappers.<ShesgProductDO>lambdaUpdate()
                            .eq(ShesgProductDO::getProductId, productId)
                            .set(ShesgProductDO::getDetailsSummary, summaryProductDetails));
                }
            } catch (Exception ignore) {
            }
            return summaryProductDetails;
        }
    }

    private String summaryProductDetails(String details) {
        if (StrUtil.isNotBlank(details)) {
            String prompt = "Help me compress message. The compressed result should not exceed 50 characters. This is the message that needs to be compressed:" + details;
            JSONObject data = requestChatGPT(prompt, null);
            return Optional.ofNullable(data).map(d -> d.getString("text")).orElse("");
        }
        return null;
    }

    private JSONObject requestChatGPT(String prompt, String msgId) {
        String url = "https://chatgpt.dhgate.com/api/v3/chat/completions";
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("prompt", prompt);
        paramMap.put("projectName", "shESG");
        paramMap.put("model", "gpt-3.5-turbo-0301");
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
        String prompt = "I will send you a post published by creator, please analyze it to select a more suitable category for them to market their products, here is a list of categories I have provided fro you:['Accessories','Activewear','Bags','Basics & Intimates','Bottoms','Denim','Dresses & Playsuits','Lingerie','Outerwear','Shirts','Shoes','Swimwear','Womenswear],the next is the post that you need to analyze, please tell me the suitable category's name directly without including any others words:" + post;
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
