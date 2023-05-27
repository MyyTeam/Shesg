package com.myyteam.shesg.web.controller;

import com.myyteam.shesg.common.Result;
import com.myyteam.shesg.domain.OpenAIService;
import com.myyteam.shesg.web.param.ChatParam;
import com.myyteam.shesg.web.param.RecommendParam;
import com.myyteam.shesg.web.param.SaveSocialPostParam;
import com.myyteam.shesg.web.vo.AIRecommendVO;
import com.myyteam.shesg.web.vo.ChatVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/shesg/openai")
@RequiredArgsConstructor
public class OpenAIController {

    private final OpenAIService openAIService;

    @PostMapping("/recommend")
    public Result<List<AIRecommendVO>> recommend(@RequestBody RecommendParam recommendParam) {
        return Result.succeed(openAIService.recommend(recommendParam.getUserId()));
    }

    @PostMapping("/socialPost")
    public Result<Boolean> saveSocialPost(@RequestBody SaveSocialPostParam saveSocialPostParam) {
        return Result.succeed(openAIService.saveSocialPost(saveSocialPostParam));
    }

    @PostMapping("/chat")
    public Result<ChatVO> chat(@RequestBody ChatParam chatParam) {
        return Result.succeed(openAIService.chat(chatParam));
    }

    @GetMapping("/summaryProduct")
    public Result<String> summary(String productId) {
        return Result.succeed(openAIService.summary(productId));
    }
}
