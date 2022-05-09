package com.my.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chocobuy.biz.chat.ChatRoomVO;
import com.chocobuy.biz.chat.ChatService;

public class ChatInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	ChatService chatService;

	static final String[] EXCLUDE_URL_LIST = {
		"/login", "/join", "/index" 
	};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//http://localhost:8080/Chat/Chat?trade_seq=12
		String reqUrl = request.getRequestURL().toString(); // http://localhost:8080/Chat/MsgInsert
		String uri = request.getRequestURI();  //  /Chat/MsgInsert
		String context = request.getContextPath();  //  /
		
//		인덱스 패스
		String path = uri.substring(context.length()); 
		if(path.equals("/")) {
			return true;
		}
		
//		로그인체크 제외 리스트 
		for (String target : EXCLUDE_URL_LIST) {
			if (reqUrl.indexOf(target) > -1) {
				return true;
			}
		}
		///
		HttpSession session = request.getSession();
		String UserInfo = (String)session.getAttribute("UserInfo");
		
		if(UserInfo == null || UserInfo.trim().equals("")) {
			session.invalidate();
			
			response.sendRedirect("/Login/login");
			return false;
		}
		
		int trade_seq = Integer.parseInt(request.getParameter("trade_seq")); 
		ChatRoomVO vo = new ChatRoomVO();
		vo.setTrade_seq(trade_seq);
		vo.setUser_uuid(UserInfo);
		int cnt = chatService.countRoom(vo);
		
		if(cnt<= 0) {
			response.sendRedirect("/Login/login");
			return false;	
		}
		
		return true;
	}
	
} 	
