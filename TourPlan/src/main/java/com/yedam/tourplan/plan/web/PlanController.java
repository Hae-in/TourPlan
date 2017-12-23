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
	public String select(PlanSearchVO vo, HttpSession session) {
		//model.addAttribute("plan", planService.select(vo));
		session.setAttribute("vo", vo);
		return "plan/plan";
	}
	
	@RequestMapping("selectAll.do")
	public String selectAll(PlanSearchVO vo, Model model) {
		model.addAttribute("planList", planService.selectAll(vo));
		return "plan/planList";
	}
	
	@RequestMapping("makePlan.do")
	public String makePlan(PlanVO vo, HttpSession session) {
		return "plan/makePlan";
	}
	
	@RequestMapping("selectMade.do")
	public String selectMade(PlanSearchVO vo, Model model) {
		model.addAttribute("planList", planService.selectAll(vo));
		return "member/myPage/myPlan";
	}
	
	@RequestMapping("selectLike.do")
	public String selectLike(PlanSearchVO vo, Model model) {
		//ID 세션에!!★★★
		vo.setMembernum("1");
		model.addAttribute("planList", planService.selectAll(vo));
		return "member/myPage/likeplan";
	}
	
	@RequestMapping("insert.do")
	public String insert(PlanVO vo, Model model, HttpSession session) {
		String isupdate = vo.getIsupdate();
		planService.insert(vo);
		System.out.println(vo.getPlannum());

		PlanVO seq_vo = planService.selectSeq(null);
		System.out.println(seq_vo.getPlannum());
		
		//likecount가 0이되면 들어가지 않아 기본값 1을 줌
		LikeplanVO lp_vo = new LikeplanVO();
		lp_vo.setplannum(seq_vo.getPlannum());
		//lp_vo.setplannum(vo.getPlannum());
		lp_vo.setMembernum("1");
		likeplanService.insert(lp_vo);
		
		if(isupdate == null) {
			session.setAttribute("vo", seq_vo);
			model.addAttribute("plan", seq_vo);
		} else {
			model.addAttribute("plan", seq_vo);
		}
		
		return "plan/makePlan";
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
