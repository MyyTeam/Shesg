package com.myyteam.shesg.common;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Result<T> {

    private final int code;
    private final String msg;
    private final T data;

    public static <T> Result<T> succeed(T data) {
        return new Result<T>(200, "success", data);
    }
}
