package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ProductSkuDTO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    private Long skuId;
    private Long itemcode;
    private String supplierid;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createDate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateDate;
    private String skuCode;
    /**
     * 外部商品原价.对应内部 originPrice
     */
    private Double retailPrice;
    /**
     * 库存
     */
    private Integer inventory;
    private Integer saleStatus;
    private String description;
    private String skuMd5;
    /**
     * sku最大买家价格
     */
    private Double maxBuyerPrice;
    /**
     * sku最小买家价格
     */
    private Double minBuyerPrice;
    /**
     * sku库存信息
     */
    private List<DhProductSkuInvenDTO> prodSkuInvenList;
    /**
     * 标识SKU价格的类型。
     * 0:null,1:buyer价格,2:seller价格。
     */
    private Integer priceType;
    /**
     * sk属性列表
     */
    private List<ProductSkuAttrvalDTO> productSkuAttrvalList;

    //lite内部商品属性
    /**
     * 内部商品原价
     */
    private BigDecimal originPrice;
    /**
     * 内部商品佣金
     */
    private BigDecimal commission;
    /**
     * 内部划线价
     */
    private BigDecimal marketPrice;

}