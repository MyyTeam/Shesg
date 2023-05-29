package com.myyteam.shesg.domain;

import com.myyteam.shesg.web.param.SaveSocialPostParam;
import com.myyteam.shesg.web.vo.AIRecommendVO;

import java.util.List;

public interface OpenAIService {
    List<AIRecommendVO> recommend(String userId);

    Boolean saveSocialPost(SaveSocialPostParam saveSocialPostParam);

    String summary(String productId);
}
