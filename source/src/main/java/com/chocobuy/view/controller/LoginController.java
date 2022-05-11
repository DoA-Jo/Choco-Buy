package com.chocobuy.view.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;
import com.chocobuy.biz.util.CertifiedPhoneNumber;

@Controller
@SessionAttributes("user")
public class LoginController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/Join/joinFail", method=RequestMethod.POST)
	public String joinFail(HttpSession session, UserVO vo) {
		System.out.println("Controller >> joinFail");
		
		if(session.getAttribute("user")!= null) {
			session.removeAttribute("user"); 
			session.invalidate();
		}
		return "/Join/JoinFail";
	}

	// LOGIN-get
	   @RequestMapping(value="/Login/login",method=RequestMethod.GET)
	   public String login_View(HttpSession session, HttpServletRequest request) {
	      if(session.getAttribute("user")!= null) {
	         System.out.println("login-get//session(user) delete");
	         session.invalidate();
	      }
	      
	    //쿠키가 존재하면 이전에 저장해놓은 session_id를 가져와서 
		Cookie cookie = WebUtils.getCookie(request,"loginCookie");
		if(cookie!=null) {
			System.out.println("if(cookie!=null)");
			
			String session_id=cookie.getValue();
			System.out.println(session_id);
			
			//selectSession: SELECT * FROM USER_TABLE WHERE SESSION_ID=#{session_Id} and LIMIT_DATE > now()
			//유효기간이 남아있으면서 해당 sessionID를 가지는 사용자 정보 조회
			UserVO vo=userService.selectSession(session_id);
			if(vo!=null) {
				System.out.println("if(vo!=null) vo: "+vo);
				UserVO user = userService.getUser(vo);
		        session = request.getSession();
				session.setAttribute("UserInfo", user.getUser_uuid());
				System.out.println("로그인성공"); 
	            return "redirect:/Trade/getTradeList";
			}
		}
	      return "/Login/login";
	   }
	
	  
	   @RequestMapping(value="/Login/login", method=RequestMethod.POST)
		public String login(UserVO vo, HttpSession session,
				HttpServletRequest request, HttpServletResponse response, 
				@RequestParam("user_tel") String user_tel) {
			System.out.println("Controller >> login");
	        System.out.println(vo);
	      //회원가입 시 사용했던 user세션이 존재한다면 삭제
			if(session.getAttribute("user")!= null) {
		         System.out.println("login-post//session(user) delete");
		         session.invalidate();
			}
	        UserVO user = userService.getUser(vo);
	        System.out.println("user: "+user);
	        session = request.getSession();
	        if(user != null) {
	        	session.setAttribute("UserInfo", user.getUser_uuid());
	            //사용자가 자동로그인을 체크했을시에 실행
	            if(vo.isAutoLogin()) {
	                System.out.println("autoLogin if");
	                //자동로그인 기간 설정
	                long second = 60 * 60 * 24 * 90; //3개월뒤 (초)
	                //쿠키생성
	                Cookie cookie = new Cookie("loginCookie",session.getId());
	                System.out.println("session.getId(): "+session.getId());
	                cookie.setPath("/"); // 쿠키를 찾을 경로를 컨텍스트 경로(사용자 PC에서 쿠키를 보내는 경로가 "/" 로 설정함으로써 contextPath 이하의 모든 요청에 대해서 쿠키를 전송할 수 있도록 설정)
	                cookie.setMaxAge((int)second);
	                response.addCookie(cookie);
	                
	                //3개월뒤의 밀리초를 날짜로 변환
	                long millis = System.currentTimeMillis() + (second * 1000); 
	                Date limitDate = new Date(millis);
	                System.out.println(limitDate);
	                
	                //DB에 세션아이디,쿠키만료날짜,회원 아이디 전달
	                
	                userService.autoLogin(session.getId(),limitDate,user.getUser_uuid());
	            }
	            if(user.getUser_role()==100) {
	            	System.out.println("로그인성공(관리자)"); 
		            return "redirect:/Admin/adminMain";
	        	}
	            System.out.println("로그인성공"); 
	            return "redirect:/Trade/getTradeList";
	        }else {
	        	System.out.println("로그인실패");
	            return "/Login/login";
	        }
	  }
	  
	  //로그아웃처리
	  @RequestMapping("/Login/logout")
	  public String logout(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		  System.out.println("Controller >> logout");
		  System.out.println(vo);
		  
		  String UserInfo = (String) session.getAttribute("UserInfo");
		  vo.setUser_uuid(UserInfo);
		  userService.getUserUuid(vo);
		  System.out.println(vo);
		  
	      if(UserInfo!= null) {
	          session.removeAttribute("UserInfo"); 
	          session.invalidate();
	          
	          //자동로그인을 한 상태의 사용자가 로그아웃을 할 경우
	          Cookie cookie = WebUtils.getCookie(request,"loginCookie");
	          if(cookie != null) {
	        	  System.out.println("자동로그인을 한 상태의 사용자가 로그아웃을 할 경우");
	        	  cookie.setPath("/");
	              cookie.setMaxAge(0);
	              response.addCookie(cookie);
	              userService.autoLogin("none",new Date(),vo.getUser_uuid());
	          }
	      }
	      return "redirect:/index";
	  }
	   
	   
	   
