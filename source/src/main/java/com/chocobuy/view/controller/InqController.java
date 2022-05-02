package com.chocobuy.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.chocobuy.biz.inquiry.InqReplyService;
import com.chocobuy.biz.inquiry.InqReplyVO;
import com.chocobuy.biz.inquiry.InqService;
import com.chocobuy.biz.inquiry.InqVO;
import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;
import com.chocobuy.biz.util.PagingVO;

@Controller
@SessionAttributes("inq")
public class InqController {
	
	@Autowired
	private InqService inqService;
	
	@Autowired
	private InqReplyService inqReplyService;
	
	@Autowired
	private UserService userService;

//	private HttpServletRequest request;
	
	//상대 경로 추가 시 realPath 추가
//    private String realPath = request.getSession().getServletContext().getRealPath("/");
	String realPath = "/resources/" ;
    
	@ModelAttribute("inqConditionMap")
	public Map<String, String> inq_searchConditionMap() {
		Map<String, String> inqConditionMap = new HashMap<String, String>();
		inqConditionMap.put("내용", "INQ_CONTENT");
		inqConditionMap.put("제목", "INQ_TITLE");
		return inqConditionMap;
	}


	// 글 등록완료
	@RequestMapping(value = "/Inquiry/InsertInq", method=RequestMethod.POST)
	public String insertInq(UserVO vo, InqVO inqVo, MultipartHttpServletRequest request) throws IOException{
		//파일 업로드 처리 
		//board테이블에 컬럼추가하기 ALTER TABLE board ADD COLUMN filename varchar(200);
		MultipartFile inq_uploadFile = inqVo.getInq_uploadFile();
		
		if(!inq_uploadFile.isEmpty()) {
			String inqFileName = inq_uploadFile.getOriginalFilename();
			
			File inqfile = new File(realPath+inqFileName);
			inqVo.setInq_filename(inqFileName);
			if(!inqfile.exists()) {
				inqfile.mkdirs();
			}
			inq_uploadFile.transferTo(inqfile);
		}

		
		inqService.insertInq(inqVo);
		return "redirect:/Inquiry/GetInqList";
	}
	
	// 글 등록페이지 이동하기
		@RequestMapping(value = "/Inquiry/InsertInq")
		public String InsertInq(UserVO vo, InqVO inqVo, HttpServletRequest request) throws Exception{
			
			vo.setUser_uuid((String) request.getSession().getAttribute("UserInfo"));
			vo = userService.getUserInfo(vo);
			request.setAttribute("nick_ck", vo.getUser_nick());
			
			
			return "/Inquiry/InsertInq";
		}
	

	// 글 수정
	@RequestMapping("/Inquiry/UpdateInq")
	public String updateInq(@ModelAttribute("inq") InqVO inqVo, HttpSession session) {
		if( inqVo.getInq_nickname().equals(session.getAttribute("user_nick").toString()) ){
			inqService.updateInq(inqVo);
			return "redirect:/Inquiry/GetInqList";
		}else {
			return "/Inquiry/GetInq?error=1";
		}
		
	}

	// 글 삭제
	@RequestMapping("/Inquiry/DeleteInq")
	public String deleteInq(@ModelAttribute("inq") InqVO inqVo, HttpSession session) {
		if( inqVo.getInq_nickname().equals(session.getAttribute("user_nick").toString()) ) {
			if(inqVo.getInq_filename()!=null) {
				System.out.println("파일삭제: "+realPath + inqVo.getInq_filename());
				File f = new File(realPath + inqVo.getInq_filename());		
				f.delete();
			}
		}
		inqService.deleteInq(inqVo);
		return "redirect:/Inquiry/GetInqList";
	}

