package com.myyteam.shesg.domain.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.myyteam.shesg.config.ProductNacosInfoConfig;
import com.myyteam.shesg.domain.GetGateInfoService;
import com.myyteam.shesg.domain.bo.DHResult;
import com.myyteam.shesg.domain.bo.ParamBO;
import com.myyteam.shesg.domain.entity.DhProductDTO;
import com.myyteam.shesg.domain.entity.ProductSkuDTO;
import com.myyteam.shesg.domain.entity.ProductSkuWithPriceDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;

@Service
@Slf4j
public class GetGateInfoServiceImpl implements GetGateInfoService {

    @Resource
    private RestTemplate restTemplate;

    @Resource
    private ProductNacosInfoConfig nacosInfoConfig;


    @Override
    public DhProductDTO getGateProductInfo(Long outItemCode) {
        // 获取敦煌商品信息并设置
        DhProductDTO dhProductDTO = getDhgateProduct(outItemCode);
        if(Objects.nonNull(dhProductDTO)){
            String supplierId = dhProductDTO.getSupplierid();
            Long itemCode = dhProductDTO.getItemcode();
            //# 获取分销价并设置
            List<ProductSkuWithPriceDTO> productSkuWithPriceDTOList = findDistributionSalesPrice(supplierId, itemCode);
            Map<Long, Double> skuPriceMap = new HashMap<>();
            for (ProductSkuWithPriceDTO productSkuWithPriceDTO : productSkuWithPriceDTOList) {
                // 取买家价格，字段名称：maxBuyerPrice
                Double price = productSkuWithPriceDTO.getMaxBuyerPrice();
                skuPriceMap.put(productSkuWithPriceDTO.getSkuId(), price);
            }
            List<ProductSkuDTO> productSkuList = dhProductDTO.getProductSkuList();
            for (ProductSkuDTO productSkuDTO : productSkuList) {
                Double distributionPrice = skuPriceMap.get(productSkuDTO.getSkuId());
                if (distributionPrice != null) {
                    productSkuDTO.setRetailPrice(distributionPrice);
                }
                // 外部商品价格并转换成BigDecimal
                BigDecimal retailPrice = BigDecimal.valueOf(productSkuDTO.getRetailPrice()).setScale(2, RoundingMode.HALF_UP);
                productSkuDTO.setOriginPrice(retailPrice);
            }
        }
        return dhProductDTO;

    }

    /**
     * 查询敦煌商品详情
     */
    public DhProductDTO getDhgateProduct(Long outItemCode) {
        String siteId = "EN";
        ParamBO param = new ParamBO();
        param.setParamNum(3);
        param.setParam1(siteId);
        param.setParam2("");
        param.setParam3(String.valueOf(outItemCode));
        String url = param.getUrl(nacosInfoConfig.getDhgateproductInfoUrl());
        log.info("请求查询敦煌商品详情,url：{}", url);
        String result = restTemplate.postForObject(url, String.class, String.class);
        DHResult<DhProductDTO> dhProductDTOResult = JSON.parseObject(result, new TypeReference<>() {});
        if (Objects.isNull(dhProductDTOResult)) {
            log.warn("[getDhgateProduct 查询敦煌商品详情为空] outItemCode:{}", outItemCode);
            return null;
        }
        return dhProductDTOResult.getData();
    }

    /**
     * 查询分销价格
     */
    public List<ProductSkuWithPriceDTO> findDistributionSalesPrice(String supplierid, Long itemcode) {
        String url = this.nacosInfoConfig.getDistributionSalesPriceUrl();
        ParamBO paramDTO = new ParamBO();
        paramDTO.setParamNum(4);
        // 站点ID,EN-英语
        paramDTO.setParam1("EN");
        // 供应商ID
        paramDTO.setParam2(supplierid);
        // 商品编码
        paramDTO.setParam3(String.valueOf(itemcode));
        // portId,终端:pc-1,wap-2,app-4
        paramDTO.setParam4("1");
        url = paramDTO.getUrl(url);
        log.info("查询敦煌商品价格模板，url：{}", url);
        ResponseEntity<String> responseEntity = this.restTemplate.postForEntity(url, String.class, String.class);
        String body = responseEntity.getBody();
        DHResult<List<ProductSkuWithPriceDTO>> distributionPriceResult = JSON.parseObject(body, new TypeReference<DHResult<List<ProductSkuWithPriceDTO>>>() {
        });
        if (Objects.isNull(distributionPriceResult)) {
            log.warn("[findDistributionSalesPrice 查询分销价格为空] supplierId:{},outItemCode:{}", supplierid, itemcode);
            return null;
        }
        if (Boolean.TRUE.equals(distributionPriceResult.getAck())) {
            return distributionPriceResult.getData();
        }
        return new ArrayList<>();
    }


}
