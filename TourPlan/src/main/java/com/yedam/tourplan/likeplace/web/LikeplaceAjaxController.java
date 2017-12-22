package com.yedam.tourplan.likeplace.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.likeplace.service.LikeplaceService;
import com.yedam.tourplan.likeplace.service.LikeplaceVO;

@Controller
@RequestMapping("likeplaceAjax")
public class LikeplaceAjaxController {
	
	@Autowired
	LikeplaceService likeplaceService;
	
	@RequestMapping("selectAll.do")
	@ResponseBody
	public List<LikeplaceVO> selectAll(LikeplaceVO vo) {
		return likeplaceService.selectAll(vo);
	}
	
/*	@RequestMapping("insert.do")
	@ResponseBody
	public LikeplaceVO insert(LikeplaceVO vo) {
		likeplaceService.insert(vo);
		return vo;
	}*/
	
	
}
