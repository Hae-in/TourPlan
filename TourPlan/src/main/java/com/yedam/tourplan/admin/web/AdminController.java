package com.yedam.tourplan.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.tourplan.helpdesk.service.HelpdeskSearchVO;
import com.yedam.tourplan.helpdesk.service.HelpdeskService;
import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired PlanService planService;
	@Autowired HelpdeskService helpdeskService;
	
	@RequestMapping("plan.do")
	public String plan(PlanSearchVO vo, Model model) {
		model.addAttribute("planList", planService.selectAll(vo));
		return "admin/adminPlan";
	}
	
	@RequestMapping("helpdesk.do")
	public String helpdesk(HelpdeskSearchVO vo, Model model) {
		model.addAttribute("helpdeskList", helpdeskService.selectAll(vo));
		return "admin/adminHelpdesk";
	}
	
}
