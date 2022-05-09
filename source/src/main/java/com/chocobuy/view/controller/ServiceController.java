package com.chocobuy.view.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chocobuy.biz.service.ServiceService;
import com.chocobuy.biz.service.ServiceVO;
import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;
import com.chocobuy.biz.util.PagingVO;

@Controller
public class ServiceController {
	@Autowired
	private UserService userService;
	@Autowired
	private ServiceService serviceService;
	
	// 검색 조건 목록 설정
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("제목",  "SERVICE_TITLE");
			conditionMap.put("내용", "SERVICE_CONTENT");
			return conditionMap;
		}
		
	//	상세페이지 화면 리스트 
		@RequestMapping("/Service/getService")
		public String getService(HttpSession session, UserVO uvo, ServiceVO vo, Model model) {
			System.out.println("글 상세 조회 처리"); 
			
			uvo.setUser_uuid(session.getAttribute("UserInfo").toString()); //5월2일 추가
		    UserVO user =  userService.getMypageUser(uvo);//5월2일 추가
		    model.addAttribute("user_role", user.getUser_role());//5월2일 추가
			
			model.addAttribute("service", serviceService.getService(vo));	// Model 정보 저장
			return "/Service/ServiceContent";	// View 이름 리턴
		}
		
	// 글 등록
		@RequestMapping("/Service/insertService")
		public String insertService(ServiceVO vo) throws IOException{
			System.out.println("글 등록 처리");
			serviceService.insertService(vo);
			return "redirect:/Service/getServiceList";
		}
	//
		@RequestMapping("/Service/Servicewrite")
		public String Servicewrite() {
			return "/Service/Servicewrite";
		}
	// 글 수정
		@RequestMapping(value="/Service/updateService",method=RequestMethod.POST)
		public String updateService(@ModelAttribute("service") ServiceVO vo) {
			System.out.println("번호 : " + vo.getService_seq());
			System.out.println("제목 : " + vo.getService_title());
			System.out.println("작성자 : " + vo.getService_writer());
			System.out.println("내용 : " + vo.getService_content());
			System.out.println("등록일 : " + vo.getService_date());
			System.out.println("조회수 : " + vo.getService_cnt());
			System.out.println("작성자 이름 : " + vo.getService_writer());
			serviceService.updateService(vo);
			return "redirect:/Service/getServiceList";
		}
		//
		@RequestMapping(value="/Service/updateService",method=RequestMethod.GET)
		public String updateServiceView(@ModelAttribute("service") ServiceVO vo, Model model) {
			model.addAttribute("service", serviceService.getService(vo));	// Model 정보 저장
			return "/Service/UpdateService";	// View 이름 리턴
		}
		
		// 글 삭제
		@RequestMapping(value="/Service/deleteService")
		public String deleteService(@ModelAttribute("service") ServiceVO vo) {
			System.out.println("번호 : " + vo.getService_seq());
			System.out.println("글 삭제 처리");
			serviceService.deleteService(vo);
			return "redirect:/Service/getServiceList";
		}
		   
		// 글 목록
		@RequestMapping("/Service/getServiceList")
		public String getServiceListPost(HttpSession session, UserVO uvo, PagingVO pv, ServiceVO serviceVo, Model model,@RequestParam(value = "nowPage", required = false) String nowPage) { //5월2일 추가
			System.out.println("글 목록 검색 처리");
			
			uvo.setUser_uuid(session.getAttribute("UserInfo").toString()); //5월2일 추가
		    UserVO user =  userService.getMypageUser(uvo);//5월2일 추가
		    model.addAttribute("user_role", user.getUser_role());//5월2일 추가
			
			String cntPerPage = "5";
			if (serviceVo.getService_searchCondition() != null) serviceVo.setService_searchCondition(serviceVo.getService_searchCondition());
			else serviceVo.setService_searchCondition("SERVIVE_TITLE");
			
			if (serviceVo.getService_searchKeyword() != null) serviceVo.setService_searchKeyword(serviceVo.getService_searchKeyword());
			else serviceVo.setService_searchKeyword("");
			System.out.println("000: "+serviceVo.getService_searchCondition());
			System.out.println("111: "+serviceVo.getService_searchKeyword());

			int total = serviceService.countService(serviceVo);
			System.out.println(total);
			if (nowPage == null)  nowPage = "1";

			pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pv);
			serviceVo.setStart(pv.getStart());
			serviceVo.setListcnt(Integer.parseInt(cntPerPage));

			model.addAttribute("serviceList", serviceService.getServiceList(serviceVo));
			model.addAttribute("service_searchKeyword", serviceVo.getService_searchKeyword());
			model.addAttribute("service_searchCondition", serviceVo.getService_searchCondition());
			return "/Service/ServiceList";
		}
}
		   