	// 글 상세 조회
	@RequestMapping("/Inquiry/GetInq")
	public String getInq(InqVO inqVo, UserVO vo, InqReplyVO inqReplyVo, Model model, HttpServletRequest request) {
		System.out.println(inqVo);
		System.out.println("에러?1");
		inqReplyVo.setInqRe_bno(inqVo.getInq_num());
		System.out.println("에러?2");
		System.out.println("에러?3");
		
		if(inqService.getInq(inqVo) == null) {
			inqVo.setInq_num((Integer) request.getAttribute("inqNum"));
			inqReplyVo.setInqRe_bno((Integer) request.getAttribute("inqNum"));
			System.out.println((Integer) request.getAttribute("inqNum"));
		}
		
		model.addAttribute("inq", inqService.getInq(inqVo));

		System.out.println(inqVo+"22");
//		댓글기능 목록
		model.addAttribute("inqReplyList", inqReplyService.getInqReplyList(inqReplyVo));
		
		vo.setUser_uuid((String)request.getSession().getAttribute("UserInfo"));
		model.addAttribute("vo_ck", inqService.getVo_ck(vo));
		
		System.out.println(inqReplyVo);
		System.out.println("에러?4");
		
		
//		팝업창 or getInq창
//		if() {
//			
//		}else {
//			return "/Inquiry/GetInq";
//		}
		
		return "/Inquiry/GetInq";
		
	}
	// 댓글 작성
	@RequestMapping(value = "/Inquiry/InsertInqReply")
	public String insertInqReply(InqVO inqVo, InqReplyVO inqReplyVo, MultipartHttpServletRequest request, Model model) throws IOException{
		System.out.println(inqReplyVo.getInqRe_bno()+" zz");
		request.setAttribute("inqNum", inqReplyVo.getInqRe_bno());
		
		inqReplyService.insertInqReply(inqReplyVo);
		
		inqVo.setInq_num(inqReplyVo.getInqRe_bno());
		
		return "forward:/Inquiry/GetInq";
	}
	// 댓글 삭제
	@RequestMapping("/Inquiry/DeleteInqReply")
	public String deleteInqReply(InqVO inqVo, InqReplyVO inqReplyVo, HttpServletRequest request, Model model, HttpSession session) throws IOException{
		
		inqReplyVo.setInqRe_bno(Integer.parseInt(request.getParameter("bno")));
		System.out.println(request.getParameter("bno")+"삭제1");
		inqReplyVo.setInqRe_rno(Integer.parseInt(request.getParameter("rno")));
		System.out.println(request.getParameter("rno")+"삭제2");

		request.setAttribute("inqNum", inqReplyVo.getInqRe_bno());
		System.out.println(request.getParameter("bno")+"삭제3");
		inqReplyService.deleteInqReply(inqReplyVo);
		
		model.addAttribute("inqReplyList", inqReplyService.getInqReplyList(inqReplyVo));

		return "forward:/Inquiry/GetInq";
	}	
	// 댓글 수정
//	@RequestMapping("/Inquiry/updateInqReply*")
//	public String updateInqReply(InqVO inqVo, InqReplyVO inqReplyVo, HttpServletRequest request, Model model, HttpSession session) throws IOException{
//		inqReplyService.updateInqReply(inqReplyVo);
//		
//		if( inqReplyVo.getInqRe_nickname().equals(session.getAttribute("userName").toString()) ){
//			inqReplyService.updateInqReply(inqReplyVo);
//			return "getInq";
//		}else {
//			return "getInq?error=1";
//		}
//	}

	// 글 목록
	@RequestMapping("/Inquiry/GetInqList")
	public String getInqListPost(PagingVO pv, UserVO vo, InqVO inqVo, Model model,@RequestParam(value = "nowPage", required = false) String nowPage, HttpServletRequest request) {
		System.out.println("글 목록 검색 처리");
		String cntPerPage = "10";
		if (inqVo.getInq_searchCondition() != null) inqVo.setInq_searchCondition(inqVo.getInq_searchCondition());
		else inqVo.setInq_searchCondition("INQ_TITLE");
		
		if (inqVo.getInq_searchKeyword() != null) inqVo.setInq_searchKeyword(inqVo.getInq_searchKeyword());
		else inqVo.setInq_searchKeyword("");
		System.out.println("000: "+inqVo.getInq_searchCondition());
		System.out.println("111: "+inqVo.getInq_searchKeyword());

		int total = inqService.countInq(inqVo);
		System.out.println(total+"king");
		if (nowPage == null)  nowPage = "1";

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		inqVo.setStart(pv.getStart());
		inqVo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("inqList", inqService.getInqList(inqVo));
		model.addAttribute("inq_searchKeyword", inqVo.getInq_searchKeyword());
		model.addAttribute("inq_searchCondition", inqVo.getInq_searchCondition());
		
		vo.setUser_uuid((String) request.getSession().getAttribute("UserInfo"));
		vo = userService.getUserInfo(vo);
		request.setAttribute("nick_ck", vo.getUser_nick());
		
		return "/Inquiry/GetInqList";
	}
	
	@RequestMapping(value="/Inquiry/inqDownload", method=RequestMethod.GET)
    public void fileDownLoad(@RequestParam(value="inq_filename",defaultValue = "", required=false) String inq_filename, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("INQUIRY 파일 다운로드");
		if (!inq_filename.equals("")) {
	        //(2) 요청파일 정보 불러오기
	        File file = new File(realPath+inq_filename);
	
			// 한글은 http 헤더에 사용할 수 없기 때문에 파일명은 영문으로 인코딩하여 헤더에 적용한다
			String fn = new String(file.getName().getBytes(), "iso_8859_1");
			System.out.println("fn: "+fn);
	
			
			//(3) ContentType설정
			byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
			response.setHeader("Content-Disposition", "attachment; filename=\""+ fn + "\"");
			response.setContentLength(bytes.length);
	//			response.setContentType("image/jpeg");
	        
			response.getOutputStream().write(bytes);
	        response.getOutputStream().flush();
	        response.getOutputStream().close();
        }
    }
	
	
	
	
}
