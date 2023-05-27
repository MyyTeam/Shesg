package com.myyteam.shesg.infrastructure.persistence;

import com.myyteam.shesg.infrastructure.persistence.model.ShesgLinksDO;
import com.myyteam.shesg.web.vo.LinksMyyVO;
import org.mapstruct.Mapper;
import org.mapstruct.NullValueCheckStrategy;
import org.mapstruct.NullValuePropertyMappingStrategy;
import org.mapstruct.factory.Mappers;

@Mapper(componentModel = "spring",
        nullValueCheckStrategy = NullValueCheckStrategy.ALWAYS,
        nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
public interface ShesgLinksAssembler {

    ShesgLinksAssembler INSTANCE = Mappers.getMapper(ShesgLinksAssembler.class);

    ShesgLinksDO toEntity(LinksMyyVO vo);

    LinksMyyVO toVO(ShesgLinksDO shesgLinksDOS);

}
