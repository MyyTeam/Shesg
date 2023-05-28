package com.myyteam.shesg.domain.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.myyteam.shesg.common.Constants;
import com.myyteam.shesg.domain.ShortUrlService;
import com.myyteam.shesg.infrastructure.persistence.model.ShesgShortUrlDO;
import com.myyteam.shesg.infrastructure.repository.ShesgShortUrlRepository;
import com.myyteam.shesg.infrastructure.repository.ShesgWhiteUserRepository;
import com.myyteam.shesg.utils.GateUtil;
import com.myyteam.shesg.web.vo.ShortUrlVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
@Slf4j
public class ShortUrlServiceImpl implements ShortUrlService {

    @Resource
    private ShesgShortUrlRepository shortUrlRepository;

    @Resource
    private ShesgWhiteUserRepository shesgWhiteUserRepository;

    @Override
    public ShortUrlVO generateShortLink(String userId, String url) {
        if (url.contains("\\") || url.contains("@") || url.contains("#") || url.contains("$") || url.contains("¥")) {
            throw new RuntimeException("Your url contains illegal characters!");
        }

        if (StrUtil.isNotBlank(url) && ((url.contains(Constants.GATE_PRE)) || url.contains(Constants.SHESG_PRE))) {
            if (url.contains(Constants.SHESG_PRE) && !shesgWhiteUserRepository.checkWhiteUser(userId)) {
                throw new RuntimeException("Only gate url can generate short url.");
            }
            String codeId = IdUtil.getSnowflake().nextIdStr();
            String shortCode = GateUtil.toSerialCode(Long.parseLong(codeId));
            ShesgShortUrlDO shortUrlDO = new ShesgShortUrlDO();
            shortUrlDO.setId(codeId);
            shortUrlDO.setShortUrl(shortCode);
            shortUrlRepository.save(shortUrlDO);

            return BeanUtil.copyProperties(shortUrlDO, ShortUrlVO.class);
        } else {
            throw new RuntimeException("You can only generate for dhgate link!");
        }
    }

}
