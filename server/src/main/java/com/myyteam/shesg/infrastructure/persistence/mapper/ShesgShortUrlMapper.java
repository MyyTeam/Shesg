package com.myyteam.shesg.infrastructure.persistence.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgShortUrlDO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ShesgShortUrlMapper extends BaseMapper<ShesgShortUrlDO> {

}
