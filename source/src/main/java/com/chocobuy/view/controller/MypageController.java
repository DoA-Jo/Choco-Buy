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
		searchMypageConditionMap.put("거래상대", "BUYINFO");
		searchMypageConditionMap.put("제목", "TITLE");
		searchMypageConditionMap.put("내정보", "MYLIST");
		searchMypageConditionMap.put("전체", "ALL"); 
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
	@RequestMapping("/Mypage/getMypageProfileUpdate")
	public String getMypageProfileUpdate(UserVO vo, Model model, HttpSession session,HttpServletRequest request) {
		System.out.println("profileUpdate");
		session= request.getSession();
		vo.setUser_uuid((String)session.getAttribute("UserInfo"));
		model.addAttribute("user", userService.getMypageUser(vo));
		System.out.println(userService.getMypageUser(vo));
		return "/Mypage/MypageProfileUpdate";
	}
	
	
	// 회원정보 수정 
	// 중복 요인이 있어 새로운 이름으로 다시 작성함
	// 확인후 서로 사용하지 않는 Controller 이면 삭제 요망 
	// 생각 없이 작하다.. 조금 수정한 내용이 있을수 있음 4/22 일 
	@RequestMapping("/Mypage/updateUser")
	public String updateUser(UserVO vo, Model model, HttpSession session) {
		System.out.println("updateUser");
		UserVO us =(UserVO)session.getAttribute("user_uuid");
		vo.setUser_uuid(us.getUser_uuid());
		System.out.println(vo);
		userService.updateUser(vo);
		session.setAttribute("user_nick",vo.getUser_nick());
		return "redirect:/Mypage/getMypageUser";
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
	// MypageMain.jsp  에서 목록확인을 위해 글 리스트를 
	// 모두 가져오고 MypageTradeList.jsp 로 이동 
	// getMypageList 메소드 명으로 네이밍 변경 됨
	// getMypageTradeSerch Controller 가 완성되면 추후 삭제 예정 
	// MypageMain.jsp 에서도 getMypageTradeSerch Controller 사용 예정 
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
	public String getMypageTrade(TradeVO vo, Model model) {
		System.out.println(vo.getTrade_seq());
		model.addAttribute("trade", tradeService.getMypageTrade(vo));
		System.out.println(tradeService.getMypageTrade(vo));
		return "/Mypage/MypageTrade";
	}
	
	
	// MypageTrade.jsp 에서 
	// review 작성 완료 버튼 
	// 수정 완료후 getMypageList 로직 으로 이동 
	// 네이밍 수정 완료 
	@RequestMapping("/Mypage/updateMypageReview")
	public String updateMypageReview( TradeVO vo, Model model, HttpSession session) {
		System.out.println("updateReview"); 
		
		System.out.println(vo.toString()); 
		tradeService.updateMypageTrade(vo);
		//redirect: jsp파일이 아닌 컨트롤러를 타라는 의미 
		return "redirect: /Mypage/getMypageTradeSerch";
	}
	
	
	// 글 검색 기능을 구현중 
	// 추후 페이징을 구현하면 해당 컨트롤러는 
	// 사용 안할 예정 
	//@RequestMapping("/Mypage/getMypageTradeSerch")
	public String getMypageTradeSerch(TradeVO vo, Model model, HttpSession session) {
		System.out.println("getMypageTradeSerch 아직 완료 전 ");
		System.out.println((String)session.getAttribute("UserInfo"));
		vo.setTrade_uuid((String)session.getAttribute("UserInfo"));
		System.out.println(vo); 
		model.addAttribute("tradeList", tradeService.getMypageTradeSerch(vo));
		return "/Mypage/MypageTradeList";
	}
	
	
	// updateUser 를 변형함 
	// UserService.java , UserServiceImpl.java .
	// UserDAOMybatis.java, User-mapping.xml 네이밍 모두 새롭게 추가 ( 중복 방지) 
	@RequestMapping("/Mypage/updateMypageUser")
	public String updateMypageUser(UserVO vo, Model model, HttpSession session) {
		System.out.println("updateMypageUser  왜 너는 출력이 안되니...");
		vo.setUser_uuid((String)session.getAttribute("UserInfo"));
		System.out.println(vo);
		userService.updateMypageUser(vo);
	//	session.setAttribute("user_nick",vo.getUser_nick());
		return "redirect:/Mypage/getMypageUser";
	}
	
	
	// 글 목록 (페이징 처리)
	@RequestMapping("/Mypage/getMypageTradeSerch")
	public String getBoardListPost(PagingVO pv, TradeVO vo,HttpSession session, Model model,@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("글 목록 검색 처리(페이징 처리)");
		String cntPerPage = "5";
		if (vo.getSearchMypageCondition() != null) vo.setSearchMypageCondition(vo.getSearchMypageCondition());
		else vo.setSearchMypageCondition("TITLE");
		
		if (vo.getSearchMypageKeyword() != null) vo.setSearchMypageKeyword(vo.getSearchMypageKeyword());
		else vo.setSearchMypageKeyword("");
		System.out.println("000: "+vo.getSearchMypageCondition());
		System.out.println("111: "+vo.getSearchMypageKeyword());
		vo.setTrade_uuid((String)session.getAttribute("UserInfo"));

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
}