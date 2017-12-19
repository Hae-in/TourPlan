package com.yedam.tourplan.member;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.yedam.tourplan.heart.HeartService;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	HeartService heartDAO;
	@Autowired
	MemberService memberDAO;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("★★★★인터셉터 거치다.");
		MemberVO vo = (MemberVO) request.getSession().getAttribute("login"); // 로그인값에서 유저 정보 가져와서
		if (vo != null) { // 로그인 되어있는 상태이면
			System.out.println("로그인 되어있어서 정보 갱신하는중.............");
			MemberVO result = memberDAO.getMember(vo); // 멤버정보를 result에 담고
			request.getSession().setAttribute("login", result); // result를 다시 login에 담는다.

			heartDAO.getToHeartList(result); // 받은 하트 정보 또한 검색한뒤
			List<Map<String, Object>> heartTo = heartDAO.getToHeartList(result);
			request.getSession().setAttribute("heartto", heartTo); // 세션값에 담는다.
		}

	}
}
