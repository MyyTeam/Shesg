package com.myyteam.shesg.enums;

import lombok.Getter;

@Getter
public enum LinkTypeEnum {

    /**
     * 0-普通模块
     */
    NORMAL_LINK(0, "普通模块"),
    /**
     * 1-选品模块
     */
    SELECT_LINK(1, "选品模块"),
    /**
     * 2,优惠券模块
     */
    COUPON_LINK(2, "优惠券模块"),
    /**
     * 3，运营选品模块
     */
    PICK_PRODUCT_LINK(3, "运营选品模块"),
    /**
     * 4，分栏管理模块
     */
    GROUP_LINK(4, "分栏管理模块"),
    /**
     * 5,gate商品模块
     */
    GATE_PRODUCT_LINK(5, "gate商品模块"),
    /**
     * 6,联盟商品模块
     */
    LEAGUE_LINK(6, "联盟商品模块");

    private final Integer code;

    private final String text;

    LinkTypeEnum(Integer code, String text) {
        this.code = code;
        this.text = text;
    }
}
