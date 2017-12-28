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
import com.yedam.tourplan.post.service.PostService;
import com.yedam.tourplan.post.service.PostVO;

@Controller
@RequestMapping("/planTableAjax/")
public class PlanTableAjaxController {
	
	@Autowired
	PlanTableService planTableService;
	@Autowired
	PostService postService;
	
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
	
	@RequestMapping(value="planInsert", method=RequestMethod.POST, headers = {"Content-type=application/json"})
	@ResponseBody
	public boolean planInsert(@RequestBody List<PlanTableVO> list) {
		for(int i=0; i<list.size(); i++) {
			planTableService.insert(list.get(i));
			if(list.get(i).getPostnum() == null || list.get(i).getPostnum().equals("")) {}
			else {
				PostVO p_vo = new PostVO();
				p_vo.setPostnum(list.get(i).getPostnum());
				p_vo.setPlantablenum(list.get(i).getPlantablenum());
				p_vo.setPlannum(list.get(i).getPlannum());
				postService.update(p_vo);
			}
		}
		
		return true;
	}
	
	@RequestMapping(value="planUpdate", method=RequestMethod.POST, headers = {"Content-type=application/json"})
	@ResponseBody
	public boolean planUpdate(@RequestBody List<PlanTableVO> list) {
		PlanTableVO vo = new PlanTableVO();
		vo.setPlannum(list.get(0).getPlannum());
		boolean r = planTableService.delete(vo);
		
		if(r) {
			for(int i=0; i<list.size(); i++) {
				planTableService.insert(list.get(i));
				if(list.get(i).getPostnum() == null || list.get(i).getPostnum().equals("")) {}
				else {
					PostVO p_vo = new PostVO();
					p_vo.setPostnum(list.get(i).getPostnum());
					p_vo.setPlannum(list.get(i).getPlannum());
					p_vo.setPlantablenum(list.get(i).getPlantablenum());
					postService.update(p_vo);
				}
			}
		} else {
			System.out.println("boolean false ***************************");
		}
		
		return true;
	}
}
