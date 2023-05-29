package com.myyteam.shesg.infrastructure.persistence.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

@EqualsAndHashCode(callSuper = false)
@TableName("shesg_links")
@Data
public class ShesgLinksDO extends Model<ShesgLinksDO> {

    /**
     * id 主键
     */
    @TableId(type = IdType.INPUT)
    private String id;

    /**
     * 用户id
     */
    private String shesgUserId;

    /**
     * 链接
     */
    private String url;

    /**
     * 标题
     */
    private String title;

    /**
     * link图片
     */
    private String image;

    /**
     * 是否可用 0-不可用 1 - 可用
     */
    private Integer isAvailable;

    /**
     * 类型 0-普通模块 1-选品模块
     */
    private Integer type;

    /**
     * 顺序位次
     */
    private Integer rank;

    /**
     * 链接描述
     */
    private String description;

    /**
     * 商品的汇率
     */
    private BigDecimal rate;

    /**
     * 商品的价格
     */
    private BigDecimal productPrice;

    /**
     * 佣金金额
     */
    private BigDecimal commissionAmount;

    private Boolean isDelete;
}
