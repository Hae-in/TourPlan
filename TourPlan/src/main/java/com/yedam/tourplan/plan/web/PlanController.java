package com.yedam.tourplan.plan.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;

@Controller
@RequestMapping("/plan/")
public class PlanController {
	
	@Autowired
	PlanService planService;
	
	@RequestMapping("select.do")
	public String select(PlanVO vo, Model model) {
		model.addAttribute("plan", planService.select(vo));
		return "plan/plan";
	}
	
	@RequestMapping("selectAll.do")
	public String selectAll(PlanSearchVO vo, Model model) {
		model.addAttribute("planList", planService.selectAll(vo));
		return "plan/planList";
	}
	
	@RequestMapping("insert.do")
	public String insert(PlanVO vo) {
		planService.insert(vo);
		return "forward:selectAll.do";
	}
	
	@RequestMapping("update.do")
	public String update(PlanVO vo) {
		planService.update(vo);
		return "forward:selectAll.do";
	}
	
	@RequestMapping("adminUpdate.do")
	@ResponseBody
	public void adminUpdate(PlanVO vo, HttpServletRequest request) {
		String oper = request.getParameter("oper");
		if(oper.equals("edit")) {
			planService.update(vo);
		} else if(oper.equals("del")) {
			vo.setPlannum(request.getParameter("id"));
			planService.delete(vo);
		}
	}
	
	@RequestMapping("delete.do")
	public String delete(PlanVO vo) {
		planService.delete(vo);
		return "forward:selectAll.do";
	}
	
}
