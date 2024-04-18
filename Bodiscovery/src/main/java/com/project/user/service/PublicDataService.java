package com.project.user.service;

import java.util.ArrayList;

import com.project.user.vo.PublicDataVO;

public interface PublicDataService {
    ArrayList<PublicDataVO> getList(PublicDataVO vo) throws Exception;
    ArrayList<PublicDataVO> getPagingList(PublicDataVO vo) throws Exception;
    int getListCnt(PublicDataVO vo) throws Exception;

    PublicDataVO detailPublicData(PublicDataVO vo) throws Exception;
    int getMaxId(PublicDataVO vo) throws Exception;
    void insertPublicData(PublicDataVO vo) throws Exception;
    void updatePublicData(PublicDataVO vo) throws Exception;
    void deletePublicData(PublicDataVO vo) throws Exception;
  
}
