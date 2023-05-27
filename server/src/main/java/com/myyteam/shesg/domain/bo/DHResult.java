
package com.myyteam.shesg.domain.bo;

import lombok.Data;

import java.util.List;

@Data
public class DHResult<T> {

    /**
     *
     */
    private Boolean ack;
    /**
     *
     */
    private List<Object> businessErrList;
    /**
     *
     */
    private Boolean businessError;
    /**
     *
     */
    private T data;
    /**
     *
     */
    private List<Object> paramErrList;
    /**
     *
     */
    private Boolean paramError;
    /**
     *
     */
    private String systemErrCode;
    /**
     *
     */
    private String systemErrMessage;
    /**
     *
     */
    private Boolean systemError;
    /**
     *
     */
    private String version;

}
