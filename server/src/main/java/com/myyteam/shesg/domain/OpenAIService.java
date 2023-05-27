package com.myyteam.shesg.domain;

import com.myyteam.shesg.web.param.ChatParam;
import com.myyteam.shesg.web.param.SaveSocialPostParam;
import com.myyteam.shesg.web.vo.AIRecommendVO;
import com.myyteam.shesg.web.vo.ChatVO;

import java.util.List;

public interface OpenAIService {
    List<AIRecommendVO> recommend(String userId);

    Boolean saveSocialPost(SaveSocialPostParam saveSocialPostParam);

    ChatVO chat(ChatParam chatParam);

    String summary(String productId);
}
