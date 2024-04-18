package com.project.user.service.dao;

import java.util.ArrayList;


import com.project.user.vo.UserVO;



public interface UserDAO {

	
	ArrayList <UserVO> getAllUser();
	
	void insertUserinfo(UserVO userVO);
	
	UserVO getUserinfo(UserVO userVO);
	
	void userUpdate(UserVO userVO);
	
	void userDelete(UserVO userVO);
	
	UserVO findMemberId(UserVO userVO);
	
	UserVO login(UserVO userVO) throws Exception;
	
	UserVO kakaologin(UserVO userVO) throws Exception;
	
	int idCheck(String id);
	
	int emailCheck(String email);
	
	int userPwdCheck(UserVO userVO);
	
	void passwordUpdate(UserVO userVO);
	
}
