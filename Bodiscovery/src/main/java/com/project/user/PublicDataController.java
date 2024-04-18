package com.project.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.user.service.PublicDataService;
import com.project.user.util.ComUtil;
import com.project.user.vo.PublicDataVO;
import com.project.user.vo.StaticVO;
import com.project.user.vo.UserVO;


@Controller      /* 이 클래스가 스프링 MVC의 컨트롤러임을 나타내는 애노테이션 */
@RequestMapping(value = "/publicData")  /* 처리하는 요청 URL의 기본 경로,즉 /publicData 경로 아래의 요청은 이 컨트롤러가 처리 */
public class PublicDataController {

	@Resource(name = "publicDataService")	//@Autowired : type ,publicDataService라는 이름으로 등록된 빈을 주입하는 애노테이션 , 해당 빈은 PublicDataService 인터페이스를 구현한 클래스의 인스턴스 ,주입된 서비스를 통해 비즈니스 로직을 처리
	private PublicDataService publicDataService;	// PublicDataService 타입의 멤버 변수인 publicDataService를 선언하는 코드


   	/** ComUtil */
   	public ComUtil util = new ComUtil();

	/** StaticVO */
   	protected StaticVO staticVO = new StaticVO();

	//map 예제 소스
	@RequestMapping(value = "/main.do")     /* /publicData/main.do 요청을 처리하는 메서드를 지정하는 애노테이션 */
	public String main(HttpServletRequest request, Model model, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		//HttpServletRequest request: HTTP 요청 정보를 담고 있는 객체
		//Model model: 컨트롤러에서 뷰로 데이터를 전달하기 위한 객체
		//@ModelAttribute("publicDataVO") PublicDataVO publicDataVO: 요청 파라미터를 객체에 바인딩하는 애노테이션 / publicDataVO라는 이름으로 PublicDataVO 객체를 생성하고, 요청 파라미터를 해당 객체에 바인딩
		request.setCharacterEncoding("UTF-8");

		return "publicData/main";  //요청을 처리한 후에 반환되는 뷰의 이름 ,적절한 뷰를 찾아 클라이언트에게 반환 / 여기서는 "publicData/main"을 반환하여 "publicData" 폴더 안에 있는 "main.jsp"를 뷰로 사용
	}

	//목록
	@RequestMapping(value="/list_user.do")
	public String list(HttpServletRequest request, Model model, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		//로그인 세션
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		if(userVO != null) { //로그인이 되어있으면
			 //관리자 ID 체크, admin이면 관리자 페이지로 이동
			if("admin".equals(userVO.getId())) {
				return "redirect:/publicData/list_admin.do";
			}
		}
		
		//페이징 처리
        int nowPage	  = util.getInt(publicDataVO.getNowPage(),0);
        int totalCount = publicDataService.getListCnt(publicDataVO);

		//페이지 S
        staticVO = util.setPage("oracle",nowPage, totalCount);
        publicDataVO.setFirstRecord(util.getStr(staticVO.getFirstRecord()));
		publicDataVO.setLastRecord(util.getStr(staticVO.getLastRecord()));
		publicDataVO.setPageSize(util.getStr(staticVO.getPageSize()));

		ArrayList<PublicDataVO> list = publicDataService.getPagingList(publicDataVO);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		//페이지 E

        model.addAttribute("staticVO", staticVO);
		model.addAttribute("publicDataVO", publicDataVO);
		
		return "publicData/list_user";
	}
    
	
	//목록
	@RequestMapping(value="/list_admin.do")
	public String adminList(HttpServletRequest request, Model model, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		//로그인 세션
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		if(userVO == null) { //로그인이 안되어있으면 로그인 화면으로 전환
			return "redirect:/login1.do";
		}else {
			 //로그인이 되어있지만 관리자 ID가 아니면 main 페이지로 이동(관리자 ID 체크, 현재 admin ID만 체크중..)
			if(!"admin".equals(userVO.getId())) {
				return "redirect:/publicData/list_user.do";
			}
		}
		
		//페이징 처리
        int nowPage	  = util.getInt(publicDataVO.getNowPage(),0);
        int totalCount = publicDataService.getListCnt(publicDataVO);

		//페이지 S
        staticVO = util.setPage("oracle",nowPage, totalCount);
        publicDataVO.setFirstRecord(util.getStr(staticVO.getFirstRecord()));
		publicDataVO.setLastRecord(util.getStr(staticVO.getLastRecord()));
		publicDataVO.setPageSize(util.getStr(staticVO.getPageSize()));

		ArrayList<PublicDataVO> list = publicDataService.getPagingList(publicDataVO);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		//페이지 E

        model.addAttribute("staticVO", staticVO);
		model.addAttribute("publicDataVO", publicDataVO);
		
		return "publicData/list_admin";
	}

	//목록 ajax
	@RequestMapping(value="/ajaxList.do", produces = "application/json; charset=utf8")
	public @ResponseBody Object ajaxList(HttpServletRequest request, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");

		ArrayList<PublicDataVO> list = publicDataService.getList(publicDataVO);
		return list;
	}

