package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.io.Serializable;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class ProductSkuAttrvalDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    // Fields
    private Long tdProSkuAttrvalId;
    private Long itemcode;
    private Long skuId;
    private Integer attrId;
    private Integer attrValId;
    private Integer sizeSpecType;

    private String attrName;
    private String lineAttrvalName;
    private String lineAttrvalNameCn;
    private String picUrl;
    private Integer isCustomsized;
    private Integer sortVal;
    private String skuMd5;
    // 备货地定价需求：8888代表"Shipping from
    private String attrValCode;
}