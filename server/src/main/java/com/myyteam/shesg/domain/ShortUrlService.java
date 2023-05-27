package com.myyteam.shesg.domain;

import com.myyteam.shesg.web.vo.ShortUrlVO;

public interface ShortUrlService {

    ShortUrlVO generateShortLink(String userId, String url);

}
