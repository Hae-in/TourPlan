package com.yedam.tourplan.plantable.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.plantable.service.PlanTableService;
import com.yedam.tourplan.plantable.service.PlanTableVO;

@Controller
@RequestMapping("/planTableAjax/")
public class PlanTableAjaxController {
	
	@Autowired
	PlanTableService planTableService;
	
	@RequestMapping("insert")
	@ResponseBody
	public boolean insert(PlanTableVO vo) {
		return planTableService.insert(vo);
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public boolean delete(PlanTableVO vo) {
		return planTableService.delete(vo);
	}
	
	@RequestMapping("selectPT")
	@ResponseBody
	public List<PlanTableVO> selectPT(PlanTableVO vo) {
		return planTableService.selectPT(vo);
	}
}