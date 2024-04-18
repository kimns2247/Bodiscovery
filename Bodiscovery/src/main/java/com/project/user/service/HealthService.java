package com.project.user.service;

import java.io.BufferedReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.user.vo.HealthVO;
import com.project.user.vo.MerchantVO;


public interface HealthService {
	
	//상품 전체보기
	ArrayList <HealthVO> getAllItem() throws Exception;
		
	//선택상품 1개 보기
	HealthVO ItemGet(HealthVO healthVO);
		
	//카트 추가
	void CartAdd(HealthVO healthVO);
		
	//카트 보기
	ArrayList <HealthVO> CartView(String id) throws Exception;
		
	//카트 부분 삭제
	void CartDel(String id, String cart);
		
	//카드 전체 비우기
	void CartDelAll(HealthVO healthVO);
		
	//식단 보기
	ArrayList <HealthVO> MyMeal() throws Exception;
	
	
	void insertPurchase(MerchantVO merchantVO);
	
	ArrayList <MerchantVO> Purchase_list(String id) throws Exception;
	

	

}
