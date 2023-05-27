package com.myyteam.shesg.config;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
@Data
@Slf4j
public class ProductNacosInfoConfig {
    /**
     * 敦煌接口链接：查询商品详情
     */
    @Value("${product.dhUrl_prod.dhgateproductInfoUrl:''}")
    private String dhgateproductInfoUrl;

    /**
     * 敦煌接口链接：查询价格信息
     */
    @Value("${product.dhUrl_prod.distributionSalesPriceUrl:''}")
    private String distributionSalesPriceUrl;
}
