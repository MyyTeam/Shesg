package com.myyteam.shesg.domain.bo;

import lombok.Data;

import java.io.Serializable;

/**
 * Description
 * 参数形式 paramNum=3&param1=EN&param2=ff8080816533074f01656113274f3300&param3=548937515
 *
 * @author Created by quwenxiang on 2021/7/29.
 */
@Data
public class ParamBO implements Serializable {

    /**
     * 参数数量
     */
    private Integer paramNum;
    /**
     * 参数
     */
    private String param1;
    private String param2;
    private String param3;
    private String param4;
    private String param5;
    private String param6;
    private String param7;
    private String param8;
    private String param9;
    private String param10;

    /**
     * 获取完整的url连接
     */
    public String getUrl(String urlPrefix) {
        StringBuilder url = new StringBuilder(urlPrefix);
        url.append("?");
        url.append("paramNum=").append(paramNum);
        if (paramNum == 0) {
            return url.toString();
        }
        url.append("&param1=").append(param1);
        if (paramNum == 1) {
            return url.toString();
        }
        url.append("&param2=").append(param2);
        if (paramNum == 2) {
            return url.toString();
        }
        url.append("&param3=").append(param3);
        if (paramNum == 3) {
            return url.toString();
        }
        url.append("&param4=").append(param4);
        if (paramNum == 4) {
            return url.toString();
        }
        url.append("&param5=").append(param5);
        if (paramNum == 5) {
            return url.toString();
        }
        url.append("&param6=").append(param6);
        if (paramNum == 6) {
            return url.toString();
        }
        url.append("&param7=").append(param7);
        if (paramNum == 7) {
            return url.toString();
        }
        url.append("&param8=").append(param8);
        if (paramNum == 8) {
            return url.toString();
        }
        url.append("&param9=").append(param9);
        if (paramNum == 9) {
            return url.toString();
        }
        url.append("&param10=").append(param10);
        return url.toString();
    }
}
