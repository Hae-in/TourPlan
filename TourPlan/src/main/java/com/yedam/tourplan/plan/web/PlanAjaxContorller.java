package com.yedam.tourplan.plan.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;

@Controller
@RequestMapping("/planAjax/")
public class PlanAjaxContorller {
	
	@Autowired
	PlanService planService;
	
	//전체조회
	@RequestMapping("selectAll")
	@ResponseBody
	public List<PlanVO> selectAll(PlanSearchVO vo) {
		List<PlanVO> planList = planService.selectAll(vo); 
		return planList;
	}
}
