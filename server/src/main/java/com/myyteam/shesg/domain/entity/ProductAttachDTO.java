package com.myyteam.shesg.domain.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Date;

/**
 * Description 业务描叙信息
 *
 * @author Created by quwenxiang on 2021/7/2.
 */
@Data
@JsonIgnoreProperties(ignoreUnknown = true)
public class  ProductAttachDTO implements java.io.Serializable {

    private static final long serialVersionUID = 1L;
    // Fields

    private Long productattachid;
    /**
     * 文件URL地址
     */
    private String fileurl;
    /**
     * 文件名
     */
    private String filename;
    /**
     * 类型
     */
    private Integer type;
    /**
     * 排序序列号
     */
    private Integer sequence;
    /**
     * 更新时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date uploaddate;
    /**
     * 有效性
     */
    private Integer valid;
    /**
     * DM5值
     */
    private String imgmd5;
    /**
     * MD5校验码生成时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date md5operdate;
    /**
     * 敦煌商品itemcode
     */
    private Long itemcode;
    /**
     * 图片宽
     */
    private Integer width;
    /**
     * 图片高
     */
    private Integer height;

}