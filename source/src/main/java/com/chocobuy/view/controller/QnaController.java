package com.chocobuy.view.controller;

import java.io.IOException;
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

import com.chocobuy.biz.qna.QnaService;
import com.chocobuy.biz.qna.QnaVO;
import com.chocobuy.biz.trade.TradeService;
import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;
import com.chocobuy.biz.util.PagingVO;

@Controller
public class QnaController {
	@Autowired
	private UserService userService;
	@Autowired
	private TradeService tradeService;
	@Autowired
	private QnaService qnaService;

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목",  "QNA_TITLE");
		conditionMap.put("내용", "QNA_CONTENT");
		return conditionMap;
	}
//	상세페이지 화면 리스트   5월3일 수정 
		@RequestMapping("/Service/getQna")  
		public String getService(HttpSession session, UserVO uvo, QnaVO vo, Model model) {
			System.out.println("글 상세 조회 처리");
			
			uvo.setUser_uuid(session.getAttribute("UserInfo").toString()); //5월3일 추가
		    UserVO user =  userService.getMypageUser(uvo);//5월3일 추가
		    model.addAttribute("user_role", user.getUser_role());//5월3일 추가
			
			model.addAttribute("qna", qnaService.getQna(vo));	// Model 정보 저장
			return "/Service/QnaContent";	// View 이름 리턴
		}
		
	// 글 등록
		@RequestMapping("/Service/insertQna")
		public String insertQna(QnaVO vo) throws IOException{
			System.out.println("글 등록 처리");
			qnaService.insertQna(vo);
			return "redirect:/Service/getQnaList";
		}
	//
		@RequestMapping("/Service/Qnawrite")
		public String Qnawrite() {
			return "/Service/Qnawrite";
		}
	// 글 수정
		@RequestMapping(value="/Service/updateQna",method=RequestMethod.POST)
		public String updateQna(@ModelAttribute("qna") QnaVO vo) {
			System.out.println("번호 : " + vo.getQna_seq());
			System.out.println("제목 : " + vo.getQna_title());
			System.out.println("작성자 : " + vo.getQna_writer());
			System.out.println("내용 : " + vo.getQna_content());
//			System.out.println("등록일 : " + vo.getQna_date());
//			System.out.println("조회수 : " + vo.getQna_cnt());
			System.out.println("작성자 이름 : " + vo.getQna_writer());
			qnaService.updateQna(vo);
			return "redirect:/Service/getQnaList";
		}
		//
		@RequestMapping(value="/Service/UpdateQna",method=RequestMethod.GET)
		public String updateQnaView(@ModelAttribute("qna") QnaVO vo, Model model) {
			model.addAttribute("qna", qnaService.getQna(vo));	// Model 정보 저장
			return "/Service/UpdateQna";	// View 이름 리턴
		}
		
		// 글 삭제
		@RequestMapping(value="/Service/deleteQna")
		public String deleteQna(@ModelAttribute("qna") QnaVO vo) {
			System.out.println("번호 : " + vo.getQna_seq());
			System.out.println("글 삭제 처리");
			qnaService.deleteQna(vo);
			return "redirect:/Service/getQnaList";
		}
		
//	@RequestMapping("/Service/QnaController")
//	public String QnaList(QnaVO vo, Model model) {
//		System.out.println("7777");
//		//NULL Check
////		if(vo.getSearchCondition()==null) vo.setSearchCondition("TITLE");
////		if(vo.getSearchKeyword()==null) vo.setSearchKeyword("");
//		
//		// Model 정보 저장
//		model.addAttribute("qnaList", qnaService.QnaList(vo));
//		System.out.println("테스트");
//		return "/Service/QnaList";	// View 이름 리턴
//	}
	
	@RequestMapping(value="/*", method=RequestMethod.GET)
	   public String path(HttpServletRequest request) {
		   System.out.println("/* 컨트롤러");
		   String uri = request.getRequestURI();
		   
		   String context = request.getContextPath();
		   
		   String path = uri.substring(context.length());
		   System.out.println("path: "+path);
		   
		   return path;
	   }
	
	// 글 목록
		@RequestMapping("/Service/getQnaList")
		public String getQnaListPost(HttpSession session, UserVO uvo, PagingVO pv, QnaVO qnaVo, Model model,@RequestParam(value = "nowPage", required = false) String nowPage) {  //5월2일 추가
			System.out.println("글 목록 검색 처리");
			
			uvo.setUser_uuid(session.getAttribute("UserInfo").toString());  //5월2일 추가
		    UserVO user =  userService.getMypageUser(uvo);	//5월2일 추가
		    
		    model.addAttribute("user_role", user.getUser_role());	//5월2일 추가
			
			String cntPerPage = "5";
			if (qnaVo.getQna_searchCondition() != null) qnaVo.setQna_searchCondition(qnaVo.getQna_searchCondition());
			else qnaVo.setQna_searchCondition("QNA_TITLE");
			
			if (qnaVo.getQna_searchKeyword() != null) qnaVo.setQna_searchKeyword(qnaVo.getQna_searchKeyword());
			else qnaVo.setQna_searchKeyword("");
			System.out.println("000: "+qnaVo.getQna_searchCondition());
			System.out.println("111: "+qnaVo.getQna_searchKeyword());

			int total = qnaService.countQna(qnaVo);
			if (nowPage == null)  nowPage = "1";

			pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pv);
			qnaVo.setStart(pv.getStart());
			qnaVo.setListcnt(Integer.parseInt(cntPerPage));
			
			model.addAttribute("qnaList", qnaService.QnaList(qnaVo));
			model.addAttribute("qna_searchKeyword", qnaVo.getQna_searchKeyword());
			model.addAttribute("qna_searchCondition", qnaVo.getQna_searchCondition());
			return "/Service/QnaList";
		}
		
}
