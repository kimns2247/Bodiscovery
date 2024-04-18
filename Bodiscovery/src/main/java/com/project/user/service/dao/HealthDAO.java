package com.project.user.service.dao;

import java.util.ArrayList;

import com.project.user.vo.HealthVO;
import com.project.user.vo.MerchantVO;


public interface HealthDAO {

	//전체 상품 출력
	ArrayList<HealthVO> getAllItem();
	
	//선택 상품 출력
	HealthVO ItemGet(HealthVO healthVO);
	
	//카트 추가
	void CartAdd(HealthVO healthVO);
	
	//카트 보기
	ArrayList <HealthVO> CartView(String id);

	//카트 부분 삭제
	void CartDel(String id, String cart);
	
	//카트 전체 비우기
	void CartDelAll(HealthVO healthVO);
	
	//식단 보기
	ArrayList <HealthVO> MyMeal();
	
	
	void insertPurchase(MerchantVO merchantVO);
	
	ArrayList <MerchantVO> Purchase_list(String id) throws Exception;

	
		
//	//카트 수정
//	public int updateCart(HealthVO healthVO);
//		


}
