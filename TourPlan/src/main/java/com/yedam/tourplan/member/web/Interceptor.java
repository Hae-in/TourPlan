package com.yedam.tourplan.member.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

public class Interceptor extends WebContentInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws ServletException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("membernum") == null) {
			ModelAndView modelAndView = new ModelAndView("redirect:/member/needLogin.do");
			throw new ModelAndViewDefiningException(modelAndView);
		} else {
			return true;
		}
	}
}
