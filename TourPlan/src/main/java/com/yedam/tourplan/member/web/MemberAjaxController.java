package com.yedam.tourplan.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;

@Controller
@RequestMapping("/memberAjax/")
public class MemberAjaxController {
	
	@Autowired
	MemberService memberService;

	@RequestMapping("select")
	@ResponseBody
	public boolean select(MemberSearchVO vo, Model model) {
		return memberService.select(vo);
	}
}
