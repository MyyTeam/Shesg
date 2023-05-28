package com.myyteam.shesg.domain.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.myyteam.shesg.common.Constants;
import com.myyteam.shesg.domain.GetGateInfoService;
import com.myyteam.shesg.domain.ShesgLinksService;
import com.myyteam.shesg.domain.entity.DhProductDTO;
import com.myyteam.shesg.enums.LinkTypeEnum;
import com.myyteam.shesg.infrastructure.external.ProductInfoConvert;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgLinksDO;
import com.myyteam.shesg.infrastructure.repository.ShesgLinksRepository;
import com.myyteam.shesg.utils.GateUtil;
import com.myyteam.shesg.web.vo.CollectionLinksVO;
import com.myyteam.shesg.web.vo.ShesgLinksVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@Slf4j
public class ShesgLinksServiceImpl implements ShesgLinksService {

    @Resource
    private ShesgLinksRepository shesgLinksRepository;

    @Resource
    private GetGateInfoService getGateInfoService;

    @Resource
    private ProductInfoConvert productInfoConvert;

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

        //判断是否需要重定向，加aid后缀以及type的类型
        if (StrUtil.isNotBlank(linksRequestVo.getUrl()) && linksRequestVo.getUrl().contains(Constants.GATE_PRODUCT_PRE)) {
            shesgLinksDO.setType(LinkTypeEnum.GATE_PRODUCT_LINK.getCode());
            // 按指定模式在字符串查找
            String line = linksRequestVo.getUrl();
            String pattern = "\\d+.html";
            // 创建 Pattern 对象
            Pattern r = Pattern.compile(pattern);
            // 现在创建 matcher 对象
            Matcher m = r.matcher(line);
            if (m.find()) {
                String itemCode = m.group(0).replace(".html", "");
                shesgLinksDO.setGateItemcode(itemCode);
                //设置商品
                DhProductDTO dhProductDTO = getGateInfoService.getGateProductInfo(Long.valueOf(itemCode));
                if (Objects.isNull(dhProductDTO)) {
                    throw new RuntimeException("Can not find this product.");
                }
                if (StrUtil.isBlank(linksRequestVo.getTitle())) {
                    shesgLinksDO.setTitle(dhProductDTO.getProductBaseDTO().getProductname());
                }
                shesgLinksDO.setImage(GateUtil.getDhgateImageUrl(dhProductDTO.getImageurl()));
                shesgLinksDO.setUrl(Constants.GATE_HTTP_PRE + dhProductDTO.getProductUrl());
                shesgLinksDO.setIsAvailable(dhProductDTO.getIstate());
                //价格
                String price = productInfoConvert.getProductPrice(itemCode, dhProductDTO);
                shesgLinksDO.setProductPrice(new BigDecimal(price));

                // 佣金固定15%
                BigDecimal rate = new BigDecimal("0.15");
                shesgLinksDO.setRate(rate);
                BigDecimal commissionAmount = new BigDecimal(price).multiply(rate).divide(BigDecimal.valueOf(100), 2, RoundingMode.HALF_UP);
                shesgLinksDO.setCommissionAmount(commissionAmount);
            }
        }

        //2022.11.8处理header
        if (StrUtil.isNotBlank(linksRequestVo.getHeaderLinkId())) {
            ShesgLinksDO headerLink = shesgLinksRepository.getLinkData(linksRequestVo.getHeaderLinkId());
            int headerRank = headerLink.getRank();
            List<ShesgLinksDO> prepareLinks = shesgLinksRepository.getPrePareLinks(userId, headerRank);
            shesgLinksDO.setRank(headerRank);
            shesgLinksRepository.saveLinksData(shesgLinksDO);
            for (ShesgLinksDO itemLink : prepareLinks) {
                ShesgLinksDO newLink = new ShesgLinksDO();
                newLink.setRank(itemLink.getRank() + 1);
                newLink.setId(itemLink.getId());
                shesgLinksRepository.saveLinksData(newLink);
            }
        } else {
            shesgLinksRepository.saveLinksData(shesgLinksDO);
        }
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
        if (type.equals(1)) {
            shesgLinksRepository.deleteLink(linkId);
        } else {
            ShesgLinksDO headerMaxLink = shesgLinksRepository.getLinkData(linkId);
            int maxRank = headerMaxLink.getRank();
            int minRank = shesgLinksRepository.getHeaderMinLink(userId, maxRank);
            shesgLinksRepository.deleteLinkBetweenRank(userId, minRank, maxRank);
        }
        return Boolean.TRUE;
    }

    @Override
    public CollectionLinksVO getUserCollectionLinks(String userId) {
        CollectionLinksVO vo = new CollectionLinksVO();
        vo.setProductsNum(shesgLinksRepository.findGateProductsLink(userId).size());
        vo.setNormalNum(shesgLinksRepository.findNormalLinks(userId).size());
        vo.setHeaderNum(shesgLinksRepository.findHeaderLinks(userId).size());
        return vo;
    }
}
