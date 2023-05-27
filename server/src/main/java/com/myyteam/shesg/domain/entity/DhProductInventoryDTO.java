package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class DhProductInventoryDTO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;

    private String productid;
    private Long itemcode;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createDate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateDate;
    private String supplierid;
    /**
     * 是否有备货：0或空"否", 1是
     */
    private Integer inventoryStatus;
    /**
     * 多备货项目后已废除
     */
    private String inventoryLocation;
    /**
     * 备货量，冗余的字段。该字段是TD_PRODUCT_INVENTORY中的和值
     */
    private Integer inventoryQty;
    /**
     * 原备货量，syi或者通过备货设置、批量备货设置的值。
     */
    private Integer inventoryOriQty;
    private Integer inventoryType;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date operateDate;
    /**
     * 产品库存地址
     */
    private List<DhProductInventoryLocationDTO> invenLocationList;

}