package com.myyteam.shesg.domain;

import com.myyteam.shesg.web.vo.CollectionLinksVO;
import com.myyteam.shesg.web.vo.LinksMyyVO;

import java.util.List;

public interface ShesgLinksService {

    List<LinksMyyVO> findLinks(String userId);

    List<LinksMyyVO> findUserLinks(String userId);

    String saveSingleLink(LinksMyyVO linksRequestVo);

    void saveLinks(List<LinksMyyVO> linksRequestVos);

    Boolean deleteLink(String userId, String linkId, Integer type);

    CollectionLinksVO getUserCollectionLinks(String userId);
}
