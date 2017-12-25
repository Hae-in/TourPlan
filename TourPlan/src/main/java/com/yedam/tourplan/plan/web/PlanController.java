package com.yedam.tourplan.plan.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;
import com.yedam.tourplan.member.service.MemberSearchVO;
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
	MemberService memberService;
	@Autowired
	FilesService filesService;
	
	@RequestMapping("select.do")
	public String select(PlanSearchVO vo, Model model) {
		String keyword = vo.getKeyword();
		PlanVO s_vo = planService.select(vo);
		
		MemberSearchVO temp = new MemberSearchVO();
		temp.setId(s_vo.getId());
		MemberVO m_vo = memberService.select(temp);
		
		FilesVO f_vo = new FilesVO();
		f_vo.setTablename("member");
		f_vo.setTablenum(m_vo.getMembernum());
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");  
			String departure = s_vo.getDeparturedate(); 
			String arrival = s_vo.getArrivaldate(); 
			
			Date day1 = format.parse(departure);
			Date day2 = format.parse(arrival);
			long l_day = day2.getTime() - day1.getTime();
			int day = (int) (l_day/86400000) + 1;
			
			s_vo.setDay(Integer.toString(day));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("m_picture", filesService.selectAll(f_vo));
		model.addAttribute("plan" , s_vo);
		model.addAttribute("writer", m_vo);
		
		if(keyword == null || keyword.equals("")) {
			return "plan/plan";
		}
		else
			return "plan/updatePlan";
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
	
	@RequestMapping("modify.do") 
	public String modify(PlanVO vo, Model model) {
		model.addAttribute("vo", vo);
		return "plan/makePlan";
	}
	
	@RequestMapping("myUpdate.do") 
	public String myUpdate(PlanSearchVO vo, Model model) {
		model.addAttribute("vo", planService.select(vo));
		return "plan/updatePlan";
	}
	
	@RequestMapping("insert.do")
	public String insert(PlanVO vo, Model model) {
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
		if(list.size() == 0) { str = "0"; } 
		else {
			for(int i=0; i<list.size(); i++) {
				str += list.get(i).getPlannum();
				if(i != list.size()-1)
					str += ",";
			}
		}
		
		PlanSearchVO vo = new PlanSearchVO();
		vo.setPlannum_list(str);
		
		model.addAttribute("planList", planService.selectAll(vo));
		return "member/myPage/likeplan";
	}
}
