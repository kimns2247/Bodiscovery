package com.project.user.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.user.service.HealthService;
import com.project.user.service.dao.HealthDAO;
import com.project.user.vo.HealthVO;
import com.project.user.vo.MerchantVO;


@Service("healthService")
public class HealthServiceImpl implements HealthService {
	
	@Autowired
	private HealthDAO healthkaja;
	
	@Override
	@Transactional
	public ArrayList <HealthVO> getAllItem() {		//전체 상품 출력
		return healthkaja.getAllItem();
	}
	
	public HealthVO ItemGet(HealthVO healthVO) {	//선택 상품 출력
		return healthkaja.ItemGet(healthVO);
	}
	
	public void CartAdd(HealthVO healthVO) {		//장바구니 추가
		healthkaja.CartAdd(healthVO);
	}
	
	public ArrayList<HealthVO> CartView(String id) {//장바구니 보기
	      return healthkaja.CartView(id);
	}
	
	public void CartDel(String id, String cart) {   //장바구니 부분 삭제
	      healthkaja.CartDel(id, cart);
	}

	public void CartDelAll(HealthVO healthVO) {		//장바구니 전체 비우기
		healthkaja.CartDelAll(healthVO);
	}
	
	public ArrayList<HealthVO> MyMeal() {
		return healthkaja.MyMeal();
	}
	
	public void insertPurchase(MerchantVO merchantVO) {
		healthkaja.insertPurchase(merchantVO);
	}
	
	public ArrayList<MerchantVO> Purchase_list(String id) throws Exception {
		return healthkaja.Purchase_list(id);
	}
	


			
		
	}



