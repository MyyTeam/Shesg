package com.myyteam.shesg.domain.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.myyteam.shesg.domain.ShesgLinksService;
import com.myyteam.shesg.enums.LinkTypeEnum;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgLinksDO;
import com.myyteam.shesg.infrastructure.repository.ShesgLinksRepository;
import com.myyteam.shesg.web.vo.CollectionLinksVO;
import com.myyteam.shesg.web.vo.ShesgLinksVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Objects;

@Service
@Slf4j
public class ShesgLinksServiceImpl implements ShesgLinksService {

    @Resource
    private ShesgLinksRepository shesgLinksRepository;

    @Override
    public List<ShesgLinksVO> findLinks(String userId) {
        return shesgLinksRepository.findLinks(userId);
    }

    @Override
    public List<ShesgLinksVO> findUserLinks(String userId) {
        return shesgLinksRepository.findUserLinks(userId);
    }

    @Override
    public String saveSingleLink(ShesgLinksVO linksRequestVo) {
        String userId = linksRequestVo.getUserId();
        ShesgLinksDO shesgLinksDO = BeanUtil.copyProperties(linksRequestVo, ShesgLinksDO.class);
        if (StrUtil.isBlank(shesgLinksDO.getId())) {
            shesgLinksDO.setId(IdUtil.getSnowflake().nextIdStr());
        }
        shesgLinksDO.setShesgUserId(userId);
        if (Objects.isNull(shesgLinksDO.getType())) {
            shesgLinksDO.setType(LinkTypeEnum.NORMAL_LINK.getCode());
        }
        ShesgLinksDO maxRankDO = shesgLinksRepository.findMaxRankLink(userId);
        if (Objects.nonNull(maxRankDO)) {
            shesgLinksDO.setRank(maxRankDO.getRank() + 1);
        }

        if (StrUtil.isBlank(linksRequestVo.getTitle())) {
            shesgLinksDO.setTitle("Title");
        }
        shesgLinksRepository.saveLinksData(shesgLinksDO);
        return shesgLinksDO.getId();
    }

    @Override
    public synchronized void saveLinks(List<ShesgLinksVO> linksRequestVos) {
        for (ShesgLinksVO shesgLinksVo : linksRequestVos) {
            ShesgLinksDO shesgLinksDO = BeanUtil.copyProperties(shesgLinksVo, ShesgLinksDO.class);
            if (StrUtil.isBlank(shesgLinksDO.getId())) {
                shesgLinksDO.setId(IdUtil.getSnowflake().nextIdStr());
            }
            shesgLinksDO.setShesgUserId(shesgLinksVo.getUserId());
            shesgLinksRepository.saveLinksData(shesgLinksDO);
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteLink(String userId, String linkId, Integer type) {
        shesgLinksRepository.deleteLink(linkId);
        return Boolean.TRUE;
    }

    @Override
    public CollectionLinksVO getUserCollectionLinks(String userId) {
        CollectionLinksVO vo = new CollectionLinksVO();
        vo.setProductsNum(shesgLinksRepository.findProductsLink(userId).size());
        vo.setNormalNum(shesgLinksRepository.findNormalLinks(userId).size());
        vo.setHeaderNum(shesgLinksRepository.findHeaderLinks(userId).size());
        return vo;
    }
}
