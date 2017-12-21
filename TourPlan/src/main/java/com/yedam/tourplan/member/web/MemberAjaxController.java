package com.yedam.tourplan.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			session.setAttribute("nickname", m_vo.getNickname());
			session.setAttribute("state", m_vo.getState());
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("insert")//jsp에서 폼에서 입력받은 것을 파라미터 형태로 전송, 이 파라미터가 MemberVO필드 명과 동일하므로 MemberVO에 담긴다(자동으로 변환)
	@ResponseBody//아작스로 받아온 것을 제이슨 형태로 변환해줌
	public boolean insert(MemberVO vo, Model model) {
		return memberService.insert(vo); 
	}

}
