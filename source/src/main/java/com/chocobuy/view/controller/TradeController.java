package com.chocobuy.view.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.chocobuy.biz.trade.TradeService;
import com.chocobuy.biz.trade.TradeVO;

@Controller
@SessionAttributes("trade")
public class TradeController {
	
	@Autowired
	private TradeService tradeService;
	

	//로그인
//	@RequestMapping("/Trade/login")
//	public String loginTrade(TradeVO vo) throws IOException{
//		return "/Login/login";
//	}
	//글 등록 페이지로 가기
	@RequestMapping("/Trade/tradeInsert")
	public String insertTradePage(TradeVO vo) throws IOException{
		return "/Trade/TradeInsert";
	}
	
//	// 구매글 등록
//	@RequestMapping("/Trade/insertTrade")
//	public String insertTrade(TradeVO vo) throws IOException{
//		tradeService.insertTrade(vo);
//		return "redirect:/Trade/getTradeList";
//	}
	// 글 등록
	@RequestMapping(value = "/Trade/insertTrade")
	public String insertTrade(TradeVO vo, MultipartHttpServletRequest request , HttpSession session) throws IOException{
		
//	String realPath=request.getSession().getServletContext().getRealPath("/");	
//	String savePath=realPath+"/resources/img/upload/";
	String savePath="C:/swork/ChocoBuyProto/src/main/webapp/resources/img/upload/";
//	System.out.println("realPath : "+realPath);
		MultipartFile trade_uploadImg = vo.getTrade_uploadImg();
		
		if(!trade_uploadImg.isEmpty()) {
			String trade_img = trade_uploadImg.getOriginalFilename();
			
			File file = new File(savePath+trade_img);
			if(!file.exists()) {
				file.mkdirs();
			}
			trade_uploadImg.transferTo(file);
			vo.setTrade_img(trade_img);
		}
		session = request.getSession();
		String UserInfo = (String)session.getAttribute("UserInfo");
		vo.setTrade_imgpath(savePath);
		vo.setTrade_uuid(UserInfo);
		System.out.println("savePath :"+savePath+vo.getTrade_img());
		System.out.println(vo.getTrade_img());
		System.out.println(vo.getTrade_imgpath());
		tradeService.insertTrade(vo);
		return "redirect:/Trade/getTradeList";
	}
	
	
	// 글 수정
	@RequestMapping("/Trade/updateTrade")
	public String updateTrade(@ModelAttribute("trade") TradeVO vo, HttpSession session) {
			tradeService.updateTrade(vo);
			return "redirect:/Trade/getTradeList";
	}
	// 유저 신고
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
	public String getTradeListPost( TradeVO vo, Model model) {
		System.out.println("글 목록 검색 처리");
	
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
		
		model.addAttribute("trade",tradeService.getTrade(vo));
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


