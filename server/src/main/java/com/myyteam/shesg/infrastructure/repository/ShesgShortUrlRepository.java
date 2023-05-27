package com.myyteam.shesg.infrastructure.repository;

import com.myyteam.shesg.infrastructure.persistence.model.ShesgShortUrlDO;

public interface ShesgShortUrlRepository {

    void save(ShesgShortUrlDO shortUrlDO);
}
