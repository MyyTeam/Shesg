package com.myyteam.shesg.enums;

import lombok.Getter;

@Getter
public enum LinkAvailableEnum {

    /**
     * 0-下架
     */
    NOT_AVAILABLE(0, "下架"),
    /**
     * 1-上架
     */
    AVAILABLE(1, "上架"),
    /**
     * 2-删除
     */
    DELETED(2, "删除");

    private final Integer code;

    private final String text;

    LinkAvailableEnum(Integer code, String text) {
        this.code = code;
        this.text = text;
    }

}
