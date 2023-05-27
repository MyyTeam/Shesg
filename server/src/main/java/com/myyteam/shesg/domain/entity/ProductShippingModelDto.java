package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Description 运费模板表
 *
 * @author Created by quwenxiang on 2022/1/12.
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class ProductShippingModelDto {

    private Long id;

    private String shippingModelId;

    private Long itemcode;

    private String supplierId;

    private String dropShipperId;

    private String shipsFrom;

    private String shipsTo;

    private BigDecimal shippingCost;

    private String shippingMethod;

    private Date estimatedDeliveryTime;

    private Date createdAt;

    private Date updatedAt;

    private Integer isFreeShip;

    private Integer valid;
}
