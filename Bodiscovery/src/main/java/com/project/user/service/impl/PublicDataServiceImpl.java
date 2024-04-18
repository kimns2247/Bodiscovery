package com.project.user.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.user.service.PublicDataService;
import com.project.user.service.dao.PublicDataDAO;
import com.project.user.vo.PublicDataVO;

@Service("publicDataService")
public class PublicDataServiceImpl implements PublicDataService { //SawonServiceImpl.java


	@Autowired        /* 객체의 의존성을 자동으로 주입 */
	private PublicDataDAO publicDataDAO;

	@Override
	public ArrayList<PublicDataVO> getList(PublicDataVO vo) throws Exception {
		return publicDataDAO.getList(vo);
	}
	@Override
	public ArrayList<PublicDataVO> getPagingList(PublicDataVO vo) throws Exception {
		return publicDataDAO.getPagingList(vo);
	}
	@Override
	public int getListCnt(PublicDataVO vo) throws Exception {
		return publicDataDAO.getListCnt(vo);
	}

	@Override
	public PublicDataVO detailPublicData(PublicDataVO vo) throws Exception {
		return publicDataDAO.detailPublicData(vo);
	}

	@Override
	public int getMaxId(PublicDataVO vo) throws Exception {
		return publicDataDAO.getMaxId(vo);
	}
	@Override
	public void insertPublicData(PublicDataVO vo) throws Exception {
		publicDataDAO.insertPublicData(vo);
	}

	@Override
	public void updatePublicData(PublicDataVO vo) throws Exception {
		publicDataDAO.updatePublicData(vo);
	}

	@Override
	public void deletePublicData(PublicDataVO vo) throws Exception {
		publicDataDAO.deletePublicData(vo);
	}

}





/*
 * memo PublicDataServiceImpl 클래스는 서비스 계층의 비즈니스 로직을 구현하고, 데이터 액세스 계층과의 의존성을 관리하여
 * 스프링 애플리케이션의 기능을 제공하는 역할
 */
