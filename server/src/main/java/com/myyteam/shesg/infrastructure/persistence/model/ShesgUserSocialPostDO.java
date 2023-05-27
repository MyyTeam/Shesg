package com.myyteam.shesg.infrastructure.persistence.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.*;

import java.util.Date;

@EqualsAndHashCode(callSuper = true)
@Data
@TableName("shesg_user_social_post")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShesgUserSocialPostDO extends Model<ShesgUserSocialPostDO> {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String userId;

    private String socialPost;

    private Date createdAt;

    private Date updatedAt;

    private String openaiRecommendCategory;
}
