package com.chocobuy.view.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@SessionAttributes("UserInfo")
public class LoginController {
	@Autowired
	private UserService userService;
	
	
	/* LOGOUT */
	@RequestMapping("/Login/logout")
	public String logout(HttpSession session) {
		System.out.println("Controller >> logout");
		session.invalidate();
		return "redirect:/index";
	}

	/* LOGIN */	
	@RequestMapping(value="/Login/login",method=RequestMethod.GET)
	public String login_View() {
		return "/Login/login";
	}
	
	/* user_tel duplication check */
	@RequestMapping(value={"/Login/getTelInfo","/Join/getTelInfo"})
	@ResponseBody 
	public int getTelInfo(@RequestParam("user_tel") String user_tel) {
		return userService.userTelCheck(user_tel); 
	}
	
	@RequestMapping(value="/Login/login", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		UserVO user=userService.getUser(vo);
		System.out.println("user: "+user);
		if(userService.getUser(vo)!=null){
			//session update : user_uuid
			session.setAttribute("UserInfo", user.getUser_uuid());
			if(user.getUser_role()==100) {
				return "redirect:/Admin/adminMain";
			}
			return "redirect:/Trade/getTradeList";
		}else{
			return "/Login/login";
		}
	}

	@RequestMapping(value="/Join/joinAgree")
	public String joinAgree_view() {
		return "/Join/JoinAgree";
	}
	
	/* user_tel send validation number */
	@RequestMapping(value={"/Join/phoneCheck","/Login/phoneCheck"}) 
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber, CertifiedPhoneNumber ctp) { 
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		ctp.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		String msg=Integer.toString(randomNumber); 
		return msg;
	}
	
	/* JOIN */
	@RequestMapping(value="/Join/joinTel", method=RequestMethod.GET)
	public String joinTel_view() {
		return "/Join/JoinTel";
	}
	
	/* user_uuid, user_tel DB insert / Session */
	@RequestMapping(value="/Join/JoinTel", method=RequestMethod.POST)
	public String joinTel(UserVO vo, HttpSession session, HttpServletRequest request) throws InterruptedException {
		System.out.println("Controller >> jointel");
		if(userService.getUser(vo)==null) {
			userService.insertUser(vo);
			System.out.println("JoinTel컨트롤러vo"+userService.getUser(vo));		
		}
		// 세션이 생성되어 있으면 해당 세션 리턴, 생성되어 있지 않으면 null을 리턴
		session = request.getSession(false);
		// 세션이 있으면 삭제합니다
		if(session != null && session.getAttribute("UserInfo") != null) {
			session.invalidate();
		}else {
		UserVO user=userService.getUser(vo);
		session.setAttribute("UserInfo", user.getUser_uuid());
		System.out.println("session추가 후 확인: "+session.getAttribute("UserInfo"));
		}
		return "redirect:/Join/joinArea";
	}
	
	@RequestMapping(value="/Join/joinArea", method=RequestMethod.GET)
	public String joinArea_view(UserVO vo, Model model2, HttpSession session) {
		vo.setUser_uuid((String)session.getAttribute("UserInfo"));
		model2.addAttribute("user1", userService.getUserUuid(vo));
		System.out.println(userService.getUserUuid(vo));
		return "/Join/JoinArea";
	}
	
	@RequestMapping(value="/Join/joinArea", method=RequestMethod.POST)
	public String join_Area(Model model, UserVO vo, Model model2, HttpSession session,
			@RequestParam(value="addrDetail", defaultValue = "", required = false) String addrDetail, 
			@RequestParam(value="inputYn", defaultValue = "", required = false) String inputYn, 
			@RequestParam(value="siNm", defaultValue = "", required = false) String siNm, 
			@RequestParam(value="sggNm", defaultValue = "", required = false) String sggNm, 
			@RequestParam(value="emdNm", defaultValue = "", required = false) String emdNm) {
		System.out.println("Controller >> using address API and update user_area");
		model.addAttribute("inputYn", inputYn);
		model.addAttribute("siNm", siNm);
		model.addAttribute("sggNm", sggNm);
		model.addAttribute("emdNm", emdNm);
		vo.setUser_siNm(siNm);
		vo.setUser_sggNm(sggNm);
		vo.setUser_emdNm(emdNm);
		vo.setUser_uuid((String)session.getAttribute("UserInfo"));
		model2.addAttribute("user1", userService.getUserUuid(vo));
		userService.updateUserArea(vo);
		return "/Join/JoinArea";
	}

	@RequestMapping(value="/Join/JoinArea", method=RequestMethod.POST)
	public String join_Area( Model model, UserVO vo ,HttpSession session) {
		System.out.println("db작업을 해버려서 할 일이 없음 그래서 그냥 리다이렉트만 합니다.. ");
		return "redirect:/Join/joinNick";
	}
	
	@RequestMapping(value="/Join/joinNick", method=RequestMethod.GET)
	public String joinNick_view(UserVO vo, Model model, HttpSession session) {
		vo.setUser_uuid((String)session.getAttribute("UserInfo"));
		model.addAttribute("user1", userService.getUserUuid(vo));
		System.out.println(userService.getUserUuid(vo));
		return "/Join/JoinNick";
	}
	
	/* user_nick duplication check */
	@RequestMapping(value="/Join/NameCheck", method=RequestMethod.GET) 
	@ResponseBody 
	public int nameCheck(@RequestParam("user_nick") String user_nick) {
		System.out.println("user_nick duplication check");
		return userService.nickDupCheck(user_nick); 
	}	
	
	/* update user_nick & user_profileImg */
	@RequestMapping(value="/Join/JoinNick", method=RequestMethod.POST)
	public String joinDone_View(UserVO vo) {
		System.out.println("update user_nick & user_profileImg");
		userService.updateUserNick(vo);
		return "redirect:/Join/Joindone";
	}
	 
	@RequestMapping(value="/Join/Joindone", method=RequestMethod.GET)
	public String joindone_view() {
		return "/Join/JoinDone";
	}
	
	/* delete session & redirect to login */
	@RequestMapping(value="/Join/JoinDone", method=RequestMethod.POST)
	public String join_Done(UserVO vo, HttpSession session, HttpServletRequest request) {
		System.out.println("Controller >> Join process done. Redircet to Login");
		if(request.getSession(false)!=null) {
			session.invalidate();			
		}
		return "redirect:/Login/login";
	}
	

		
}
