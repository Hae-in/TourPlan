package com.yedam.tourplan.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;


@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	PlanService planService;
	
	//뷰
	@RequestMapping("plan.do")
	public String plan(PlanSearchVO vo, Model model) {
		model.addAttribute("planList", planService.selectAll(vo));
		return "admin/jqTest";
	}
	
}
