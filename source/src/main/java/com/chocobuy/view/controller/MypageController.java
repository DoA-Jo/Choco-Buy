package com.chocobuy.view.controller;

import java.util.HashMap;
import java.util.Map;

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

import com.chocobuy.biz.trade.TradeService;
import com.chocobuy.biz.trade.TradeVO;
import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;
import com.chocobuy.biz.util.PagingVO;

@Controller
@SessionAttributes("trade")
public class MypageController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private TradeService tradeService; 
	
	
	// 검색어 챠트
	@ModelAttribute("searchMypageConditionMap")
	public Map<String, String> searchMypageConditionMap() {
		Map<String, String> searchMypageConditionMap = new HashMap<String, String>();
		searchMypageConditionMap.put("거래완료", "BUYINFO");
		searchMypageConditionMap.put("내정보", "MYLIST");
		return searchMypageConditionMap;
	}
	
	// 회원정보 보기 getUser
	@RequestMapping("/Mypage/getMypageUser")
	public String getUser(UserVO vo, Model model,HttpServletRequest request, HttpSession session) {
		System.out.println(vo.toString());
		session= request.getSession();
		System.out.println("userService.getMypageUser(vo)" +vo);
		vo.setUser_uuid((String)session.getAttribute("UserInfo"));
		model.addAttribute("user", userService.getMypageUser(vo));
		System.out.println("userService.getMypageUser(vo)" +vo);
		return "/Mypage/MypageMain";
	}

	// 내정보 수정 페이지 이동
	@RequestMapping(value="/Mypage/getMypageProfileUpdate", method=RequestMethod.GET)
	public String getMypageProfileUpdate(UserVO vo, Model model, HttpSession session,HttpServletRequest request) {
		System.out.println("profileUpdate");
		session= request.getSession();
		vo.setUser_uuid((String)session.getAttribute("UserInfo"));
		model.addAttribute("user", userService.getMypageUser(vo));
		System.out.println(userService.getMypageUser(vo));
		return "/Mypage/MypageProfileUpdate";
	}
	
	
	
	// 넥네임 중복확인 
	@RequestMapping("/Mypage/mypageNameCheck") 
	@ResponseBody 
	public int mypageNameCheck(@RequestParam("sm_name") String sm_name) {
		System.out.println("ajaxController");
		System.out.println(sm_name);
		return userService.mypageNameCheck(sm_name); 
	}
	
	
	// 핸드폰 번호 중복확인
	@RequestMapping("/Mypage/mypageNumCheck") 
	@ResponseBody 
	public int mypageNumCheck(@RequestParam("sm_tel") String sm_tel) {
		System.out.println("ajaxController");
		System.out.println(sm_tel);
		return userService.mypageNumCheck(sm_tel); 
	}
	
	// 글 목록 1 getTradeList
	@RequestMapping("/Mypage/getMypageList")
	public String getMypageList( TradeVO vo, Model model, HttpSession session) {
		System.out.println("getMypageTradeList");
		System.out.println("내 리뷰목록, 판매구매 리스트 보여주기");
		vo.setTrade_nick((String)session.getAttribute("user_nick"));
		model.addAttribute("tradeList", tradeService.getMypageTradeList(vo));
		return "/Mypage/MypageTradeList"; // View 이름 리턴
	}
	
	// 글 보기 getTrade
	// getMypageTrade 메소드 명으로 변경 됨 
	// 사실 getTrade() 기능 사용해도 무방하나 겹치는걸 방지하기 위해  네이밍 작업 
	@RequestMapping("/Mypage/getMypageTrade")
	public String getMypageTrade(TradeVO vo, UserVO uo,Model model,HttpSession session) {
		System.out.println(vo.getTrade_seq());
		model.addAttribute("trade", tradeService.getMypageTrade(vo));
		System.out.println(tradeService.getMypageTrade(vo));
		uo.setUser_uuid((String)session.getAttribute("UserInfo"));
		model.addAttribute("user", userService.getMypageUser(uo));
		return "/Mypage/MypageTrade";
	}
	
	@RequestMapping("/Mypage/updateMypageReview")
	public String updateMypageReview( TradeVO vo, Model model, HttpSession session) {
		System.out.println("updateReview"); 
		
		System.out.println(vo.toString()); 
		tradeService.updateMypageTrade(vo);
		//redirect: jsp파일이 아닌 컨트롤러를 타라는 의미 
		return "redirect: /Mypage/getMypageTradeSerch";
	}
	
	
	@RequestMapping("/Mypage/updateMypageUser")
	public String updateMypageUser(UserVO vo, Model model, HttpSession session) {
		System.out.println("updateMypageUser  왜 너는 출력이 안되니...");
		vo.setUser_uuid((String)session.getAttribute("UserInfo"));
		System.out.println(vo);
		userService.updateMypageUser(vo);
		
		return "redirect:/Mypage/getMypageUser";
	}
	
	
	// 글 목록 (페이징 처리)
	@RequestMapping("/Mypage/getMypageTradeSerch")
	public String getBoardListPost(PagingVO pv, TradeVO vo, UserVO uvo, HttpSession session, Model model,@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("글 목록 검색 처리(페이징 처리)");
		String cntPerPage = "5";
		if (vo.getSearchMypageCondition() != null) vo.setSearchMypageCondition(vo.getSearchMypageCondition());
		else vo.setSearchMypageCondition("MYLIST");
		
		if (vo.getSearchMypageKeyword() != null) vo.setSearchMypageKeyword(vo.getSearchMypageKeyword());
		else vo.setSearchMypageKeyword("");
		System.out.println("000: "+vo.getSearchMypageCondition());
		System.out.println("111: "+vo.getSearchMypageKeyword());
		
		
		vo.setTrade_uuid((String)session.getAttribute("UserInfo"));
		
		//리뷰 작성 권한 체크를 위한 작업  
		uvo.setUser_uuid((String)session.getAttribute("UserInfo"));
		model.addAttribute("userNick", userService.getMypageTradeNick(uvo));
		
		// 내 닉정보로 상대방 글의 거래상대를  검색하기 위한 
		vo.setTrade_nick((String)userService.getMypageTradeNick(uvo));
		

		int total = tradeService.countMypageTrade(vo);
		if (nowPage == null)  nowPage = "1";

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		
		System.out.println(vo);
		
		model.addAttribute("tradeList", tradeService.getMypageTradeSerch(vo));
		model.addAttribute("searchKeyword", vo.getSearchMypageKeyword());
		model.addAttribute("searchCondition", vo.getSearchMypageCondition());
		return "/Mypage/MypageTradeList";
	}
	
	
	
	   @RequestMapping(value="/Mypage/getMypageProfileUpdate", method=RequestMethod.POST)
	   public String join_Area(Model model, UserVO vo, HttpSession session, @RequestParam(value="addrDetail", defaultValue = "", required = false) String addrDetail,  @RequestParam(value="inputYn", defaultValue = "", required = false) String inputYn,  @RequestParam(value="siNm", defaultValue = "", required = false) String siNm, @RequestParam(value="sggNm", defaultValue = "", required = false) String sggNm, @RequestParam(value="emdNm", defaultValue = "", required = false) String emdNm) {
	      System.out.println("Controller >> using address API and update user_area");
System.out.println("uuid세션 값: "+(String)session.getAttribute("UserInfo"));
	      model.addAttribute("inputYn", inputYn);
	      model.addAttribute("siNm", siNm);
	      model.addAttribute("sggNm", sggNm);
	      model.addAttribute("emdNm", emdNm);
	      
	      vo.setUser_siNm(siNm);
	      vo.setUser_sggNm(sggNm);
	      vo.setUser_emdNm(emdNm);
	      vo.setUser_uuid((String)session.getAttribute("UserInfo"));
	      userService.updateMypageUseArea(vo);
	      model.addAttribute("user", userService.getMypageUser(vo));
	     
	      return "/Mypage/MypageProfileUpdate";
	   }
	   
	   
		// 리뷰 nick 작성 권한 체크 
		@RequestMapping("/Mypage/getMypageTradeNick")
		@ResponseBody
		public String getMypageTradeNick( UserVO vo, Model model,HttpServletRequest request, HttpSession session ) {
			vo.setUser_uuid((String)session.getAttribute("UserInfo"));
			System.out.println("getMypageTradeNick");
			System.out.println(userService.getMypageTradeNick(vo));
			return userService.getMypageTradeNick(vo);
		}

}