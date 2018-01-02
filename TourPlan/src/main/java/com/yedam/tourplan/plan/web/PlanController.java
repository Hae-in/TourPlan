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

import com.yedam.tourplan.common.Paging;
import com.yedam.tourplan.files.service.FilesService;
import com.yedam.tourplan.files.service.FilesVO;
import com.yedam.tourplan.likeplan.service.LikeplanService;
import com.yedam.tourplan.likeplan.service.LikeplanVO;
import com.yedam.tourplan.member.service.MemberSearchVO;
import com.yedam.tourplan.member.service.MemberService;
import com.yedam.tourplan.member.service.MemberVO;
import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.plan.service.SharePlanVO;
import com.yedam.tourplan.plantable.service.PlanTableService;
import com.yedam.tourplan.plantable.service.PlanTableVO;
import com.yedam.tourplan.post.service.PostService;
import com.yedam.tourplan.post.service.PostVO;

@Controller
@RequestMapping("/plan/")
public class PlanController {
	
	@Autowired
	PlanService planService;
	@Autowired
	MemberService memberService;
	@Autowired
	FilesService filesService;
	@Autowired
	PlanTableService planTableService;
	@Autowired
	LikeplanService likePlanService;
	@Autowired
	PostService postService;
	
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
	public String selectAll(PlanSearchVO vo, Model model, Paging paging, HttpSession session) {
		//전체 건수
		int total = planService.selectListTotCnt(vo);
		paging.setTotalRecord(total);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());	
		
		if(session.getAttribute("membernum") == null) {}
		else {
			String mem_num = (String) session.getAttribute("membernum");
			vo.setMembernumMy(mem_num);
		}
		model.addAttribute("planList", planService.selectAll(vo));
		model.addAttribute("paging", paging);
		return "plan/planList";
	}
	
	@RequestMapping("makePlan.do")
	public String makePlan(PlanVO vo, HttpSession session, Model model) {
		return "plan/makePlan";
	}
	
	@RequestMapping("selectMade.do")
	public String selectMade(PlanSearchVO vo, Model model, Paging paging, HttpSession session) {
		String mem_id = (String) session.getAttribute("memberid");
		vo.setId(mem_id);
		
		//전체 건수
		int total = planService.selectListTotCnt(vo);
		paging.setTotalRecord(total);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		
		model.addAttribute("planList", planService.selectAll(vo));
		model.addAttribute("paging", paging);
		return "member/myPage/myPlan";
	}
	
	@RequestMapping("selectLike.do")
	public String selectLike(PlanSearchVO vo, Model model, Paging paging, HttpSession session) {
		String mem_num = (String) session.getAttribute("membernum");
		vo.setMembernum(mem_num);
		vo.setMembernumMy(mem_num);
		
		//전체 건수
		int total = planService.selectListTotCnt(vo);
		paging.setTotalRecord(total);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
				
		model.addAttribute("planList", planService.selectAll(vo));
		model.addAttribute("paging", paging);
		return "member/myPage/likeplan";
	}
	
	@RequestMapping("modify.do") 
	public String modify(PlanSearchVO vo, Model model) {
		PlanVO s_vo = planService.select(vo);
		
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
		
		model.addAttribute("old_vo" , s_vo);
		return "plan/ModifyPlan";
	}
	
	@RequestMapping("myUpdate.do") 
	public String myUpdate(PlanSearchVO vo, Model model) {
		PlanVO s_vo = planService.select(vo);
		
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
		
		model.addAttribute("vo", s_vo);
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
			vo.setPlannum(request.getParameter("id"));
			planService.update(vo);
		} else if(oper.equals("del")) {
			String plannum = request.getParameter("id");
			vo.setPlannum(plannum);
			PlanTableVO t_vo = new PlanTableVO();
			LikeplanVO l_vo = new LikeplanVO();
			SharePlanVO s_vo = new SharePlanVO();
			PostVO p_vo = new PostVO();
			p_vo.setPlannum(plannum);
			s_vo.setPlannum(plannum);
			l_vo.setplannum(plannum);
			t_vo.setPlannum(plannum);
			likePlanService.delete(l_vo);
			planTableService.delete(t_vo);
			postService.delete(p_vo);
			planService.deleteShare(s_vo);
			planService.delete(vo);
		}
	}
	
	@RequestMapping("delete.do")
	public String delete(PlanVO vo) {
		String plannum = vo.getPlannum();
		PlanTableVO t_vo = new PlanTableVO();
		LikeplanVO l_vo = new LikeplanVO();
		l_vo.setplannum(plannum);
		t_vo.setPlannum(plannum);
		likePlanService.delete(l_vo);
		planTableService.delete(t_vo);
		planService.delete(vo);
		return "forward:selectMade.do";
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
				map.put("member1nick", list.get(0).getNickname());
				map.put("member2nick", "");
				map.put("member3nick", "");
			} else if(list.size() == 2) {
				map.put("member1", list.get(0).getMembernum());
				map.put("member2", list.get(1).getMembernum());
				map.put("member3", "");
				map.put("member1nick", list.get(0).getNickname());
				map.put("member2nick", list.get(1).getNickname());
				map.put("member3nick", "");
			} else {
				map.put("member1", list.get(0).getMembernum());
				map.put("member2", list.get(1).getMembernum());
				map.put("member3", list.get(2).getMembernum());
				map.put("member1nick", list.get(0).getNickname());
				map.put("member2nick", list.get(1).getNickname());
				map.put("member3nick", list.get(2).getNickname());
			}
			
			MemberSearchVO temp_m = new MemberSearchVO();
			temp_m.setMembernum(map.get("writer"));
			MemberVO m = memberService.select(temp_m);
			map.put("writernick", m.getNickname());
			
			if(planService.insertShare(map) > 0) {
				System.out.println("공유인서트성공");
			} else { System.out.println("공유인서트 실패"); }
				
		}
		
		return "forward:shareView.do?plannum="+request.getParameter("plan_num");
	}
	
	@RequestMapping("selectShare.do")
	public String selectShare(SharePlanVO s_vo, Model model, Paging paging, HttpSession session) {
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
		
		//전체 건수
		int total = planService.selectListTotCnt(vo);
		paging.setTotalRecord(total);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());
		
		String mem_num = (String) session.getAttribute("membernum");
		vo.setMembernumMy(mem_num);
		
		model.addAttribute("planList", planService.selectAll(vo));
		model.addAttribute("shareList", list);
		model.addAttribute("paging", paging);
		return "member/myPage/myShare";
	}
}
