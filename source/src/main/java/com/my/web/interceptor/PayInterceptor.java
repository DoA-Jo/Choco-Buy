
package com.my.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PayInterceptor extends HandlerInterceptorAdapter {

	static final String[] EXCLUDE_URL_LIST = {
		"/login", "/join", "/index" 
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
//		for (String target : EXCLUDE_URL_LIST) {
//			if (reqUrl.indexOf(target) > -1) {
//				return true;
//			}
//		}
//		///
//		HttpSession session = request.getSession();
//		String user_nick = (String)session.getAttribute("user_nick");
//		
//		if(user_nick == null || user_nick.trim().equals("")) {
//			session.invalidate();
//			
//			response.sendRedirect("/Login/login.jsp");
//			return false;
//		}
//		if(!user_nick.equals(request.getParameter("trade_nick"))) {
//			response.sendRedirect("/Login/login.jsp");
//			return false;	
//			
//		}
		
		return true;
	}
}
