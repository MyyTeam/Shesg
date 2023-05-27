package com.myyteam.shesg.infrastructure.repository.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.myyteam.shesg.infrastructure.persistence.mapper.ShesgShortUrlMapper;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgShortUrlDO;
import com.myyteam.shesg.infrastructure.repository.ShesgShortUrlRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Objects;

@Slf4j
@Repository
public class ShesgShortUrlRepositoryImpl implements ShesgShortUrlRepository {

    @Resource
    private ShesgShortUrlMapper shortUrlMapper;

    @Override
    public void save(ShesgShortUrlDO shortUrlDO) {
        LambdaQueryWrapper<ShesgShortUrlDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgShortUrlDO::getId, shortUrlDO.getId()).isNotNull(ShesgShortUrlDO::getShortUrlSign);
        ShesgShortUrlDO exist = shortUrlMapper.selectOne(qw);
        if (Objects.nonNull(exist)) {
            shortUrlMapper.update(shortUrlDO, qw);
        } else {
            shortUrlMapper.insert(shortUrlDO);
        }
    }
}
