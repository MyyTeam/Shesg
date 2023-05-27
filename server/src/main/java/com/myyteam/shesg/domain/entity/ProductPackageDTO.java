package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.math.BigDecimal;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class ProductPackageDTO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;
    private String productid;
    private String measureid;
    private BigDecimal length;
    private BigDecimal width;
    private BigDecimal height;
    private Long itemcode;
    private Integer packingquantity;
    private BigDecimal grossweight;
    private String supplierid;
    private Integer lots;
}