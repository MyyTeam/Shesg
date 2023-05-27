package com.myyteam.shesg.infrastructure.persistence;

import com.myyteam.shesg.infrastructure.persistence.model.ShesgShortUrlDO;
import com.myyteam.shesg.web.vo.ShortUrlVO;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.factory.Mappers;

/**
 * @author zhangyixin
 */
@Mapper(componentModel = "spring",
        nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface ShortUrlAssembler {

    ShortUrlAssembler INSTANCE = Mappers.getMapper(ShortUrlAssembler.class);

    ShortUrlVO toVO(ShesgShortUrlDO shortUrlDO);


}
