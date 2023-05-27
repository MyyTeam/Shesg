package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.List;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ProductAttrDTO implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    // Fields
    /**
     * 商品属性编号
     */
    private Long prodAttrId;
    private Long attrId;
    /**
     * 属性英文名
     */
    private String attrName;
    /**
     *
     */
    private String attrNameCn;
    /**
     * 属性值选择类型(1：单选、2：多选)
     */
    private Integer type;
    /**
     * 属性显示样式
     */
    private Integer style;
    /**
     * 是否销售属性（1：是销售属性，0：非销售属性）
     */
    private Integer saleAttr;
    /**
     * 是否购买属性（1：是购买属性，0：非购买属性）
     */
    private Integer buyAttr;
    private Long itemcode;
    /**
     * 是否是品牌属性（1：是，0：非）
     */
    private Integer isbrand;
    /**
     * 是否是自定义属性，0 “否”， 1“是”
     */
    private Integer selfDefine;
    private Long sortVal;
    /**
     * 属性值列表
     */
    private List<ProductAttrvalDTO> productAttrvalList;

}