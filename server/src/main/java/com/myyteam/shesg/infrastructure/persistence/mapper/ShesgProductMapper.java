package com.myyteam.shesg.infrastructure.persistence.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgProductDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShesgProductMapper extends BaseMapper<ShesgProductDO> {
}
