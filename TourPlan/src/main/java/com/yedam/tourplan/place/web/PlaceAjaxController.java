package com.yedam.tourplan.place.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("selectAll.do")
	@ResponseBody
	public List<PlaceVO> selectAll(PlaceSearchVO vo) {
		return placeService.selectAll(vo);
	}

	@RequestMapping("selectAllAdmin.do")
	@ResponseBody
	public List<PlaceVO> selectAllAdmin(PlaceVO vo) {
		return placeService.selectAllAdmin(vo);
	}
	
	@RequestMapping("updateAdmin.do")
	@ResponseBody
	public void updateAdmin(PlaceVO vo, HttpServletRequest request) {
		String oper = request.getParameter("oper");
		if(oper.equals("edit")) {
			placeService.updateState(vo);			
		} else if(oper.equals("add")) {
			placeService.insert(vo);
		} else if(oper.equals("del")) {
			System.out.println(request.getParameter("id"));
			String ids[] = request.getParameter("id").split(",");
			for (int i = 0; i < ids.length; i++) {
				System.out.println("삭제행 : " + ids[i]);
				vo.setPlacenum(ids[i]);
				placeService.delete(vo);
			}			
		}
	}

	@RequestMapping("selectAllKeyword.do")
	@ResponseBody
	public List<PlaceVO> selectAllKeyword(PlaceSearchVO vo) {
		return placeService.selectAllKeyword(vo);
	}

}
