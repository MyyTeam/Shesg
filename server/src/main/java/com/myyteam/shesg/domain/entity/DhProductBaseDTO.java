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
public class DhProductBaseDTO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;
    private String productid;
    private String productname;
    private String shortdescription;
    private Long itemcode;
    private String htmlurl;
    private String htmlContent;
    private String htmlmd5;
    private String supplierid;
    private String keywords;
    private String videourl;
    private String factoryname;
    private String productPromiseUrl;
    /**
     * 星级
     */
    private String averageScore;
    /**
     * review数量
     */
    private String reviewCount;
    /**
     * 历史交易量
     */
    private String transactions;
}