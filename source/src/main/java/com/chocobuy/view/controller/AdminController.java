package com.chocobuy.view.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.chocobuy.biz.admin.AdminChatRoomVO;
import com.chocobuy.biz.admin.AdminInquiryVO;
import com.chocobuy.biz.admin.AdminMsgVO;
import com.chocobuy.biz.admin.AdminPayVO;
import com.chocobuy.biz.admin.AdminService;
import com.chocobuy.biz.admin.AdminServiceVO;
import com.chocobuy.biz.admin.AdminTradeVO;
import com.chocobuy.biz.admin.AdminUserVO;
import com.chocobuy.biz.chat.ChatRoomVO;
import com.chocobuy.biz.chat.ChatService;
import com.chocobuy.biz.pay.PayService;
import com.chocobuy.biz.pay.PayVO;
import com.chocobuy.biz.user.UserVO;
import com.chocobuy.biz.util.PagingVO;


@Controller
@SessionAttributes("admin")
public class AdminController {
	@Autowired
	private AdminService adminService;
	@Autowired
	private PayService payService;

	@RequestMapping("/Admin/adminMain")
	public String getAdminUserList(AdminUserVO vo, PagingVO pv, Model model, @RequestParam(value = "nowPage", required = false) String nowPage, HttpServletRequest request) {
		AdminUserVO userVo = new AdminUserVO();
		userVo.setUser_uuid((String)request.getSession().getAttribute("user_uuid"));
		userVo = adminService.getUser(userVo);
		if( userVo != null) {
			request.getSession().setAttribute("user_nick", userVo.getUser_nick());
		}
		
		String cntPerPage = "20";
		
		if(vo.getRole0()==0 && vo.getRole1()==0 && vo.getRole2()==0 && vo.getRole100()==0) {
			vo.setRole0(1);
			vo.setRole1(1);
			vo.setRole2(1);
			vo.setRole100(1);
		}
		if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
		else vo.setSearchKeyword("");
		int total = adminService.countUser(vo);
		if (nowPage == null)  nowPage = "1";
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		
		model.addAttribute("adminUserList", adminService.getUserList(vo));
		return "/Admin/AdminMain";
	}
	
	@RequestMapping("/Admin/adminTrade")
	public String getAdminTradeList(AdminTradeVO vo, Model model, PagingVO pv, @RequestParam(value = "nowPage", required = false) String nowPage) {
		String cntPerPage = "20";
		
		if(vo.getCategory1()==0 && vo.getCategory2()==0 && vo.getCategory3()==0 && vo.getCategory4()==0 && vo.getCategory5()==0 && vo.getCategory6()==0 && vo.getCategory7()==0) {
			vo.setCategory1(1);
			vo.setCategory2(1);
			vo.setCategory3(1);
			vo.setCategory4(1);
			vo.setCategory5(1);
			vo.setCategory6(1);
			vo.setCategory7(1);
		}
		if(vo.getReport1()==0 && vo.getReport2()==0) {
			vo.setReport1(1);
			vo.setReport2(1);
		}
		if (vo.getHidden1()==0 && vo.getHidden2()==0) {
			vo.setHidden1(1);
			vo.setHidden2(1);
		}
		if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
		else vo.setSearchKeyword("");
		int total = adminService.countTrade(vo);
		if (nowPage == null)  nowPage = "1";
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		
		model.addAttribute("adminTradeList", adminService.getTradeList(vo));
		return "/Admin/AdminTrade";
	}
	
	@RequestMapping("/Admin/adminPay")
	public String getAdminPayList(AdminPayVO vo, Model model, PagingVO pv, @RequestParam(value = "nowPage", required = false) String nowPage) {
		String cntPerPage = "20";
	
		if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
		else vo.setSearchKeyword("");
		int total = adminService.countPay(vo);
		if (nowPage == null)  nowPage = "1";
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		
		model.addAttribute("adminPayList", adminService.getPayList(vo));
		return "/Admin/AdminPay";
	}
	
	@RequestMapping("/Admin/adminService")
	public String getAdminServiceList(AdminServiceVO vo, Model model, PagingVO pv, @RequestParam(value = "nowPage", required = false) String nowPage) {
		String cntPerPage = "20";
		
		if(vo.getNotice()==0 && vo.getFaq()==0) {
			vo.setNotice(1);
			vo.setFaq(1);
		}
		if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
		else vo.setSearchKeyword("");
		int total = adminService.countService(vo);
		if (nowPage == null)  nowPage = "1";
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		
		model.addAttribute("adminServiceList", adminService.getServiceList(vo));
		return "/Admin/AdminService";
	}
	
	@RequestMapping("/Admin/adminInquiry")
	public String getAdminInquiryList(AdminInquiryVO vo, Model model, PagingVO pv, @RequestParam(value = "nowPage", required = false) String nowPage) {
		String cntPerPage = "20";
		
		if(vo.getDone0()==0 && vo.getDone1()==0) {
			vo.setDone0(1);
			vo.setDone1(1);			
		}
		if(vo.getDisplay0()==0 && vo.getDisplay1()==0) {
			vo.setDisplay0(1);
			vo.setDisplay1(1);
		}
		if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
		else vo.setSearchKeyword("");
		int total = adminService.countInquiry(vo);
		if (nowPage == null)  nowPage = "1";
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		
		model.addAttribute("adminInquiryList", adminService.getInquiryList(vo));
		return "/Admin/AdminInquiry";
	}
	
