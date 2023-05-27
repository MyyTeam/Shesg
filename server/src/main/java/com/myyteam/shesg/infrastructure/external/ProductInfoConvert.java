package com.myyteam.shesg.infrastructure.external;


import com.myyteam.shesg.domain.entity.DhProductDTO;

public interface ProductInfoConvert {

    String getProductPrice(String itemCode, DhProductDTO dhProductDTO);

}
