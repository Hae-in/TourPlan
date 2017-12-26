package com.yedam.tourplan.place.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.place.service.PlaceSearchVO;
import com.yedam.tourplan.place.service.PlaceService;
import com.yedam.tourplan.place.service.PlaceVO;

@Controller
@RequestMapping("placeAjax")
public class PlaceAjaxController {
	
	@Autowired
	PlaceService placeService;
	
	//목록
	@RequestMapping("selectAll.do")
	@ResponseBody
	public List<PlaceVO> selectAll(PlaceSearchVO vo) {
		return placeService.selectAll(vo);
	}
	
	

}
