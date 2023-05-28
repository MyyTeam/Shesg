package com.myyteam.shesg.domain.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/1/26.
 */
@Data
public class ProductSkuWithPriceDTO {

    /**
     * skuId
     */
    private Long skuId;
    /**
     * 产品编码
     */
    private Long itemcode;
    /**
     * 用户id
     */
    private String supplierid;
    /**
     * 创建时间
     */
    private Date createDate;
    /**
     * 更新时间
     */
    private Date updateDate;
    /**
     *
     */
    private String skuCode;
    /**
     * 零售价
     */
    private Double retailPrice;
    /**
     * 库存
     */
    private Integer inventory;
    /**
     * 销售状态
     */
    private Integer saleStatus;
    /**
     * 描述
     */
    private String description;
    /**
     *
     */
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
     * sku 促销价格
     */
    private Double promotionPrice;
    /**
     * sku 分销价格
     */
    private Double dsPrice;
    /**
     * sku库存信息
     */
    List<ProductSkuInvenDTO> prodSkuInvenList;
    /**
     * sku库存信息
     */
    List<ProductSkuAttrval> productSkuAttrvalList;


    @Data
    public static class ProductSkuInvenDTO {
        /**
         * id
         */
        private Long skuInvenId;
        /**
         * 产品编码
         */
        private Long itemcode;
        /**
         *
         */
        private String skuMd5;
        /**
         *
         */
        private String inventoryLocation;
        /**
         * 库存地
         */
        private Integer skuInventoryQty;
        /**
         * sku库存
         */
        private String skuCode;
        /**
         * 备货期
         */
        private Integer leadingTime;
        /**
         * 销售状态
         */
        private Integer saleStatus;
        /**
         *
         */
        private Date createDate;
        /**
         *
         */
        private Date updateDate;
        /**
         *
         */
        private Long skuId;
    }

    @Data
    public static class ProductSkuAttrval {

        /**
         *
         */
        private Long attrId;
        /**
         *
         */
        private String attrName;
        /**
         *
         */
        private Long attrValId;
        /**
         *
         */
        private String isCustomsized;
        /**
         *
         */
        private Long itemcode;
        /**
         *
         */
        private String lineAttrvalName;
        /**
         *
         */
        private String lineAttrvalNameCn;
        /**
         *
         */
        private String picUrl;
        /**
         *
         */
        private Long sizeSpecType;
        /**
         *
         */
        private Long skuId;
        /**
         *
         */
        private String skuMd5;
        /**
         *
         */
        private String sortVal;
        /**
         *
         */
        private Long tdProSkuAttrvalId;

    }
}
