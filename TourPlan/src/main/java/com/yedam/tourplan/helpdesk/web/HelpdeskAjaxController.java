package com.yedam.tourplan.helpdesk.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.helpdesk.service.HelpdeskService;
import com.yedam.tourplan.helpdesk.service.HelpdeskVO;

@Controller
@RequestMapping("helpdeskAjax")
public class HelpdeskAjaxController {
	
	@Autowired HelpdeskService helpdeskService;

	@RequestMapping("selectAll.do")
	@ResponseBody
	public List<HelpdeskVO> selectAll() {
		return helpdeskService.selectAll(null);
	}
	
	@RequestMapping("adminUpdate.do")
	@ResponseBody
	public void update(HelpdeskVO vo, HttpServletRequest request, HttpSession session) {
		String oper = request.getParameter("oper");
		if(oper.equals("edit")) {
			helpdeskService.update(vo);
		} else if(oper.equals("add")) {
			vo.setMembernum((String)session.getAttribute("membernum"));
			helpdeskService.insert(vo);
		} else if(oper.equals("del")) {
			vo.setNum(request.getParameter("id"));
			helpdeskService.delete(vo);
		}
	}

}
