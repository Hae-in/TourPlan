package com.yedam.tourplan.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;

@Controller
@RequestMapping("/memberAjax/")
public class MemberAjaxController {

	@Autowired
	MemberService memberService;

	@RequestMapping("select")
	@ResponseBody
	public boolean select(MemberSearchVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		MemberVO m_vo = memberService.select(vo);
		if (m_vo != null) {
			session.setAttribute("memberid", m_vo.getId());
			session.setAttribute("membernum", m_vo.getMembernum());
			return true;
		} else {
			return false;
		}
	}

}
