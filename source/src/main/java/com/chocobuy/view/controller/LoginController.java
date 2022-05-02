package com.chocobuy.view.controller;

import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
    public String logout(UserVO vo, HttpSession session , HttpServletRequest request , HttpServletResponse response) {
       System.out.println("Controller >> logout");
        if(session.getAttribute("UserInfo")!= null) {
            session.removeAttribute("UserInfo"); 
            session.invalidate();
            Cookie cookie = WebUtils.getCookie(request,"loginCookie");
            
            //자동로그인을 한 상태의 사용자가 로그아웃을 할 경우
            if(cookie != null) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                userService.autoLogin("none",new Date(),vo.getUser_uuid());
            }
        }
        return "redirect:/index";
    }

	/* LOGIN */	
	@RequestMapping(value="/Login/login",method=RequestMethod.GET)
	public String login_View() {
		System.out.println("Controller >> login");
		return "/Login/login";
	}
	
	/* user_tel duplication check */
	@RequestMapping(value={"/Login/getTelInfo","/Join/getTelInfo"})
	@ResponseBody 
	public int getTelInfo(@RequestParam("user_tel") String user_tel) {
		System.out.println("user_tel:"+user_tel);
		return userService.userTelCheck(user_tel); 
	}
	
	@RequestMapping(value="/Login/login", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		UserVO user=userService.getUser(vo);
		System.out.println("user: "+user);
		if(userService.getUser(vo)!=null){
			//session update : user_uuid, user_tel
			session.setAttribute("UserInfo", user.getUser_uuid());
			session.setAttribute("user_tel", user.getUser_tel());
			session.setAttribute("user_nick", user.getUser_nick());
			session.setAttribute("siNm", user.getUser_siNm());
			session.setAttribute("sggNm", user.getUser_sggNm());
			session.setAttribute("emdNm", user.getUser_emdNm());
			if(user.getUser_role()==100) {
				return "redirect:/Admin/adminMain";
			}
			return "redirect:/Trade/getTradeList";
		}else{
			return "/Login/login";
		}
	}
	
	private boolean UseReg(String testTel) {
		System.out.println("UseReg() 호출됨");
		String tel="^01(?:0|1[6-9])-(?:\\d{3}\\d{4})-\\d{4}$";
		boolean tel_check=Pattern.matches(tel, testTel);
		System.out.println("tel_check: "+tel_check);
		return tel_check;
		
	}

	@RequestMapping(value="/Join/joinAgree")
	public String joinAgree_view() {
		return "/Join/JoinAgree";
	}
	
	/* user_tel duplication check */
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
		}
		session = request.getSession(false);
		if(session != null && session.getAttribute("UserInfo") != null) {
			session.invalidate();
		}else {
			session.setAttribute("UserInfo", userService.getUser(vo));
		}
		return "redirect:/Join/joinArea";
	}
	
	@RequestMapping(value="/Join/joinArea", method=RequestMethod.GET)
	public String joinArea_view() {
		return "/Join/JoinArea";
	}
	
	@RequestMapping(value="/Join/joinArea", method=RequestMethod.POST)
	public String join_Area(Model model, UserVO vo, @RequestParam(value="addrDetail", defaultValue = "", required = false) String addrDetail, 
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
		userService.updateUserArea(vo);
		return "/Join/JoinArea";
	}

	/* 二쇱냼�씤利� */
	@RequestMapping(value="/Join/JoinArea", method=RequestMethod.POST)
	public String join_Area(Model model, UserVO vo, HttpSession session) {
		System.out.println("而⑦듃濡ㅻ윭> 二쇱냼 db ");
		return "redirect:/Join/joinNick";
	}
	
	@RequestMapping(value="/Join/joinNick", method=RequestMethod.GET)
	public String joinNick_view() {
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
	
	/* �쉶�썝媛��엯 �셿猷�, �꽭�뀡 �궘�젣  */
	@RequestMapping(value="/Join/JoinDone", method=RequestMethod.POST)
	public String join_Done(UserVO vo, HttpSession session, HttpServletRequest request) {
		System.out.println("而⑦듃濡ㅻ윭> join�뿉�꽌 �궗�슜�븳 �꽭�꽑 �궘�젣");
		// �꽭�뀡�씠 �엳�쓣 �븣 �궘�젣
		if(request.getSession(false)!=null) {
			session.invalidate();			
		}
		return "redirect:/Login/login";
	}
	

		
}
