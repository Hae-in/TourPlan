package com.yedam.tourplan.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.tourplan.category.service.CategoryService;
import com.yedam.tourplan.category.service.CategoryVO;
import com.yedam.tourplan.helpdesk.service.HelpdeskSearchVO;
import com.yedam.tourplan.helpdesk.service.HelpdeskService;
import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.place.service.PlaceSearchVO;
import com.yedam.tourplan.place.service.PlaceService;
import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.report.service.ReportSearchVO;
import com.yedam.tourplan.report.service.ReportService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired MemberService memberService;
	@Autowired PlanService planService;
	@Autowired PlaceService placeService;
	@Autowired ReportService reportService;
	@Autowired HelpdeskService helpdeskService;
	@Autowired CategoryService categoryService;
	
	@RequestMapping("member.do")
	public String member(MemberSearchVO vo, Model model) {
		model.addAttribute("memberList", memberService.selectAll(vo));
		return "admin/adminMember";
	}	
	
	@RequestMapping("plan.do")
	public String plan(PlanSearchVO vo, Model model) {
		model.addAttribute("planList", planService.selectAll(vo));
		return "admin/adminPlan";
	}
	
	@RequestMapping("place.do")
	public String place(PlaceSearchVO vo, Model model) {
		model.addAttribute("placeList", placeService.selectAll(vo));
		return "admin/adminPlace";
	}	
	
	@RequestMapping("report.do")
	public String report(ReportSearchVO vo, Model model) {
		model.addAttribute("reportList", reportService.selectAll(vo));
		return "admin/adminReport";
	}		
	
	@RequestMapping("helpdesk.do")
	public String helpdesk(HelpdeskSearchVO vo, Model model) {
		model.addAttribute("helpdeskList", helpdeskService.selectAll(vo));
		return "admin/adminHelpdesk";
	}
	
	@RequestMapping("category.do")
	public String category(CategoryVO vo, Model model) {
		model.addAttribute("categoryList", categoryService.selectAll(vo));
		return "admin/adminCategory";
	}	
	
}
