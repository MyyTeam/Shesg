package com.myyteam.shesg.domain;

import com.myyteam.shesg.domain.entity.DhProductDTO;

public interface GetGateInfoService {

    DhProductDTO getGateProductInfo(Long outItemCode);
}
