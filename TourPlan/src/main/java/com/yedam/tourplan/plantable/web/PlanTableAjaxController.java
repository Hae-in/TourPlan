package com.yedam.tourplan.plantable.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.plantable.service.PlanTableSearchVO;
import com.yedam.tourplan.plantable.service.PlanTableService;
import com.yedam.tourplan.plantable.service.PlanTableVO;

@Controller
@RequestMapping("/planTableAjax/")
public class PlanTableAjaxController {
	
	@Autowired
	PlanTableService planTableService;
	
	@RequestMapping("insert")
	@ResponseBody
	public boolean insert(PlanTableSearchVO vo) {
		return planTableService.insert(vo);
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public boolean delete(PlanTableSearchVO vo) {
		return planTableService.delete(vo);
	}
	
	@RequestMapping("update")
	@ResponseBody
	public boolean update(PlanTableSearchVO vo) {
		return planTableService.update(vo);
	}
	
	@RequestMapping("selectPT")
	@ResponseBody
	public List<PlanTableVO> selectPT(PlanTableVO vo) {
		return planTableService.selectPT(vo);
	}
	
	/*@RequestMapping(value = "planInsert", method = RequestMethod.POST, consumes="application/x-www-form-urlencoded")
	@ResponseBody
	public boolean planInsert(@RequestBody MultiValueMap<String,Object> list) throws Exception {
		System.out.println("list의 사이즈 : " + list.size());
		return true;
	}*/
	
	//★★★list로 받는거 몰라서 vo로 받게 테스트
	@RequestMapping(value="planInsert", method=RequestMethod.POST)
	@ResponseBody
	public String planInsert(PlanTableVO vo) {
		//★테스트용 안돼서 2개다 그냥 넘김
		vo.setFix("0");
		vo.setSortnum("5");
		vo.setStaytime("30");
		if(planTableService.insert(vo))
			return vo.getPlantablenum();
		else {
			return vo.getPlantablenum();
		}
		
	}
	
	//★★★list로 받는거 몰라서 vo로 받게 테스트
	@RequestMapping(value="planUpdate", method=RequestMethod.POST)
	@ResponseBody
	public boolean planUpdate(PlanTableVO vo) {
		//★테스트용
		vo.setFix("0");
		vo.setSortnum("5");
		vo.setStaytime("30");
		
		return planTableService.update(vo);
	}
}
