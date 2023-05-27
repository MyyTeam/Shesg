package com.myyteam.shesg.infrastructure.repository.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.myyteam.shesg.infrastructure.persistence.mapper.ShesgWhiteUserMapper;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgWhiteUserDO;
import com.myyteam.shesg.infrastructure.repository.ShesgWhiteUserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.Objects;

@Slf4j
@Repository
public class ShesgWhiteUserRepositoryImpl implements ShesgWhiteUserRepository {

    @Resource
    private ShesgWhiteUserMapper whiteUserMapper;

    @Override
    public Boolean checkWhiteUser(String userId) {
        LambdaQueryWrapper<ShesgWhiteUserDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgWhiteUserDO::getUserId, userId).isNotNull(ShesgWhiteUserDO::getWhiteUserSign);
        ShesgWhiteUserDO exist = whiteUserMapper.selectOne(qw);
        if (Objects.isNull(exist)) {
            return Boolean.FALSE;
        } else {
            return Boolean.TRUE;
        }
    }
}
