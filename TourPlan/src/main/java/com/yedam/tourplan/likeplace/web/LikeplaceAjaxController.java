package com.yedam.tourplan.likeplace.web;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("insert.do")
	@ResponseBody
	public LikeplaceVO insert(LikeplaceVO vo, HttpSession session) {
		vo.setMembernum((String)session.getAttribute("membernum"));
		System.out.println("파라미터 값 : " + vo);		
		if(vo.getLikeplacenum() == null || vo.getLikeplacenum().equals("")) {
			likeplaceService.insert(vo);
		} else {
			likeplaceService.delete(vo);
			vo.setLikeplacenum("");
		}		
		return vo;
	}	
	
}