//	// LOGIN-post	
//	@RequestMapping(value="/Login/login", method=RequestMethod.POST)
//	public String login(UserVO vo, HttpSession session, HttpServletRequest request) {
//		System.out.println("Controller >> login");
//		//회원가입 시 사용했던 user세션이 존재한다면 삭제
//		if(session.getAttribute("user")!= null) {
//	         System.out.println("login-post//session(user) delete");
//	         session.invalidate();
//		}
//		UserVO user=userService.getUser(vo);
//		System.out.println("user: "+user);
//		session = request.getSession();
//		if(user!=null){
//			//UserInfo session update (value=user_uuid)
//			session.setAttribute("UserInfo", user.getUser_uuid());
//			if(user.getUser_role()==100) {
//				return "redirect:/Admin/adminMain";
//			}
//			return "redirect:/Trade/getTradeList";
//		}else{
//			return "/Login/login";
//		}
//	}
//	   
//		// LOGOUT
//		@RequestMapping("/Login/logout")
//		public String logout(HttpSession session, HttpServletRequest request) {
//			System.out.println("Controller >> logout");
//			session = request.getSession();
//			String UserInfo = (String)session.getAttribute("UserInfo");
//			if(UserInfo != null) {
//				System.out.println("UserInfo"+UserInfo);
//				session.invalidate();
//			}
//			return "redirect:/index";
//		}
	
	// user data error (null) check
	@RequestMapping(value={"/Login/UserNull","/Join/UserNull"})
	@ResponseBody 
	public int UserNull(@RequestParam("user_tel") String user_tel) {
		return userService.UserNull(user_tel); 
	}
	
	// user_tel duplication check
	@RequestMapping(value={"/Login/getTelInfo","/Join/getTelInfo"})
	@ResponseBody 
	public int getTelInfo(@RequestParam("user_tel") String user_tel) {
		return userService.userTelCheck(user_tel); 
	}
	
	// delete user
	@RequestMapping(value="/Join/deleteUser", method=RequestMethod.POST)
	public void deleteUser(@RequestParam("user_tel") String user_tel) {
		System.out.println("Controller >> deleteUser");
		userService.deleteUser(user_tel);
	}
	
//---------------------------------------------------------------------------------------
	@RequestMapping(value="/Join/joinAgree")
	public String joinAgree_view() {
		return "/Join/JoinAgree";
	}
	
	// user_tel send validation number
	@RequestMapping(value={"/Join/phoneCheck","/Login/phoneCheck"}) 
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber, CertifiedPhoneNumber ctp) { 
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		ctp.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		String msg=Integer.toString(randomNumber); 
		return msg;
	}
	
	// JOIN 
	@RequestMapping(value="/Join/joinTel", method=RequestMethod.GET)
	public String joinTel_view() {
		return "/Join/JoinTel";
	}
	
	// user_tel vo set
	@RequestMapping(value="/Join/JoinTel", method=RequestMethod.POST)
	public String joinTel(UserVO vo, Model model) throws InterruptedException {
		System.out.println("Controller >> jointel");
		model.addAttribute("user",vo);
		System.out.println(vo.toString());
		
		return "redirect:/Join/joinArea";
	}
	
	@RequestMapping(value="/Join/joinArea", method=RequestMethod.GET)
	public String joinArea_view() {
		System.out.println("joinArea_view()");
		return "/Join/JoinArea";
	}
	
	// user_siNm, user_sggNm, user_emdNm vo set
	@RequestMapping(value="/Join/joinArea", method=RequestMethod.POST)
	public String join_Area(@ModelAttribute("user") UserVO vo, Model model,
			@RequestParam(value="addrDetail", defaultValue = "", required = false) String addrDetail, 
			@RequestParam(value="inputYn", defaultValue = "", required = false) String inputYn, 
			@RequestParam(value="siNm", defaultValue = "", required = false) String siNm, 
			@RequestParam(value="sggNm", defaultValue = "", required = false) String sggNm, 
			@RequestParam(value="emdNm", defaultValue = "", required = false) String emdNm) {
		System.out.println("Controller >> using address API and update user_area");
		vo.setUser_siNm(siNm);
		vo.setUser_sggNm(sggNm);
		vo.setUser_emdNm(emdNm);
		model.addAttribute("inputYn", inputYn);
		model.addAttribute("siNm", siNm);
		model.addAttribute("sggNm", sggNm);
		model.addAttribute("emdNm", emdNm);
		System.out.println(vo.toString());
		return "/Join/JoinArea";
	}

	@RequestMapping(value="/Join/JoinArea", method=RequestMethod.POST)
	public String join_Area() {
		return "redirect:/Join/joinNick";
	}
	
	@RequestMapping(value="/Join/joinNick", method=RequestMethod.GET)
	public String joinNick_view() {
		return "/Join/JoinNick";
	}
	
	// user_nick duplication check
	@RequestMapping(value="/Join/NameCheck", method=RequestMethod.GET) 
	@ResponseBody 
	public int nameCheck(@RequestParam("user_nick") String user_nick) {
		System.out.println("user_nick duplication check");
		return userService.nickDupCheck(user_nick); 
	}	
	
	// user_nick, user_profileImage vo set
	@RequestMapping(value="/Join/JoinNick", method=RequestMethod.POST)
	public String joinDone_View(@ModelAttribute("user") UserVO vo) {
		System.out.println("Controller >> Nick&ProfileImage upload");
		System.out.println(vo.toString());
		return "redirect:/Join/Joindone";
	}
	 
	@RequestMapping(value="/Join/Joindone", method=RequestMethod.GET)
	public String joindone_view() {
		return "/Join/JoinDone";
	}
	
	//* insert user */
	@RequestMapping(value="/Join/JoinDone", method=RequestMethod.POST)
	public String join_Done(@ModelAttribute("user") UserVO vo, Model model) {
		System.out.println("Controller >> Join process done. Redircet to Login");
		System.out.println(vo.toString());
		userService.insertUser(vo);
		return "redirect:/Login/login";
	}
}