	@RequestMapping("/Admin/adminChat")
	public String getAdminChatroomList(AdminChatRoomVO vo, Model model, PagingVO pv, @RequestParam(value = "nowPage", required = false) String nowPage) {
		String cntPerPage = "20";
		
		if(vo.getReport0()==0 && vo.getReport1()==0) {
			vo.setReport0(1);
			vo.setReport1(1);			
		}
		
		if (vo.getSearchKeyword() != null) vo.setSearchKeyword(vo.getSearchKeyword());
		else vo.setSearchKeyword("");
		int total = adminService.countChatRoom(vo);
		if (nowPage == null)  nowPage = "1";
		
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		
		model.addAttribute("adminChatRoomList", adminService.getChatRoomList(vo));
		return "/Admin/AdminChat";
	}
	
	@RequestMapping(value="/Admin/adminInsertUser", method=RequestMethod.POST)
	public String adminInsertUserPost(AdminUserVO vo, Model model) {
		adminService.insertUser(vo);
		return "redirect:/Admin/adminMain";
	}
	
	@RequestMapping(value="/Admin/adminInsertUser")
	public String adminInsertUserGet(AdminUserVO vo, Model model) {
		return "/Admin/AdminInsertUser";
	}
	
	@RequestMapping("/Admin/adminGetUser")
	public String adminGetUser(AdminUserVO vo, Model model, HttpServletRequest request) {
		model.addAttribute("adminUser", adminService.getUser(vo));
		return "/Admin/AdminGetUser";
	}
	
	@RequestMapping("/Admin/adminGetChat")
	public String adminGetChat(AdminChatRoomVO chat, AdminMsgVO vo, Model model, HttpServletRequest request) {
		chat.setChatroom_seq(vo.getChatroom_seq());
		model.addAttribute("adminChatRoom", adminService.getChatRoom(chat));
		
		model.addAttribute("adminMsgList", adminService.getMsgList(vo));
		return "/Admin/AdminGetChat";
	}

	@RequestMapping("/Admin/adminUpdateUser")
	public String adminUpdateUser(AdminUserVO vo, Model model) {
		adminService.updateUser(vo);
		return "redirect:/Admin/AdminMain";
	}
	
	@RequestMapping("/Admin/getPay")
	public String adminUpdateUser(AdminPayVO vo, Model model) {
		PayVO vo2 = new PayVO();
		vo2.setPay_num(vo.getPay_num());
		model.addAttribute("pay", payService.getPay(vo2));
		return "/Pay/PayComplete";
	}
	
	@ResponseBody
	@RequestMapping("/Admin/hideTrade")
	public String adminHideTrade(@RequestParam(value="array[]") Integer[] array) {
		for(int i=0; i<array.length; i++) {
			AdminTradeVO vo = new AdminTradeVO();
			vo.setTrade_seq(array[i]);
			adminService.hideTrade(vo);
		}
		return "redirect:/Admin/adminTrade";
	}
	
	@ResponseBody
	@RequestMapping("/Admin/showTrade")
	public String adminShowTrade(@RequestParam(value="array[]") Integer[] array) {
		for(int i=0; i<array.length; i++) {
			AdminTradeVO vo = new AdminTradeVO();
			vo.setTrade_seq(array[i]);
			adminService.showTrade(vo);
		}
		return "redirect:/Admin/adminTrade";
	}

	@ResponseBody
	@RequestMapping("/Admin/hideService")
	public String adminHideService(@RequestParam(value="array[]") Integer[] array) {
		for(int i=0; i<array.length; i++) {
			AdminServiceVO vo = new AdminServiceVO();
			vo.setService_seq(array[i]);
			adminService.hideService(vo);
		}
		return "redirect:/Admin/adminService";
	}
	
	@ResponseBody
	@RequestMapping("/Admin/showService")
	public String adminShowService(@RequestParam(value="array[]") Integer[] array) {
		for(int i=0; i<array.length; i++) {
			AdminServiceVO vo = new AdminServiceVO();
			vo.setService_seq(array[i]);
			adminService.showService(vo);
		}
		return "redirect:/Admin/adminService";
	}

	@ResponseBody
	@RequestMapping("/Admin/hideInquiry")
	public String adminHideInquiry(@RequestParam(value="array[]") Integer[] array) {
		for(int i=0; i<array.length; i++) {
			AdminInquiryVO vo = new AdminInquiryVO();
			vo.setInq_num(array[i]);
			adminService.hideInquiry(vo);
		}
		return "redirect:/Admin/adminInquiry";
	}
	
	@ResponseBody
	@RequestMapping("/Admin/showInquiry")
	public String adminShowInquiry(@RequestParam(value="array[]") Integer[] array) {
		for(int i=0; i<array.length; i++) {
			AdminInquiryVO vo = new AdminInquiryVO();
			vo.setInq_num(array[i]);
			adminService.showInquiry(vo);
		}
		return "redirect:/Admin/adminInquiry";
	}

	@ResponseBody
	@RequestMapping("/Admin/doneInquiry")
	public String adminDoneInquiry(@RequestParam(value="array[]") Integer[] array) {
		for(int i=0; i<array.length; i++) {
			AdminInquiryVO vo = new AdminInquiryVO();
			vo.setInq_num(array[i]);
			adminService.doneInquiry(vo);
		}
		return "redirect:/Admin/adminInquiry";
	}
	
	@ResponseBody
	@RequestMapping("/Admin/undoneInquiry")
	public String adminUndoneInquiry(@RequestParam(value="array[]") Integer[] array) {
		for(int i=0; i<array.length; i++) {
			AdminInquiryVO vo = new AdminInquiryVO();
			vo.setInq_num(array[i]);
			adminService.undoneInquiry(vo);
		}
		return "redirect:/Admin/adminInquiry";
	}

}