	//상세 화면
	@RequestMapping(value="/detail.do")
	public String detail(HttpServletRequest request, Model model, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		//로그인 세션
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		if(userVO == null) { //로그인이 안되어있으면 로그인 화면으로 전환
			return "redirect:/login1.do";
		}else {
			 //로그인이 되어있지만 관리자 ID가 아니면 main 페이지로 이동(관리자 ID 체크, 현재 admin ID만 체크중..)
			if(!"admin".equals(userVO.getId())) {
				return "redirect:/main.do";
			}
		}
		
		PublicDataVO detail = publicDataService.detailPublicData(publicDataVO);
		model.addAttribute("detail", detail);

		model.addAttribute("publicDataVO", publicDataVO);
		return "publicData/detail";
	}

	//등록 화면
	@RequestMapping(value="/insert.do")
	public String create(HttpServletRequest request, Model model, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		//로그인 세션
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		if(userVO == null) { //로그인이 안되어있으면 로그인 화면으로 전환
			return "redirect:/login1.do";
		}else {
			 //로그인이 되어있지만 관리자 ID가 아니면 main 페이지로 이동(관리자 ID 체크, 현재 admin ID만 체크중..)\
			// admin일 경우에는 CRUD가 가능한 페이지로 리다이렉트
			if(!"admin".equals(userVO.getId())) {
				return "redirect:/main.do";
			}
		}
		
		model.addAttribute("publicDataVO", publicDataVO);
		return "publicData/form";
	}

	//등록 ajax
	@RequestMapping(value="/ajaxInsert.do")
	public @ResponseBody Object ajaxInsert(HttpServletRequest request, @ModelAttribute PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> resultMap = new HashMap<>();
		try {
			System.out.println(publicDataVO.getType());
			System.out.println(publicDataVO.getAddr());
			System.out.println("AAAAA");
			int id = publicDataService.getMaxId(publicDataVO);
			publicDataVO.setId(Integer.toString(id));
			System.out.println(id);
			publicDataService.insertPublicData(publicDataVO);

			System.out.println("AAAAA1");

			resultMap.put("status", true);
			resultMap.put("msg", "정상적으로 등록되었습니다.");

		}catch (Exception e) {
			System.out.println(e);
			resultMap.put("status", false);
			resultMap.put("msg", "오류가 발생했습니다.");
		}

		return resultMap;
	}


	//수정 화면
	@RequestMapping(value="/update.do")
	public String update(HttpServletRequest request, Model model, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		//로그인 세션
		HttpSession session = request.getSession();
		UserVO userVO = (UserVO)session.getAttribute("user");
		if(userVO == null) { //로그인이 안되어있으면 로그인 화면으로 전환
			return "redirect:/login1.do";
		}else {
			 //로그인이 되어있지만 관리자 ID가 아니면 main 페이지로 이동(관리자 ID 체크, 현재 admin ID만 체크중..)
			if(!"admin".equals(userVO.getId())) {
				return "redirect:/main.do";
			}
		}
				
		PublicDataVO detail = publicDataService.detailPublicData(publicDataVO);
		
		model.addAttribute("detail", detail);

		model.addAttribute("publicDataVO", publicDataVO);
		return "publicData/form";
	}

	//수정 ajax
	@RequestMapping(value="/ajaxUpdate.do", produces = "application/json; charset=utf8")
	public @ResponseBody Object ajaxUpdate(HttpServletRequest request, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> resultMap = new HashMap<>();
		try {
			publicDataService.updatePublicData(publicDataVO);

			resultMap.put("status", true);
			resultMap.put("msg", "정상적으로 수정되었습니다.");

		}catch (Exception e) {
			resultMap.put("status", false);
			resultMap.put("msg", "오류가 발생했습니다.");
		}

		return resultMap;
	}


	//삭제 ajax
	@RequestMapping(value="/ajaxDelete.do", produces = "application/json; charset=utf8")
	public @ResponseBody Object ajaxDelete(HttpServletRequest request, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> resultMap = new HashMap<>();
		try {
			publicDataService.deletePublicData(publicDataVO);

			resultMap.put("status", true);
			resultMap.put("msg", "정상적으로 삭제되었습니다.");

		}catch (Exception e) {
			resultMap.put("status", false);
			resultMap.put("msg", "오류가 발생했습니다.");
		}

		return resultMap;
	}


	//map List ajax
	@RequestMapping(value="/ajaxMapList.do", produces = "application/json; charset=utf8")
	public @ResponseBody Object ajaxMapList(HttpServletRequest request, @ModelAttribute("publicDataVO") PublicDataVO publicDataVO) throws Exception {
		request.setCharacterEncoding("UTF-8");
		Map<String, Object> resultMap = new HashMap<>();

		ArrayList<PublicDataVO> list = publicDataService.getList(publicDataVO);

		resultMap.put("list", list);

		return resultMap;
	}


 }


/*
 * memo Controller의 역할 컨트롤러는 웹 애플리케이션의 요청을 처리하고 응답을 생성하는 역할 컨트롤러는 클라이언트로부터 HTTP
 * 요청을 받아 해당 요청을 처리하고, 그 결과로 HTTP 응답을 생성하여 클라이언트에게 반환 ( 요청 처리 , 비즈니스 로직 호출, 데이터
 * 처리,응답 생성,뷰 호출 )
 * 
 * 등록화면에는 ADMIN 아이디 확인하는 걸 안넣은 이유는 
 *  화면 안에서 실행되는 스크립트 ajax를 통해서 온거라 화면이 안켜지면 ajax도 실행 할수 없으니까 안넣음
 */
