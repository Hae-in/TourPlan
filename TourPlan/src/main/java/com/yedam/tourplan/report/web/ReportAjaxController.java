package com.yedam.tourplan.report.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.report.service.ReportSearchVO;
import com.yedam.tourplan.report.service.ReportService;
import com.yedam.tourplan.report.service.ReportVO;

@Controller
@RequestMapping("/reportAjax/")
public class ReportAjaxController {
	
	@Autowired
	ReportService reportService;
	
	@RequestMapping("selectAll")
	@ResponseBody
	public List<ReportVO> selectAll(ReportSearchVO vo) {
		return reportService.selectAll(vo);
	}
	
	@RequestMapping("adminUpdate.do")
	@ResponseBody
	public void update(ReportVO vo, HttpServletRequest request) {
		String oper = request.getParameter("oper");
		if(oper.equals("edit")) {
			vo.setReportnum(request.getParameter("id"));
			reportService.update(vo);
		} else if(oper.equals("del")) {
			vo.setReportnum(request.getParameter("id"));
			reportService.delete(vo);
		}
	}	
	
/*	@RequestMapping("insertPlan")
	@ResponseBody
	public boolean insertPlan(ReportVO vo) {
		return reportService.insertPlan(vo);
	}*/
}
