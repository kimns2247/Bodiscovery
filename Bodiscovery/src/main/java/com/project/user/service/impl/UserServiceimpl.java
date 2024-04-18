package com.project.user.service.impl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.user.service.UserService;
import com.project.user.service.dao.UserDAO;
import com.project.user.vo.UserVO;

@Service("userService")
public class UserServiceimpl implements UserService{

	@Autowired
	private UserDAO userdao;
	
	@Override
	@Transactional
	public ArrayList<UserVO> getAllUser() {
		
		return userdao.getAllUser();
	}
	
	@Override
	public void insertUserinfo(UserVO userVO) {
		userdao.insertUserinfo(userVO);
	}
	
	@Override
	public UserVO getUserinfo(UserVO userVO) {
		return userdao.getUserinfo(userVO);
	}
	
	@Override
	public void userDelete(UserVO userVO) throws Exception{
		userdao.userDelete(userVO);
	}
	
	@Override
	public void userUpdate(UserVO userVO){
		userdao.userUpdate(userVO);  //받은 VO를 다시 dao로 보내기
	}
		
	@Override
	public UserVO findMemberId(UserVO userVO) {
		return userdao.findMemberId(userVO);
	}
	
	
	@Override
	public UserVO login(UserVO userVO) throws Exception{
		return userdao.login(userVO);
		
	}
	
	@Override
	public UserVO kakaologin(UserVO userVO) throws Exception{
		return userdao.kakaologin(userVO);
		
	}
	
	
	
	@Override
	public int userPwdCheck(UserVO userVO) {
	    return userdao.userPwdCheck(userVO);
	}
	 
	@Override
	public void passwordUpdate(UserVO userVO) {
	    userdao.passwordUpdate(userVO);
	}
			
	@Override
	public int emailCheck(String email) {
		int cnt = userdao.emailCheck(email);
		System.out.println("서비스 임플리에서 이메일 cnt가 몇인가? cnt: " + cnt);
		return cnt;
	}			
			
			
	
	//아이디 중복체크 mapper 접근
	@Override
	public int idCheck(String id) {
		int cnt = userdao.idCheck(id);
		System.out.println("서비스 임플리에서 아이디 cnt가 몇인가? cnt: " + cnt);
		return cnt;
	}	

	
	
}
