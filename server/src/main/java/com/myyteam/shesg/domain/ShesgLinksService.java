package com.myyteam.shesg.domain;

import com.myyteam.shesg.web.vo.CollectionLinksVO;
import com.myyteam.shesg.web.vo.ShesgLinksVO;

import java.util.List;

public interface ShesgLinksService {

    List<ShesgLinksVO> findLinks(String userId);

    List<ShesgLinksVO> findUserLinks(String userId);

    String saveSingleLink(ShesgLinksVO linksRequestVo);

    void saveLinks(List<ShesgLinksVO> linksRequestVos);

    Boolean deleteLink(String userId, String linkId, Integer type);

    CollectionLinksVO getUserCollectionLinks(String userId);
}
