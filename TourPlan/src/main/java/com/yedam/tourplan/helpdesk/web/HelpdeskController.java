package com.yedam.tourplan.helpdesk.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.tourplan.helpdesk.service.HelpdeskSearchVO;
import com.yedam.tourplan.helpdesk.service.HelpdeskService;

@Controller
@SessionAttributes("helpdesk")
@RequestMapping("helpdesk/")
public class HelpdeskController {
	@Autowired HelpdeskService helpdeskService;
	
	@RequestMapping("selectAll.do")
	public String selectAll(HelpdeskSearchVO vo, Model model) {
		return "helpdesk/selectAll";
	}

}
