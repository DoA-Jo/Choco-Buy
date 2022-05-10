package com.chocobuy.view.controller;

import javax.servlet.http.HttpServletRequest;
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
		session=(HttpSession) session.getAttribute("user");
		if(session!= null) {
			session.removeAttribute("user"); 
			session.invalidate();
		}
		return "/Join/JoinFail";
	}
	
	
	// LOGOUT
	@RequestMapping("/Login/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		System.out.println("Controller >> logout");
		session = request.getSession();
		String UserInfo = (String)session.getAttribute("UserInfo");
		if(UserInfo != null) {
			System.out.println("UserInfo"+UserInfo);
			session.invalidate();
		}
		return "redirect:/index";
	}

	// LOGIN-get
	   @RequestMapping(value="/Login/login",method=RequestMethod.GET)
	   public String login_View(HttpSession session) {
	      if(session.getAttribute("user")!= null) {
	         System.out.println("login-get//session(user) delete");
	         session.invalidate();
	      }
	      return "/Login/login";
	   }
	
	// LOGIN-post	
	@RequestMapping(value="/Login/login", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, HttpServletRequest request) {
		System.out.println("Controller >> login");
		//회원가입 시 사용했던 user세션이 존재한다면 삭제
		if(session.getAttribute("user")!= null) {
	         System.out.println("login-post//session(user) delete");
	         session.invalidate();
		}
		UserVO user=userService.getUser(vo);
		System.out.println("user: "+user);
		session = request.getSession();
		if(user!=null){
			//UserInfo session update (value=user_uuid)
			session.setAttribute("UserInfo", user.getUser_uuid());
			if(user.getUser_role()==100) {
				return "redirect:/Admin/adminMain";
			}
			return "redirect:/Trade/getTradeList";
		}else{
			return "/Login/login";
		}
	}
	
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
