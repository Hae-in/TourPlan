package com.yedam.tourplan.report.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.report.service.ReportSearchVO;
import com.yedam.tourplan.report.service.ReportService;
import com.yedam.tourplan.report.service.ReportVO;

@Controller
@RequestMapping("/report/")
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@RequestMapping(value="insert.do", method=RequestMethod.GET)
	public String insertForm(@RequestParam(value="placenum", required=false) String placenum, @RequestParam(value="plannum", required=false) String plannum) {
		System.out.println("bb");
		ReportVO report = new ReportVO();
		report.setPlacenum(placenum);
		report.setPlannum(plannum);
		return "popup/report/insert";
	}
	
	@RequestMapping(value="insert.do", method=RequestMethod.POST)	
	public String insert(ReportVO vo, HttpSession session) {
		vo.setMembernum((String)session.getAttribute("membernum"));
		System.out.println("aa" + vo);
		reportService.insert(vo);
		return "report/insert";
	}
	
/*	@RequestMapping("view.do")
	public String view() {
		return "admin/reportView";
	}*/
	
	
	

}
