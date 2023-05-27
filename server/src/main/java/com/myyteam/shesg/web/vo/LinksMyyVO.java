package com.myyteam.shesg.web.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class LinksMyyVO {

    private String userId;

    private String id;

    private String url;

    private String title;

    private String image;

    private Integer isAvailable;

    private Integer type;

    private Integer rank;

    private String redirectUrl;

    private String description;

    private String gateItemcode;

    private BigDecimal rate;

    private BigDecimal commissionAmount;

    private BigDecimal productPrice;

    private String headerLinkId;
}
