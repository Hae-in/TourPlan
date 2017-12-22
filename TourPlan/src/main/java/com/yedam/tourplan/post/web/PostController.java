package com.yedam.tourplan.post.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.tourplan.place.service.PlaceSearchVO;
import com.yedam.tourplan.place.service.PlaceService;
import com.yedam.tourplan.place.service.PlaceVO;
import com.yedam.tourplan.plantable.service.PlanTableVO;
import com.yedam.tourplan.post.service.PostService;

@Controller
@SessionAttributes("post")
@RequestMapping("/post/")
public class PostController {
	
	@Autowired
	PostService postService;
	@Autowired
	PlaceService placeService;
	
	@RequestMapping("select.do")
	public String View(PlanTableVO vo, Model model) {
		List<PlanTableVO> list_pt = postService.select(vo);
		model.addAttribute("ptList", list_pt);
		
		String num = "";
		for(int i=0; i<list_pt.size(); i++) {
			num += list_pt.get(i).getPlacenum();
			if(i != list_pt.size()-1)
				num += ",";
		}
		
		PlaceSearchVO place = new PlaceSearchVO();
		place.setPlacenum(num);
		List<PlaceVO> list_place = placeService.selectPlace(place);
		
		model.addAttribute("placeList", list_place);
		
		return "post/postView";
	}
}
