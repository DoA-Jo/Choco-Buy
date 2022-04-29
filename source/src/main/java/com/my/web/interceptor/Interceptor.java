package com.my.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {

	static final String[] EXCLUDE_URL_LIST = {
		"/login", "/join/join_tel.do", "/index"
	};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String reqUrl = request.getRequestURL().toString();
		
//		로그인체크 제외 리스트  인덱스번호를 찍으면 무조건 0보다 크니까.....
		for (String target : EXCLUDE_URL_LIST) {
			if (reqUrl.indexOf(target) > -1) {
				return true;
			}
		}
		
		HttpSession session = request.getSession();
		String user_uuid = (String)session.getAttribute("user_uuid");
		String user_nick = (String)session.getAttribute("user_nick");
		
		if(user_uuid == null || user_uuid.trim().equals("")) {
			session.invalidate();
			response.sendRedirect("/Login/login.jsp");
			return false;
		}
		if(!user_nick.equals(request.getParameter("trade_nick"))) {
			response.sendRedirect("/Login/login.jsp");
			return false;	
			
		}
		
		return true;
	}
}
