package com.yedam.tourplan.plan.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.likeplan.service.LikeplanService;
import com.yedam.tourplan.likeplan.service.LikeplanVO;
import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.plantable.service.PlanTableVO;

@Controller
@RequestMapping("/plan/")
public class PlanController {
	
	@Autowired
	PlanService planService;
	@Autowired
	LikeplanService likeplanService;
	
	@RequestMapping("select.do")
	public String select(PlanVO vo, Model model, HttpSession session) {
		//model.addAttribute("plan", planService.select(vo));
		PlanTableVO vo2 = new PlanTableVO();
		vo2.setPlannum("2");
		session.setAttribute("vo", vo2);
		return "plan/plan";
	}
	
	@RequestMapping("selectAll.do")
	public String selectAll(PlanSearchVO vo, Model model) {
		model.addAttribute("planList", planService.selectAll(vo));
		return "plan/planList";
	}
	
	@RequestMapping("selectLike.do")
	public String selectLike(PlanSearchVO vo, Model model) {
		//ID 세션에!!★★★
		vo.setMembernum("1");
		model.addAttribute("planList", planService.selectAll(vo));
		return "member/myPage/likeplan";
	}
	
	@RequestMapping("insert.do")
	public String insert(PlanVO vo) {
		planService.insert(vo);
		
		//likecount가 0이되면 들어가지 않아 기본값 1을 줌
		LikeplanVO lp_vo = new LikeplanVO();
		lp_vo.setplannum(vo.getPlannum());
		lp_vo.setMembernum("1");
		likeplanService.insert(lp_vo);
		
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
