package com.myyteam.shesg.infrastructure.external.impl;


import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.myyteam.shesg.domain.entity.DhProductDTO;
import com.myyteam.shesg.domain.entity.ProductSkuDTO;
import com.myyteam.shesg.infrastructure.external.ProductInfoConvert;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;

@Slf4j
@Component
public class ProductInfoConvertImpl implements ProductInfoConvert {

    @Override
    public String getProductPrice(String itemCode, DhProductDTO dhProductDTO) {
        String price = null;
        StringBuilder url = new StringBuilder();
        url.append("https://www.dhgate.com/prod/node/price.do?itemCode=").append(itemCode);
        log.info("请求商品金额 url:[{}]", url);
        //http get 调用接口
        String responseBody = HttpUtil.get(url.toString());
        log.info("请求商品金额 响应:[{}]", responseBody);

        JSONObject json = JSON.parseObject(responseBody);
        if (ObjectUtil.isNotNull(json) && StrUtil.isNotBlank(json.getString("data"))) {
            JSONObject data = JSON.parseObject(json.getString("data"));
            JSONObject priceData = JSON.parseObject(data.getString("maxAndMinPriceVo"));
            if (Objects.nonNull(priceData)) {
                price = priceData.getString("taxDealMaxBuyerPrice");
                if (StrUtil.isBlank(price)) {
                    price = priceData.getString("taxMaxBuyerPrice");
                }
                log.info("拿到的商品：{}, 价格：{}", itemCode, price);
            }

        } else {
            log.warn("shesg没有拿到价格：{}", itemCode);
        }
        if (StrUtil.isBlank(price)) {
            List<ProductSkuDTO> productSkuList = dhProductDTO.getProductSkuList();
            ProductSkuDTO lowSku = productSkuList.stream().min(Comparator.comparing(ProductSkuDTO::getOriginPrice)).orElse(null);
            price = ObjectUtils.isEmpty(lowSku) ? BigDecimal.ZERO.toString() : lowSku.getOriginPrice().toString();
        }
        return price;
    }
}
