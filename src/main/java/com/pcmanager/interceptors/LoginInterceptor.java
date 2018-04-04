package com.pcmanager.interceptors;


import com.pcmanager.user.constants.Member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private final Logger logger = 
			LoggerFactory.getLogger(LoginInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object controller)
			throws Exception {
		
		String contextPath = request.getContextPath();
		
		if ( request.getSession().getAttribute(Member.USER) == null ) {
			System.out.println("로그인이 필요한 페이지");
			response.sendRedirect(contextPath + "/need/login");
			// return false = 로그인 x 로그인 페이지로 가라
			return false;
		}
		return true;
	}
}