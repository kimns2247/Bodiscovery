package com.project.user.service;

import java.util.ArrayList;



import com.project.user.vo.UserVO;

public interface UserService {

	ArrayList <UserVO> getAllUser() throws Exception;
	
	void insertUserinfo(UserVO userVO);
	
	UserVO getUserinfo(UserVO userVO);
	
	void userUpdate(UserVO userVO);
	
	void userDelete(UserVO userVO) throws Exception;

	// ----------------------------------
	
	UserVO findMemberId(UserVO userVO);
	
	int userPwdCheck(UserVO userVO);
	
	void passwordUpdate(UserVO userVO);

	UserVO login(UserVO userVO) throws Exception;
	
	UserVO kakaologin(UserVO userVO) throws Exception;

	public int idCheck(String id);
	
	public int emailCheck(String email);

	

}