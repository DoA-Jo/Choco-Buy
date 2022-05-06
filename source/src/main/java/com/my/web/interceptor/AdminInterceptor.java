package com.my.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.chocobuy.biz.admin.AdminService;
import com.chocobuy.biz.admin.AdminUserVO;
import com.chocobuy.biz.user.UserService;
import com.chocobuy.biz.user.UserVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private UserService service;
	
	static final String[] CHECK_URL_LIST = {
		"/Admin"
	};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		String reqUrl = request.getRequestURL().toString();
		
		for (String target : CHECK_URL_LIST) {
			if (reqUrl.indexOf(target) > -1) {
				HttpSession session = request.getSession();
				String UserInfo = (String)session.getAttribute("UserInfo");
				
				UserVO vo = new UserVO();
				vo.setUser_uuid(UserInfo);
				int role = service.getUserUuid(vo).getUser_role();

				if (role != 100) {
					response.sendRedirect("/Trade/getTradeList");
				}
			}
		}
		return true;
	}
}
