package com.myyteam.shesg.infrastructure.repository.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
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
import java.util.Objects;

@Service
@Slf4j
public class ShesgLinksRepositoryImpl implements ShesgLinksRepository {

    @Resource
    private ShesgLinksMapper shesgLinksMapper;

    @Override
    public void saveLinksData(ShesgLinksDO shesgLinksDO) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getId, shesgLinksDO.getId()).isNotNull(ShesgLinksDO::getLinkSign);
        ShesgLinksDO exist = shesgLinksMapper.selectOne(qw);
        if (!ObjectUtils.isEmpty(exist)) {
            shesgLinksMapper.update(shesgLinksDO, qw);
        } else {
            shesgLinksMapper.insert(shesgLinksDO);
        }
    }

    @Override
    public void deleteLink(String id) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getId, id).isNotNull(ShesgLinksDO::getLinkSign);
        shesgLinksMapper.update(null, Wrappers.<ShesgLinksDO>lambdaUpdate().eq(ShesgLinksDO::getId, id)
                .isNotNull(ShesgLinksDO::getLinkSign).set(ShesgLinksDO::getIsDelete, true));
    }

    @Override
    public ShesgLinksDO getLinkData(String id) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getId, id).isNotNull(ShesgLinksDO::getLinkSign);
        return shesgLinksMapper.selectOne(qw);
    }

    @Override
    public List<ShesgLinksVO> findLinks(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId)
                .isNotNull(ShesgLinksDO::getLinkSign)
                .eq(ShesgLinksDO::getIsDelete, false)
                .orderByDesc(ShesgLinksDO::getRank);
        return BeanUtil.copyToList(shesgLinksMapper.selectList(qw), ShesgLinksVO.class);
    }

    @Override
    public List<ShesgLinksVO> findUserLinks(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).eq(ShesgLinksDO::getIsAvailable, LinkAvailableEnum.AVAILABLE.getCode()).isNotNull(ShesgLinksDO::getLinkSign).orderByDesc(ShesgLinksDO::getRank);
        return BeanUtil.copyToList(shesgLinksMapper.selectList(qw), ShesgLinksVO.class);
    }

    @Override
    public List<ShesgLinksDO> findGateProductsLink(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).eq(ShesgLinksDO::getType, LinkTypeEnum.GATE_PRODUCT_LINK.getCode()).isNotNull(ShesgLinksDO::getLinkSign);
        return shesgLinksMapper.selectList(qw);
    }

    @Override
    public List<ShesgLinksDO> findNormalLinks(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).eq(ShesgLinksDO::getType, LinkTypeEnum.NORMAL_LINK.getCode()).isNotNull(ShesgLinksDO::getLinkSign);
        return shesgLinksMapper.selectList(qw);
    }

    @Override
    public List<ShesgLinksDO> findHeaderLinks(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).eq(ShesgLinksDO::getType, LinkTypeEnum.GROUP_LINK.getCode()).isNotNull(ShesgLinksDO::getLinkSign);
        return shesgLinksMapper.selectList(qw);
    }

    @Override
    public ShesgLinksDO findMaxRankLink(String userId) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId).isNotNull(ShesgLinksDO::getLinkSign).orderByDesc(ShesgLinksDO::getRank).last("limit 1");
        return shesgLinksMapper.selectOne(qw);
    }

    @Override
    public List<ShesgLinksDO> getPrePareLinks(String userId, int headerRank) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId)
                .ge(ShesgLinksDO::getRank, headerRank)
                .isNotNull(ShesgLinksDO::getLinkSign);
        return shesgLinksMapper.selectList(qw);
    }

    @Override
    public int getHeaderMinLink(String userId, int maxRank) {
        LambdaQueryWrapper<ShesgLinksDO> qw = new LambdaQueryWrapper<>();
        qw.eq(ShesgLinksDO::getShesgUserId, userId)
                .eq(ShesgLinksDO::getType, LinkTypeEnum.GROUP_LINK.getCode())
                .lt(ShesgLinksDO::getRank, maxRank)
                .isNotNull(ShesgLinksDO::getLinkSign)
                .orderByDesc(ShesgLinksDO::getRank).last("limit 1");
        ShesgLinksDO linksDO = shesgLinksMapper.selectOne(qw);
        return Objects.isNull(linksDO) ? 0 : linksDO.getRank();
    }

    @Override
    public void deleteLinkBetweenRank(String userId, int minRank, int maxRank) {
        LambdaUpdateWrapper<ShesgLinksDO> lambdaUpdateWrapper = Wrappers.<ShesgLinksDO>lambdaUpdate().eq(ShesgLinksDO::getShesgUserId, userId)
                .le(ShesgLinksDO::getRank, maxRank)
                .gt(ShesgLinksDO::getRank, minRank)
                .ne(ShesgLinksDO::getType, LinkTypeEnum.LEAGUE_LINK.getCode())
                .isNotNull(ShesgLinksDO::getLinkSign)
                .set(ShesgLinksDO::getIsDelete, true);
        shesgLinksMapper.update(null, lambdaUpdateWrapper);
    }
}
