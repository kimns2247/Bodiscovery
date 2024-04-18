package com.project.user.service.dao;

import java.util.ArrayList;

import com.project.user.vo.PublicDataVO;

//mapper interface
public interface PublicDataDAO { // interface & mapping
	//목록
	public ArrayList<PublicDataVO> getList(PublicDataVO vo);
	public ArrayList<PublicDataVO> getPagingList(PublicDataVO vo);
	public int getListCnt(PublicDataVO vo);

	//상세
	public PublicDataVO detailPublicData(PublicDataVO vo);

	//등록
	public int getMaxId(PublicDataVO vo);
	public void insertPublicData(PublicDataVO vo);

	//수정
	public void updatePublicData(PublicDataVO vo);

	//삭제
	public void deletePublicData(PublicDataVO vo);
}





/*
 * memo
 * PublicDataDAO 인터페이스는 데이터 액세스 객체의 역할을 정의하고, 서비스 계층과의 느슨한 결합을 유지하여 시스템의 유연성과 확장성을 높이는 데 기여
 * (데이터 액세스 기능 정의 :인터페이스로, 실제 데이터베이스에 접근하여 CRUD(Create, Read, Update, Delete) 작업을 수행하는 메서드들을 정의
 *  서비스 계층과 데이터 액세스 계층의 분리 : 서비스 계층과 데이터 액세스 계층 사이의 인터페이스 역할 이를 통해 서비스 계층은 데이터 액세스에 대한 구체적인 구현에 의존하지 않고, 인터페이스를 통해 데이터 액세스 기능을 호출 ,의존성 역전 원칙을 따르고 유연한 시스템을 구축하는 데 도움
 *  메서드 시그니처 정의: 각 메서드는 데이터 액세스에 필요한 파라미터를 받고, 필요한 경우 결과를 반환합니다. 이를 통해 서비스 계층은 목록 조회, 상세 조회, 등록, 수정, 삭제 등의 데이터 액세스 기능을 사용할 수 있습니다.
    명확한 역할 분리: 데이터 액세스 기능을 담당하는 메서드들이 한 곳에 모여 있어 코드의 가독성과 유지보수성을 높임 , 또한 인터페이스를 통해 다양한 데이터 액세스 기술을 적용)
 *
 *
 *
 *
 *  )
 *
 */




