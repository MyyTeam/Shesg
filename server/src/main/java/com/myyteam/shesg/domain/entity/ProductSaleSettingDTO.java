package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class ProductSaleSettingDTO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    private String productid;
    private Long itemcode;
    private String supplierid;
    /**
     * 最小起批量
     */
    private Integer minWholesaleQty;
    /**
     * 备货期
     */
    private Integer leadingtime;
    /**
     * 买家一次最大购买量
     */
    private Integer maxSaleQty;
    /**
     * 买家最大价格
     */
    private Double maxBuyerPrice;
    /**
     * 买家最小价格
     */
    private Double minBuyerPrice;
    /**
     * 折扣区间设置方式 ， 1为分别设置价格 ， 0为统一设置价格
     */
    private Integer priceConfigType;
}