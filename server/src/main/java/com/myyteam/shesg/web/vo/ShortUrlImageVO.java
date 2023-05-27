package com.myyteam.shesg.web.vo;

import lombok.Data;

import java.util.List;

@Data
public class ShortUrlImageVO {

    private String productName;

    List<SampleImageVO> sampleImageVOS;

}
