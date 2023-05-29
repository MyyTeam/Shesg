package com.myyteam.shesg.enums;

import lombok.Getter;

@Getter
public enum LinkTypeEnum {

    /**
     * 0-普通模块
     */
    NORMAL_LINK(0, "普通模块"),
    /**
     * 4，分栏管理模块
     */
    GROUP_LINK(4, "分栏管理模块"),
    /**
     * 5,商品模块
     */
    PRODUCT_LINK(5, "商品模块");

    private final Integer code;

    private final String text;

    LinkTypeEnum(Integer code, String text) {
        this.code = code;
        this.text = text;
    }
}
