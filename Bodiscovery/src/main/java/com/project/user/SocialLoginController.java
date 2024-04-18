package com.project.user;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.user.service.UserService;
import com.project.user.service.impl.KakaoLoginServiceImpl;
import com.project.user.vo.UserVO;


@Controller
public class SocialLoginController {

	   @Resource(name="userService")
	   private UserService userService;
	   
	
	@Autowired
	private KakaoLoginServiceImpl ks;
	
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, UserVO userVO, HttpServletRequest request) throws Exception{
		
		 HttpSession session = request.getSession();
		
		System.out.println("code: " + code);
	
		// 위에서 만든 코드 아래에 코드 추가
		String access_Token = ks.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		
		
		// 위에서 만든 코드 아래에 코드 추가
				HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
				System.out.println("###access_Token#### : " + access_Token);
				System.out.println("###nickname#### : " + userInfo.get("nickname"));
				System.out.println("###email#### : " + userInfo.get("email"));
				
				String email = (String) userInfo.get("email");
				
				userVO.setEmail(email);
				UserVO kakaologin = userService.kakaologin(userVO);
				
				session.setAttribute("user", kakaologin);
				
			
		return "redirect:/main.do";
		
	}
}
