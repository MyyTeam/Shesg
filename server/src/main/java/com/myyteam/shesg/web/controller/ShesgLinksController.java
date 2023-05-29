package com.myyteam.shesg.web.controller;

import com.myyteam.shesg.common.Result;
import com.myyteam.shesg.domain.ShesgLinksService;
import com.myyteam.shesg.web.param.QueryLinksParam;
import com.myyteam.shesg.web.vo.CollectionLinksVO;
import com.myyteam.shesg.web.vo.ShesgLinksVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/shesg/product")
@Slf4j
public class ShesgLinksController {

    @Resource
    private ShesgLinksService shesgLinksService;

    @PostMapping("/find/links")
    public Result<List<ShesgLinksVO>> findLinks(@RequestBody QueryLinksParam queryLinksParam) {
        return Result.succeed(shesgLinksService.findLinks(queryLinksParam.getUserId()));
    }

    @PostMapping("/find/user-links")
    public Result<List<ShesgLinksVO>> findUserLinks(@RequestParam(value = "userId") String userId) {
        return Result.succeed(shesgLinksService.findUserLinks(userId));
    }

    @PostMapping("/add/single-link")
    public Result<String> saveLinks(@RequestBody ShesgLinksVO ShesgLinksVO) {
        return Result.succeed(shesgLinksService.saveSingleLink(ShesgLinksVO));
    }

    @PostMapping("/add/links")
    public Result<Boolean> saveLinks(@RequestBody List<ShesgLinksVO> linksRequestVos) {
        shesgLinksService.saveLinks(linksRequestVos);
        return Result.succeed(Boolean.TRUE);
    }

    @GetMapping("/delete/link")
    public Result<Boolean> deleteLinks(String userId, String linkId, Integer type) {
        return Result.succeed(shesgLinksService.deleteLink(userId, linkId, type));
    }

    @GetMapping("/get/user-collection-links")
    public Result<CollectionLinksVO> getUserCollectionLinks(String userId) {
        return Result.succeed(shesgLinksService.getUserCollectionLinks(userId));
    }
}
