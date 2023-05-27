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
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class DhProductInventoryLocationDTO implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    private Long invenLocationId;

    private String supplierId;

    private Long itemcode;

    private String inventoryLocation;

    private Long inventoryLocationQty;

    private Integer leadingTime;//备货地址备货期

    private Integer sortVal;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createDate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateDate;
}
