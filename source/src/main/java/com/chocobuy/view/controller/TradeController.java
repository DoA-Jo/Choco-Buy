package com.chocobuy.view.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.chocobuy.biz.trade.TradeService;
import com.chocobuy.biz.trade.TradeVO;
import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;

@Controller
@SessionAttributes("trade")
public class TradeController {
	
	@Autowired
	private TradeService tradeService;
	@Autowired
	private UserService userService;
	
	//글 등록 페이지로 가기
	@RequestMapping("/Trade/tradeInsert")
	public String insertTradePage(TradeVO vo, UserVO uvo, Model model, HttpSession session) throws IOException{
		String UserInfo = (String)session.getAttribute("UserInfo");
		System.out.println("useruuid : "+UserInfo);
		uvo.setUser_uuid(UserInfo);
		model.addAttribute("user", userService.getMypageUser(uvo));
		
		return "/Trade/TradeInsert";
	}
	
	
//	20220502 김혜린 수정(real path 수정) 
	// 글 등록
	@RequestMapping(value = "/Trade/insertTrade")
	public String insertTrade(TradeVO vo, UserVO uvo, Model model, MultipartHttpServletRequest request , HttpSession session) throws IOException{
		
	String realPath=request.getSession().getServletContext().getRealPath("/");
	realPath += "/resources/img/upload/";	
	//톰캣에 올릴때는 realPath로 !!!
//	String savePath=realPath+"/resources/img/upload/";
//	String savePath="C:/swork/ChocoBuyProto/src/main/webapp/resources/img/upload/";
	
//	System.out.println("savePath : "+savePath);
	System.out.println("realPath : "+realPath);
		MultipartFile trade_uploadImg = vo.getTrade_uploadImg();
		
		if(!trade_uploadImg.isEmpty()) {
			String trade_img = trade_uploadImg.getOriginalFilename();
			
			File file = new File(realPath+trade_img);
//			File file = new File(savePath+trade_img);
			if(!file.exists()) {
				file.mkdirs();
			}
			trade_uploadImg.transferTo(file);
			vo.setTrade_img(trade_img);
		}
//		20220504김혜린 수정  개발환경에서는 savepath 사용해야함	
		session = request.getSession();
		String UserInfo = (String)session.getAttribute("UserInfo");
		uvo.setUser_uuid(UserInfo);
		uvo = userService.getMypageUser(uvo);
		
		System.out.println("getMypageUser after: "+userService.getMypageUser(uvo));
		
		System.out.println("userprofileimg after: "+uvo.getUser_profileImg());
		
		vo.setTrade_profileimg(uvo.getUser_profileImg());
		
		vo.setTrade_imgpath(realPath); 
//		vo.setTrade_imgpath(savePath);     // savePath 지우지 말아주세용
		vo.setTrade_uuid(UserInfo);
		System.out.println(vo.getTrade_img());
		System.out.println(vo.getTrade_imgpath());
		tradeService.insertTrade(vo);
		return "redirect:/Trade/getTradeList";
	}
//여기까지 수정	
	
	// 글 수정
	@RequestMapping("/Trade/updateTrade")
	public String updateTrade(@ModelAttribute("trade") TradeVO vo, HttpSession session) {
			tradeService.updateTrade(vo);
			return "redirect:/Trade/getTradeList";
	}
		// 게시글 신고
	@RequestMapping("/Trade/updateReporting")
	public String updateUserReporting(@ModelAttribute("trade") TradeVO vo, HttpSession session) {
		tradeService.updateReporting(vo);
		return "redirect:/Trade/getTradeList";
		
		
		
	}
	

	// 글 삭제
	@RequestMapping("/Trade/deleteTrade")
	public String deleteBoard(@ModelAttribute("trade") TradeVO vo, HttpSession session) {
		tradeService.deleteTrade(vo);
		return "redirect:/Trade/getTradeList";
	}

	// 글 상세 조회
	@RequestMapping("/Trade/getTrade")
	public String getBoard(TradeVO vo, Model model) {
		model.addAttribute("trade", tradeService.getTrade(vo));
		return "/Trade/Trade";
	}

	// 글 목록
	@RequestMapping(value="/Trade/getTradeList" ,method=RequestMethod.GET)
	public String getTradeListPost( TradeVO vo, UserVO uvo,/* HttpServletRequest request, HttpSession session,*/ Model model) {
		System.out.println("글 목록 검색 처리");
//		20220502 김혜린 수정중
//		session = request.getSession();
//		session.getAttribute(siNm);
//		
		
		if (vo.getSearchCategory() != null) vo.setSearchCategory(vo.getSearchCategory());
		else vo.setSearchCategory("");
		model.addAttribute("tradeList", tradeService.getTradeList(vo));
		
		return "/Trade/TradeList";
	}
	
	//검색어 검색
	@RequestMapping("/Trade/getSearchTradeList")
	public String getSearchTradeListPost( TradeVO vo, Model model) {
		System.out.println("글 검색어 검색 처리");
		if (vo.getSearchInput() != null) vo.setSearchInput(vo.getSearchInput());
		else vo.setSearchInput("");
		model.addAttribute("tradeList", tradeService.getSearchTradeList(vo));
		return "/Trade/TradeList";
	}
	
	//판매자 프로필 열람
	@RequestMapping("/Trade/getTradeProfile")
	public String getTradeUserProfile(TradeVO vo, Model model) {
		System.out.println("프로필 열람 처리");
		vo.setTrade_nick(vo.getTrade_nick());
		
		model.addAttribute("tradeList",tradeService.getMyTradeList(vo));
		
		return "/Trade/UserTradeProfile";
	}
	
	
	//인덱스 글 목록
	@RequestMapping(value={"/index","/"})
	public String getIndexListtPost( TradeVO vo, Model model) {
		
		
		if (vo.getSearchCategory() != null) vo.setSearchCategory(vo.getSearchCategory());
		else vo.setSearchCategory("");
		model.addAttribute("tradeList", tradeService.getTradeList(vo));
		
		
		return "index";
	}
	//인덱스 검색어 검색
	@RequestMapping("/Trade/getSearchIndexList")
	public String getIndexSearchtPost( TradeVO vo, Model model) {
		System.out.println("글 검색어 검색 처리");
		if (vo.getSearchInput() != null) vo.setSearchInput(vo.getSearchInput());
		else vo.setSearchInput("");
		model.addAttribute("tradeList", tradeService.getSearchTradeList(vo));
		return "/Trade/TradeList";
	}
	
	
	
}


