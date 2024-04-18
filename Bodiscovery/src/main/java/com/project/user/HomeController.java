package com.project.user;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.user.service.HealthService;
import com.project.user.service.MealService;
import com.project.user.service.UserService;
import com.project.user.vo.DiaryVO;
import com.project.user.vo.HealthVO;
import com.project.user.vo.MerchantVO;
import com.project.user.vo.SportVO;
import com.project.user.vo.UserVO;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
   
   @Resource(name="userService")
   private UserService userService;
   
   @Resource(name = "healthService")
   private HealthService healthService;
   
   @Resource(name = "mealService")
   private MealService mealService;
   
   
   
   
   @Inject
   BCryptPasswordEncoder pwdEncoder;
      
   @RequestMapping(value = "/userAllShow.do")
   public String userAll(Model model) throws Exception {
   System.out.println("진입성공?");
         
   ArrayList <UserVO> alist = userService.getAllUser();
         
   model.addAttribute("alist", alist);
   
   return "userAll";
   
   }
   
   
   @RequestMapping(value = "/sawonAll.do")
   public String userAllShow(Model model) throws Exception {
   System.out.println("진입성공?");
         
   ArrayList <UserVO> alist = userService.getAllUser();
         
   model.addAttribute("alist", alist);
   
   return "userAll";
   
   }
   
   
   @RequestMapping(value = "/findID")
   public String search_result_id(HttpServletRequest request, Model model,
       @RequestParam(required = true, value = "name") String name, 
       @RequestParam(required = true, value = "email") String email,
       UserVO userVO) {
    
    
   try {
      
      userVO.setName(name);
      userVO.setEmail(email);
      
      UserVO userSearch = userService.findMemberId(userVO);     
       
       model.addAttribute("searchVO", userSearch);
       // model.addattribute로 정보를 결과쪽으로 빼줌.
    
   } catch (Exception e) {      
       model.addAttribute("searchVO", null);
   }
    
   return "/FindIDResult";
   }
   
   
   
   @RequestMapping(value = "/findPW", method = RequestMethod.POST)
   public String search_result_PW(HttpServletRequest request, Model model,
       @RequestParam(required = true, value = "name") String name, 
       @RequestParam(required = true, value = "email") String email,
       @RequestParam(required = true, value = "id") String id,
       UserVO userVO) {
    
    
   try {
      
      System.out.println("사용자가 넘긴값" + name + email + id);
      
      userVO.setName(name);
      userVO.setEmail(email);
      userVO.setId(id);
      
      int userSearch = userService.userPwdCheck(userVO);
      System.out.println(userSearch + "입니다");
      
      if(userSearch == 0 ) {
         model.addAttribute("msg", "입력하신 정보가 올바르지 않습니다! 다시 입력해주세요.");
         return "FindPW";
      }
      
      String newPW = RandomStringUtils.randomAlphanumeric(10);
      String enpassword = pwdEncoder.encode(newPW);
      userVO.setPw(enpassword);
      
      userService.passwordUpdate(userVO);
      
      System.out.println("암호화되기전"+ newPW);
      
      model.addAttribute("newPW",newPW);
      
   } catch (Exception e) {
       System.out.println(e.toString());
       model.addAttribute("msg", "오류가 발생되었습니다.");
   }
   
   
   return "CreateNewPW";
   
   }
   


   
   @RequestMapping("/login")
   public String login(UserVO userVO, HttpServletRequest request, RedirectAttributes rttr)
         throws Exception {
      HttpSession session = request.getSession();
      
      
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");
      
      System.out.println("사용자가 입력한 아이디 "+ id + " 입력한 비번 " + pw);

      //우선적으로 id를 통해 db에 조회해 있는회원인지 조회
      UserVO login = userService.login(userVO);     
      // id로 조회가 되지않는다면 loginFail
      if(login == null) 
          return "loginFail"; 
       // 아이디가 있다면 입력한 pw과 vo에서 가져온 pw 비교 
      boolean pwdMatch = pwdEncoder.matches(userVO.getPw(), login.getPw());   
         if(pwdMatch == true) {
            session.setAttribute("user", login);
            return "main";
         }else {
            return "loginFail";
         }
           
      }
   
   
   
   @RequestMapping(value = "/logout", method = RequestMethod.GET)
   public String logout(HttpSession session) throws Exception{
      
      session.invalidate();
      
      return "login";
   }
   
 
   
   @RequestMapping("/connectFindId.do")
   public String connectFindId(UserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response)
         throws ClassNotFoundException, SQLException {
      
      return "FindID";
   }
   
   
   @RequestMapping("/connectFindPw.do")
   public String connectFindPw(UserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response)
         throws ClassNotFoundException, SQLException {
      
      return "FindPW";
   }
   
   
   @RequestMapping("/userUpdateView.do")  //메인에서 내정보보기를 하면 여기로 날아온다.
   public String UpdateView(UserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response)
         throws ClassNotFoundException, SQLException {
      
      return "UpdateView";
   }
   
   
   @RequestMapping(value = "/userUpdate" , method = RequestMethod.POST)  //메인에서 내정보보기를 하면 여기로 날아온다.
   public String UserUpdate(UserVO userVO, HttpSession session,Model model, HttpServletRequest request)
         throws Exception {
   
	  String passPW = request.getParameter("pw");
	  System.out.println("넘겨받은 비밀번호" + passPW);
	  
	  UserVO userCheck = userService.login(userVO);
	  
	  String currentPW = userCheck.getPw();
	  System.out.println("현재 암호화되어있는 비번" + currentPW);
	  
	  if(currentPW.equals(passPW)) {
		  userService.userUpdate(userVO);   
	      session.invalidate();   
	      
	  }else {
		  String enpassword = pwdEncoder.encode(passPW);
	      
	      System.out.println("암호화가 되었나요?" + enpassword);
	      userVO.setPw(enpassword);
	      
	      
	      userService.userUpdate(userVO);   
	      session.invalidate();   
	      
	  }
      
	  return "login";
   }
   
   
   
   @RequestMapping("/deleteUser.do")  //메인에서 내정보보기를 하면 여기로 날아온다.
   public String connectDeleteuser(UserVO userVO, HttpSession session)
         throws ClassNotFoundException, SQLException {
      
      return "DeleteUser"; //****************프론트 업데이트 필요! ***************************
   }
   
   
   @RequestMapping(value = "/deleteUser", method = RequestMethod.POST) 
   public String userDelete(UserVO userVO,HttpSession session) throws Exception {
      
     
      userService.userDelete(userVO);
      session.invalidate();
      return "SecessionComplete";  
      
      
   } 
   
   
   
   
   @RequestMapping("/main.do")
   public String Main(UserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response ,HttpSession session)
         throws ClassNotFoundException, SQLException {
      
      return "main";
   }
   
   
   // 회원가입
   @RequestMapping("/userInsert.do")
   public String UserInsert(@ModelAttribute("userVO") UserVO userVO, Model model) {
         
      return "userInsertForm";
      
   }

   
   
   
   @RequestMapping(value = "/Register.do")
   public String userInsert(@ModelAttribute("sawonVO") UserVO userVO, Model model)throws ClassNotFoundException, SQLException { 
      String inputPass = userVO.getPw();
      
      String pw = pwdEncoder.encode(inputPass); 
      
      userVO.setPw(pw);
      
      userService.insertUserinfo(userVO);    // DB에 회원정보 저장
      
      return "login";
   }
   
   @Autowired
   JavaMailSenderImpl mailSender;
   
   @PostMapping("/EmailAuth")
   @ResponseBody
   public void sendEmail(HttpServletRequest request, HttpServletResponse response, 
         @RequestParam(required = true, value = "email") String email,
         @RequestParam("cert") String cert
         ) throws Exception{
      
      System.out.println("이메일전송시 cert값이 넘어왔나요? " +cert);
      
       String host = "smtp.naver.com"; 
           final String username = "kimns2247"; //네이버 이메일 주소중 @ naver.com 앞주소만 작성
           final String password = "dudgnsWkd10419@1"; //네이버 이메일 비밀번호를 작성
           int port=465;                      //네이버 STMP 포트 번호
           
           //메일 내용 
           String recipient = email; //메일을 받을사람의 이메일이 여기에 기록이 됩니다.
           String subject = "Bodiscovey 인증번호입니다 번호를 입력해주세요";    //메일 발송시 제목을 작성
           String body = "인증번호는 " + cert + "입니다"; //메일 발송시 내용 작성
           
           Properties props = System.getProperties();
          
           props.put("mail.smtp.host", host);
           props.put("mail.smtp.port", port);
           props.put("mail.smtp.auth", "true");
           props.put("mail.smtp.ssl.enable", "true");
           props.put("mail.smtp.ssl.trust", host);
    
           Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
               String un=username;
               String pw=password; 
               protected PasswordAuthentication getPasswordAuthentication() { 
                   return new PasswordAuthentication(un, pw); 
               } 
           });
           session.setDebug(true); //for debug 
           
           Message mimeMessage = new MimeMessage(session); 
           mimeMessage.setFrom(new InternetAddress("kimns2247@naver.com")); 
           mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
           mimeMessage.setSubject(subject); 
           mimeMessage.setText(body); 
           Transport.send(mimeMessage);
       }
   
   
   
   
   //아이디 중복체크
   @RequestMapping("/idCheck")
   @ResponseBody
   public int idCheck(@RequestParam("id") String id) {
      
      System.out.println("idcheck로 " + id);
            
      int cnt = userService.idCheck(id);
      
      System.out.println("idcheck로 다시 넘어온값" + cnt);
      return cnt;         
}
   
   
   // 검색 중복 체크
   @RequestMapping("/menuCheck")
   @ResponseBody
   public int menuCheck(@RequestParam("menu") String menu) {
      
      System.out.println("idcheck로 " + menu);
            
      int cnt = userService.idCheck(menu);
      
      System.out.println("idcheck로 다시 넘어온값" + cnt);
      return cnt;  
   }
   
   //이메일 중복체크
   @RequestMapping("/EmailCheck")
   @ResponseBody
   public int emailCheck(@RequestParam("email") String email) {
      
      System.out.println("email체크로 넘어온 " + email);
                  
      int cnt = userService.emailCheck(email);
      
      System.out.println("emailCheck로 다시 넘어온값" + cnt);
      return cnt;         
}
      
   
   
   
   
         
   
   // 동현이형 부분 상품관련 ------------------------------------------------
   @RequestMapping("/ItemAllView.do")  //메인에서 내정보보기를 하면 여기로 날아온다.
   public String ItemAllView(UserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session)
         throws ClassNotFoundException, SQLException {
      
      return "Product/ItemAll";
   }
   
   
   @RequestMapping("/ItemAll.do")   //상품 전체보기
   public String itemAll(Model model, UserVO userVO, HttpSession session, HttpServletRequest request) throws Exception {
      
      ArrayList<HealthVO> alist = healthService.getAllItem();
      
      model.addAttribute("alist", alist);
      
      return "Product/ItemAll";
   }//itemAll-end
   
   @RequestMapping(value="/ItemGet.do")   //상품 1개 선택시, 출력
   public String ItemGet(@ModelAttribute("healthVO") HealthVO healthVO, Model model, HttpSession session, UserVO userVO) {
      
      // 클라이언트로부터의 요청 파라미터를 healthVO 객체에 매핑하여 전달
       HealthVO result = healthService.ItemGet(healthVO);
       
       // 모델에 결과 데이터를 추가하거나 필요에 따라 뷰 이름을 반환
       model.addAttribute("healthVO", result);
      //healthService.ItemGet(healthVO);
      
      return "Product/ItemGet";
   }//ItemGet-end
   
   @RequestMapping(value="/CartAdd.do")      //장바구니 추가
   public String CartAdd(@ModelAttribute("healthVO") HealthVO healthVO, Model model,HttpSession session, UserVO userVO) {
      
      String userID = healthVO.getId();
      System.out.println("여기서는뭐가나와" + userID);
      healthVO.setId(userID);      
      
      healthService.CartAdd(healthVO);
      
      return "Product/CartConfirm";
   }//addCart-end
   
   @RequestMapping(value="/CartView.do")      //장바구니 보기
   public String CartView(HealthVO healthVO, Model model, HttpSession session, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String userID = request.getParameter("id");
      System.out.println("카트뷰뜰때 아이디값 제대로 넘어오나요?" + userID);
      healthVO.setId(userID);
      ArrayList<HealthVO> h1  = healthService.CartView(userID);
      model.addAttribute("vlist", h1);
      
      return "Product/CartView";
   }//CartView-end
   
   @RequestMapping(value="/CartDel.do")      //장바구니 선택삭제
   public String CartDel(@ModelAttribute("healthVO") HealthVO healthVO, Model model, HttpSession session,  HttpServletRequest request) {
      
      String id = request.getParameter("id");
      String cart = request.getParameter("cart");
      System.out.println("카트딜리트할때 넘어온 id" + id + "넘어온 상품의 넘버는 " + cart);
      healthService.CartDel(id, cart);
      
      return "Product/deleteComplete";
   }//CartDel-end
   
   @RequestMapping(value="/CartDelAll.do")		//장바구니 전체 비우기

	public String CartDelAll(@ModelAttribute("healthVO") HealthVO healthVO, Model model,HttpSession session, UserVO userVO) {

		healthService.CartDelAll(healthVO);

		return "Product/CartDelAll";

	}//CartDelAll-end
   
   

   @RequestMapping("/Order.do")         // 상품 구매 및 결제
   public String BuyItem(Model model, HttpSession session, UserVO userVO,  @RequestParam(required = true, value = "grandTotal") String total) throws Exception {
      
      System.out.println("Order.do 에서 넘겨받는금액 : " + total);
      model.addAttribute("total",total);
      return "Product/Order";
      
   }//MyMeal-end
   
   
   @RequestMapping("/reservation.do")         // 상품 구매 및 결제
   public String reservation(Model model, HttpSession session, UserVO userVO, @RequestParam(required = true, value = "total") String total) throws Exception {
      
    
      System.out.println("reservation.do에 넘어온 토탈값" + total);
      model.addAttribute("total2",total);
      return "Product/reservation";
      
   }//MyMeal-end
   
   
   
   @RequestMapping("/purcomplete")
   public String purcomplete(MerchantVO merchantVO, Model model, HttpServletRequest request, HttpServletResponse response ,UserVO userVO)
         throws ClassNotFoundException, SQLException {
      
      String merchant_uid = request.getParameter("merchant_uid");  //랜덤하게 만들어진값
      String amount = request.getParameter("amount");  // 금액 
      String name = request.getParameter("name");  // 바디스커버리
      String pg = request.getParameter("pg");  //카카오페이
      String id = request.getParameter("userID");  // 안넘어옴....
      
      merchantVO.setId(id);
      System.out.println("merchant_uid는?" + merchant_uid);
      System.out.println("결제성공시 이름 넘어오나?" + name);
      System.out.println("결제성공시넘어오는금액은" + amount);
      System.out.println("결제수단이 뭔가요? " + pg);  
      System.out.println("유저아이디는 무엇인가요?" + id);
      System.out.println(merchantVO.getId() + merchantVO.getMerchant_uid());
      

      return "Product/PurchaseView";
   }
   
   
   @RequestMapping("/takeit")
   public String userTakeit(MerchantVO merchantVO, Model model,HealthVO healthVO, HttpServletRequest request, UserVO userVO ,HttpSession session)
         throws Exception {
      
      String id = request.getParameter("id");
      String healthID = healthVO.getId();
      String MerchantID = merchantVO.getId();
      System.out.println("그냥 아이디는 " + id + "헬스아이디는" + healthID + "멀챈아이디" + MerchantID);
      
      ArrayList <MerchantVO> alist = healthService.Purchase_list(id);
      model.addAttribute("alist", alist);
      
      ArrayList<HealthVO> h1  = healthService.CartView(healthID);
      model.addAttribute("vlist", h1);
      
      return "Product/takeit";
   }
   
   
   
   @RequestMapping("/purchasecomplete.do")         // 상품 구매 및 결제
   public String purchaseComplete(Model model, HttpSession session, UserVO userVO, MerchantVO merchantVO
         , HttpServletRequest request) throws Exception {
      
      String merchant_uid = request.getParameter("merchant_uid");  //랜덤하게 만들어진값
      String amount = request.getParameter("amount");  // 금액 
      String name = request.getParameter("name");  // 바디스커버리
      String pg = request.getParameter("pg");  //카카오페이
      String id = request.getParameter("userID");  // 안넘어옴....
      
      merchantVO.setId(id);
      System.out.println("merchant_uid는?" + merchant_uid);
      System.out.println("결제성공시 이름 넘어오나?" + name);
      System.out.println("결제성공시넘어오는금액은" + amount);
      System.out.println("결제수단이 뭔가요? " + pg);  
      System.out.println("유저아이디는 무엇인가요?" + id);
      System.out.println(merchantVO.getId() + merchantVO.getMerchant_uid());
      
      healthService.insertPurchase(merchantVO);  // 얘까지는 정상 작동.
      
      ArrayList <MerchantVO> alist = healthService.Purchase_list(id);
      model.addAttribute("alist", alist);
      
      
      return "Product/PurchaseView";
      
   }
  
   
   
   @RequestMapping(value="/MyMeal.do")         //식단보기
   public String MyMeal(Model model, HttpSession session, UserVO userVO) throws Exception {
      
      ArrayList<HealthVO> mlist = healthService.MyMeal();
      model.addAttribute("mlist", mlist);
      
      return "Meal/MyMeal";
      
   }//MyMeal-end
   
   

   @RequestMapping("/sportadd")         // 상품 구매 및 결제
   public String sport(Model model, HttpSession session, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String mid = request.getParameter("id");
      System.out.println("운동 추가할때 넘겨받는 아이디" + mid);

      
      
      return "Meal/sport";
      
   }//MyMeal-end
   

   @RequestMapping("/meal1add")         // 상품 구매 및 결제
   public String breakfast(Model model, HttpSession session, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String mid = request.getParameter("id");
      System.out.println("아침식사 추가할때 넘겨받는 아이디" + mid);

      
      
      return "Meal/InsertMeal1";
      
   }//MyMeal-end
   
   @RequestMapping("/meal2add")         // 상품 구매 및 결제
   public String lunch(Model model, HttpSession session, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String mid = request.getParameter("id");
      System.out.println("점심식사 추가할때 넘겨받는 아이디" + mid);

      
      
      return "Meal/InsertMeal2";
      
   }//MyMeal-end
   
   @RequestMapping("/meal3add")         // 상품 구매 및 결제
   public String dinner(Model model, HttpSession session, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String mid = request.getParameter("id");
      System.out.println("저녁식사 추가할때 넘겨받는 아이디" + mid);

      
      
      return "Meal/InsertMeal3";
      
   }//MyMeal-end
   
   @RequestMapping("/meal4add")         // 상품 구매 및 결제
   public String snack(Model model, HttpSession session, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String mid = request.getParameter("id");
      System.out.println("간식 추가할때 넘겨받는 아이디" + mid);

      
      
      return "Meal/InsertSnack";
      
   }//MyMeal-end
   
   
   @RequestMapping("/sportComplete")         
   public String sportComplete(Model model, SportVO sportVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("Id");
      String sport = request.getParameter("sport");
      String duration = request.getParameter("duration");
      String kcal = request.getParameter("kcal");
      String day = request.getParameter("day");
      System.out.println("운동 종류" + sport);
      System.out.println("운동한 시간(분)" + duration);
      System.out.println("소모 칼로리 " + kcal);
      System.out.println("운동 한 날짜 " + day);
      
      mealService.AddSport(sportVO);
      return "Meal/MyMeal";
      
   } //MyMeal-end
   
   
   
   @RequestMapping("/meal1Complete")         // 상품 구매 및 결제
   public String breakfastComplete(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String menu = request.getParameter("menu");
      String inbun = request.getParameter("inbun");
      String kcal = request.getParameter("kcal");
      String carbon = request.getParameter("carbon");
      String protein = request.getParameter("protein");
      String fat = request.getParameter("fat");
      String day = request.getParameter("day");
      System.out.println("아침식사로 추가해준 메뉴" + menu);
      System.out.println("아침식사 몇인분? " + inbun);
      System.out.println("아침식사 칼로리 " + kcal);
      System.out.println("아침식사 탄수" + carbon);
      System.out.println("아침식사 단백질 " + protein);
      System.out.println("아침식사 지방" + fat);
      System.out.println("몇일날 먹은 식사? " + day);
      
      mealService.AddBreakfast(diaryVO);
      
      return "Meal/MyMeal";
      
   }//MyMeal-end

   
   
   @RequestMapping("/meal2Complete")         // 상품 구매 및 결제
   public String lunchComplete(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String menu = request.getParameter("menu");
      String inbun = request.getParameter("inbun");
      String kcal = request.getParameter("kcal");
      String carbon = request.getParameter("carbon");
      String protein = request.getParameter("protein");
      String fat = request.getParameter("fat");
      String day = request.getParameter("day");
      System.out.println("아침식사로 추가해준 메뉴" + menu);
      System.out.println("아침식사 몇인분? " + inbun);
      System.out.println("아침식사 칼로리 " + kcal);
      System.out.println("아침식사 탄수" + carbon);
      System.out.println("아침식사 단백질 " + protein);
      System.out.println("아침식사 지방" + fat);
      System.out.println("몇일날 먹은 식사? " + day);
      
      mealService.AddLunch(diaryVO);
      
      return "Meal/MyMeal";
      
   }//MyMeal-end
   
   
   @RequestMapping("/meal3Complete")         // 상품 구매 및 결제
   public String dinnerComplete(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
	   	  String id = request.getParameter("id");
	      String menu = request.getParameter("menu");
	      String inbun = request.getParameter("inbun");
	      String kcal = request.getParameter("kcal");
	      String carbon = request.getParameter("carbon");
	      String protein = request.getParameter("protein");
	      String fat = request.getParameter("fat");
	      String day = request.getParameter("day");
	      System.out.println("아침식사로 추가해준 메뉴" + menu);
	      System.out.println("아침식사 몇인분? " + inbun);
	      System.out.println("아침식사 칼로리 " + kcal);
	      System.out.println("아침식사 탄수" + carbon);
	      System.out.println("아침식사 단백질 " + protein);
	      System.out.println("아침식사 지방" + fat);
	      System.out.println("몇일날 먹은 식사? " + day);
      
      mealService.AddDinner(diaryVO);
      
      
      return "Meal/MyMeal";
      
   }//MyMeal-end
   
   
   @RequestMapping("/meal4Complete")         // 상품 구매 및 결제
   public String snackComplete(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String menu = request.getParameter("menu");
      String inbun = request.getParameter("inbun");
      String kcal = request.getParameter("kcal");
      String carbon = request.getParameter("carbon");
      String protein = request.getParameter("protein");
      String fat = request.getParameter("fat");
      String day = request.getParameter("day");
      System.out.println("아침식사로 추가해준 메뉴" + menu);
      System.out.println("아침식사 몇인분? " + inbun);
      System.out.println("아침식사 칼로리 " + kcal);
      System.out.println("아침식사 탄수" + carbon);
      System.out.println("아침식사 단백질 " + protein);
      System.out.println("아침식사 지방" + fat);
      System.out.println("몇일날 먹은 식사? " + day);
      
      mealService.AddSnack(diaryVO);    
      
      return "Meal/MyMeal";
      
   }//MyMeal-end
   
   @RequestMapping("/eatfood")
   public String eatfood(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      System.out.println("내가먹은 식사메뉴 보러갈때 가져가는 아이디" + id);
      
      ArrayList <DiaryVO> list = mealService.MealView(id);
      model.addAttribute("breakfast", list);
      
      ArrayList <DiaryVO> list1 = mealService.MealView1(id);
      model.addAttribute("lunch", list1);
      
      ArrayList <DiaryVO> list2 = mealService.MealView2(id);
      model.addAttribute("dinner", list2);
      
      ArrayList <DiaryVO> list3 = mealService.MealView3(id);
      model.addAttribute("snack", list3);
      
      ArrayList <SportVO> list4 = mealService.SportView(id);
      model.addAttribute("sport", list4);
      
      
      return "Meal/ViewAllMeal";
      
   }//MyMeal-end
   
   
   @RequestMapping("/SportDel")
   public String SportDelete(Model model, SportVO sportVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String kcal = request.getParameter("kcal");
      String day = request.getParameter("day");
      
      System.out.println("삭제버튼 눌렀을때 가져오는 정보" + id + kcal + day);
      
      mealService.SportDel(id, kcal, day);
      
      return "Meal/MyMeal";
      
   }   // 운동 삭제
   
   
   @RequestMapping("/SnackDel")
   public String SnackDelete(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String kcal = request.getParameter("kcal");
      String day = request.getParameter("day");
      
      System.out.println("삭제버튼 눌렀을때 가져오는 정보" + id + kcal + day);
      
      mealService.SnackDel(id, kcal, day);
      
      return "Meal/MyMeal";
      
   }   // 간식 삭제
   
   
   
   @RequestMapping("/breakDel")
   public String BreakfastDelete(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String kcal = request.getParameter("kcal");
      String day = request.getParameter("day");
      
      System.out.println("삭제버튼 눌렀을때 가져오는 정보" + id + kcal + day);
      
      mealService.BreakDel(id, kcal, day);
      
      return "Meal/MyMeal";
      
   }  // 아침 삭제
   
   
   
   @RequestMapping("/lunchDel")
   public String LunchDelete(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String kcal = request.getParameter("kcal");
      String day = request.getParameter("day");
      
      System.out.println("삭제버튼 눌렀을때 가져오는 정보" + id + kcal + day);
      
      mealService.LunchDel(id, kcal, day);
      
      return "Meal/MyMeal";
      
   }   // 점심 삭제
   
   
   
   @RequestMapping("/dinnerDel")
   public String DinnerDelete(Model model, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String kcal = request.getParameter("kcal");
      String day = request.getParameter("day");
      
      System.out.println("삭제버튼 눌렀을때 가져오는 정보" + id + kcal + day);
      
      mealService.DinnerDel(id, kcal, day);
      
      return "Meal/MyMeal";
      
   }  // 저녁 삭제
   
   
   
   @RequestMapping("/dayKcal")
   public String DayKcal(Model model, SportVO sportVO, DiaryVO diaryVO, UserVO userVO, HttpServletRequest request) throws Exception {
      
      String id = request.getParameter("id");
      String day1 = request.getParameter("day1");
      System.out.println("칼로리계산 눌렀을때 가져오는 정보" + id +"여기는 내가 셀렉한 날짜" + day1);
      
      ArrayList <DiaryVO> morning = mealService.Checkmorning(id, day1);
      model.addAttribute("morning", morning);
      
      ArrayList <DiaryVO> lunch = mealService.Checklunch(id, day1);
      model.addAttribute("lunch", lunch);
      
      ArrayList <DiaryVO> dinner = mealService.Checkdinner(id, day1);
      model.addAttribute("dinner", dinner); 
      
      ArrayList <DiaryVO> snack = mealService.Checksnack(id, day1);
      model.addAttribute("snack", snack); 
      
      ArrayList <SportVO> sport = mealService.Checksport(id, day1);
      model.addAttribute("sport", sport);
      
      return "Meal/What_I_Eat";
      
   }  // 저녁 삭제
   
   
   
   @RequestMapping("/ingredient")
   public String FoodIngredient(UserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response ,HttpSession session)
         throws ClassNotFoundException, SQLException {
      
      return "Meal/ingredient";
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   // -------------------------------------------------------------------------------
   
   
   private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
   
   /**
    * Simply selects the home view to render by returning its name.
    */
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String home(Locale locale, Model model) {
      logger.info("Welcome home! The client locale is {}.", locale);
      
      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
      
      String formattedDate = dateFormat.format(date);
      
      model.addAttribute("serverTime", formattedDate );
      
      return "home";
   }
   
}
