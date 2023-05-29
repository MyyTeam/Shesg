package com.myyteam.shesg.infrastructure.repository;

import com.myyteam.shesg.infrastructure.persistence.model.ShesgLinksDO;
import com.myyteam.shesg.web.vo.ShesgLinksVO;

import java.util.List;

public interface ShesgLinksRepository {
    void saveLinksData(ShesgLinksDO shesgLinksDO);

    void deleteLink(String id);

    List<ShesgLinksVO> findLinks(String userId);

    List<ShesgLinksVO> findUserLinks(String userId);

    List<ShesgLinksDO> findProductsLink(String userId);

    List<ShesgLinksDO> findNormalLinks(String userId);

    List<ShesgLinksDO> findHeaderLinks(String userId);

    ShesgLinksDO findMaxRankLink(String userId);


}
