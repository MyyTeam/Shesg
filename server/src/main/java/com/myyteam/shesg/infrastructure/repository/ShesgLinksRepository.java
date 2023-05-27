package com.myyteam.shesg.infrastructure.repository;

import com.myyteam.shesg.infrastructure.persistence.model.ShesgLinksDO;
import com.myyteam.shesg.web.vo.LinksMyyVO;

import java.util.List;

public interface ShesgLinksRepository {
    void saveLinksData(ShesgLinksDO shesgLinksDO);

    void deleteLink(String id);

    ShesgLinksDO getLinkData(String id);

    List<LinksMyyVO> findLinks(String userId);

    List<LinksMyyVO> findUserLinks(String userId);

    List<ShesgLinksDO> findGateProductsLink(String userId);

    List<ShesgLinksDO> findNormalLinks(String userId);

    List<ShesgLinksDO> findHeaderLinks(String userId);

    ShesgLinksDO findMaxRankLink(String userId);

    List<ShesgLinksDO> getPrePareLinks(String userId, int headerRank);

    int getHeaderMinLink(String userId, int maxRank);

    void deleteLinkBetweenRank(String userId, int minRank, int maxRank);

}
