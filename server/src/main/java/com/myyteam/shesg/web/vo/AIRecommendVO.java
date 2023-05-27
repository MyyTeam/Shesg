package com.myyteam.shesg.web.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class AIRecommendVO {

    private Long productId;

    private String title;

    private String imageUrl;

    private BigDecimal price;

    private String rate;

    private String productUrl;

    private String details;

    public String getRate() {
        return "15%";
    }
}
