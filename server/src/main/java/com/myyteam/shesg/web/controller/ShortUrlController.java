package com.myyteam.shesg.web.controller;

import com.myyteam.shesg.common.Result;
import com.myyteam.shesg.domain.ShortUrlService;
import com.myyteam.shesg.web.vo.ShortUrlVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/shesg/short-url")
@Slf4j
public class ShortUrlController {

    @Resource
    private ShortUrlService shortUrlService;

    @GetMapping("/generate/short-link")
    public Result<ShortUrlVO> generateShortLink(String userId, @RequestParam(value = "url") String url) {
        return Result.succeed(shortUrlService.generateShortLink(userId, url));
    }
}
