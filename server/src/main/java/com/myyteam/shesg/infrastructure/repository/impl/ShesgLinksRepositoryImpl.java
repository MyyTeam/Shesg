package com.myyteam.shesg.infrastructure.repository.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.myyteam.shesg.enums.LinkAvailableEnum;
import com.myyteam.shesg.enums.LinkTypeEnum;
import com.myyteam.shesg.infrastructure.persistence.mapper.ShesgLinksMapper;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgLinksDO;
import com.myyteam.shesg.infrastructure.repository.ShesgLinksRepository;
import com.myyteam.shesg.web.vo.ShesgLinksVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import java.util.List;

@Service
@Slf4j
public class ShesgLinksRepositoryImpl implements ShesgLinksRepository {

    @Resource
    private ShesgLinksMapper shesgLinksMapper;

    @Override
    public void saveLinksData(ShesgLinksDO shesgLinksDO) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getId, shesgLinksDO.getId());
        ShesgLinksDO exist = shesgLinksMapper.selectOne(qw);
        if (!ObjectUtils.isEmpty(exist)) {
            shesgLinksMapper.update(shesgLinksDO, qw);
        } else {
            shesgLinksMapper.insert(shesgLinksDO);
        }
    }

    @Override
    public void deleteLink(String id) {
        shesgLinksMapper.update(null, Wrappers.<ShesgLinksDO>lambdaUpdate().eq(ShesgLinksDO::getId, id)
                .set(ShesgLinksDO::getIsDelete, true));
    }

    @Override
    public List<ShesgLinksVO> findLinks(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId)
                .eq(ShesgLinksDO::getIsDelete, false)
                .orderByDesc(ShesgLinksDO::getRank);
        return BeanUtil.copyToList(shesgLinksMapper.selectList(qw), ShesgLinksVO.class);
    }

    @Override
    public List<ShesgLinksVO> findUserLinks(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).eq(ShesgLinksDO::getIsAvailable, LinkAvailableEnum.AVAILABLE.getCode()).orderByDesc(ShesgLinksDO::getRank);
        return BeanUtil.copyToList(shesgLinksMapper.selectList(qw), ShesgLinksVO.class);
    }

    @Override
    public List<ShesgLinksDO> findProductsLink(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).eq(ShesgLinksDO::getType, LinkTypeEnum.PRODUCT_LINK.getCode());
        return shesgLinksMapper.selectList(qw);
    }

    @Override
    public List<ShesgLinksDO> findNormalLinks(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).eq(ShesgLinksDO::getType, LinkTypeEnum.NORMAL_LINK.getCode());
        return shesgLinksMapper.selectList(qw);
    }

    @Override
    public List<ShesgLinksDO> findHeaderLinks(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).eq(ShesgLinksDO::getType, LinkTypeEnum.GROUP_LINK.getCode());
        return shesgLinksMapper.selectList(qw);
    }

    @Override
    public ShesgLinksDO findMaxRankLink(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).orderByDesc(ShesgLinksDO::getRank).last("limit 1");
        return shesgLinksMapper.selectOne(qw);
    }
}
