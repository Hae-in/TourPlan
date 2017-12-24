package com.yedam.tourplan.plan.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.likeplan.service.LikeplanService;
import com.yedam.tourplan.likeplan.service.LikeplanVO;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;
import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.plan.service.SharePlanVO;

@Controller
@RequestMapping("/plan/")
public class PlanController {
	
	@Autowired
	PlanService planService;
	@Autowired
	LikeplanService likeplanService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping("select.do")
	public String select(PlanSearchVO vo, HttpSession session) {
		PlanVO s_vo = planService.select(vo);
		session.setAttribute("vo", s_vo);
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
	public String selectLike(PlanSearchVO vo, Model model, HttpServletRequest request) {
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
	
	@RequestMapping("share.do")
	public String share(HttpServletRequest request) {
		if(request.getParameter("writer").equals("no")) {
			System.out.println("로그인처리해야");
		} else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("plannum", request.getParameter("plan_num"));
			map.put("writer", request.getParameter("writer"));
			map.put("id1", request.getParameter("id1"));
			map.put("id2", request.getParameter("id2"));
			map.put("id3", request.getParameter("id3"));
			
			List<MemberVO> list = memberService.selectShare(map);
			if(list.size() == 1) {
				map.put("member1", list.get(0).getMembernum());
				map.put("member2", "");
				map.put("member3", "");
			} else if(list.size() == 2) {
				map.put("member1", list.get(0).getMembernum());
				map.put("member2", list.get(1).getMembernum());
				map.put("member3", "");
			} else {
				map.put("member1", list.get(0).getMembernum());
				map.put("member2", list.get(1).getMembernum());
				map.put("member3", list.get(2).getMembernum());
			}
			
			if(planService.insertShare(map) > 0) {
				System.out.println("공유인서트성공");
			} else { System.out.println("공유인서트 실패"); }
				
		}
		
		return "forward:shareView.do?plannum="+request.getParameter("plan_num");
	}
	
	@RequestMapping("selectShare.do")
	public String selectShare(SharePlanVO s_vo, Model model, HttpServletRequest request, HttpSession session) {
		s_vo.setKeyword((String) session.getAttribute("membernum"));
		List<SharePlanVO> list = planService.selectShare(s_vo);
		String str = "";
		for(int i=0; i<list.size(); i++) {
			str += list.get(i).getPlannum();
			if(i != list.size()-1)
				str += ",";
		}
		
		PlanSearchVO vo = new PlanSearchVO();
		vo.setPlannum_list(str);
		
		model.addAttribute("planList", planService.selectAll(vo));
		return "member/myPage/likeplan";
	}
}
