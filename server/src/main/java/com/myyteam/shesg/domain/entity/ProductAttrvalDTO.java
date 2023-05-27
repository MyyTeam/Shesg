package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Date;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class ProductAttrvalDTO implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 产品属性值id
     */
    private Long prodAttrValId;
    /**
     * 属性id
     */
    private Long attrId;
    /**
     * 属性名称
     */
    private String attrName;
    /**
     * 图片url路径
     */
    private String picUrl;
    private Long itemcode;
    /**
     * 属性值id
     */
    private Long attrValId;
    /**
     * 属性值名称
     */
    private String lineAttrvalName;
    /**
     * 属性值中文名称
     */
    private String lineAttrvalNameCn;
    /**
     * 是否验证
     */
    private Integer isverified;
    /**
     * 产品属性id
     */
    private Long prodAttrId;
    private String operator;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date operatortime;
    /**
     * 是否是私有值（卖家输入的值）
     */
    private Integer isprivate;
    /**
     * 是否定制属性值
     */
    private Integer isCustomsized;
    private Integer sortVal;
    /**
     * 品牌id
     */
    private String brandId;
}