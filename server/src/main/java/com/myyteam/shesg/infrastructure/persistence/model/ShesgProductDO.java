package com.myyteam.shesg.infrastructure.persistence.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
@TableName("shesg_product")
public class ShesgProductDO extends Model<ShesgProductDO> {

    @TableId(type = IdType.INPUT)
    private Long productId;

    private String productUrl;

    private String productTitle;

    private String productImageUrl;

    private BigDecimal productPrice;

    private Boolean isDelete;

    private Date createdAt;

    private Date updatedAt;

    private String collection;

    private String category;

    private String details;

    private String detailsSummary;
}

