package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Date;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2022/1/12.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class DhProductSkuInvenDTO implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    private Long skuInvenId;

    private Long itemcode;

    private String skuMd5;

    private String inventoryLocation;

    private Integer skuInventoryQty;

    private String skuCode;

    private Integer leadingTime;

    private Integer saleStatus;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createDate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateDate;
    private Long skuId;

}
