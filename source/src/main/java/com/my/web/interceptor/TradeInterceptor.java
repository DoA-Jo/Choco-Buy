package com.my.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TradeInterceptor extends HandlerInterceptorAdapter {

	static final String[] EXCLUDE_URL_LIST = {
		"/Login", "/Join", "/index" 
	};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String reqUrl = request.getRequestURL().toString();
		String uri = request.getRequestURI(); 
		String context = request.getContextPath();
		
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
//		if(!UserInfo.equals(request.getParameter("trade_uuid"))) {
//			response.sendRedirect("/Login/login");
//			return false;	
//			
//		}
		
		return true;
	}
} 	
