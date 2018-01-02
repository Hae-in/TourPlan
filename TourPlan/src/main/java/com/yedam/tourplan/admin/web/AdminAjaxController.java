package com.yedam.tourplan.admin.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;

@Controller
@RequestMapping("/adminAjax/")
public class AdminAjaxController {
	
	@Autowired
	PlanService planService;
	
	//뷰
	@RequestMapping("view")
	public String planView() {
		return "admin/jqTest";
	}
	
	//전체조회
	@RequestMapping("select")
	@ResponseBody
	public List<PlanVO> selectAll(PlanSearchVO vo) {
		return planService.selectAll(vo);
	}
	
}
