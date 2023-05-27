package com.myyteam.shesg.infrastructure.persistence.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@TableName("shesg_short_url")
public class ShesgShortUrlDO extends Model<ShesgShortUrlDO> {

    /**
     * id 主键
     */
    @TableId(type = IdType.INPUT)
    private String id;

    /**
     * 短链链接
     */
    private String shortUrl;

    /**
     * 原本的链接
     */
    private String originalUrl;

    /**
     * 分库分表标识位
     */
    private Integer shortUrlSign;
}
