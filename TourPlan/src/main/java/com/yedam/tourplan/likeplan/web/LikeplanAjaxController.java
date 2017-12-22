package com.yedam.tourplan.likeplan.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.likeplan.service.LikeplanService;
import com.yedam.tourplan.likeplan.service.LikeplanVO;

@Controller
@RequestMapping("likeplanAjax")
public class LikeplanAjaxController {
	
	@Autowired
	LikeplanService likeplanService;
	
	@RequestMapping("selectAll.do")
	@ResponseBody
	public List<LikeplanVO> selectAll(LikeplanVO vo) {
		return likeplanService.selectAll(vo);
	}
	
	@RequestMapping("insert.do")
	@ResponseBody
	public LikeplanVO insert(LikeplanVO vo, HttpSession session) {
		vo.setMembernum((String)session.getAttribute("membernum"));
		System.out.println("파라미터 값 : " + vo);		
		if(vo.getLikeplannum() == null || vo.getLikeplannum().equals("")) {
			likeplanService.insert(vo);
		} else {
			likeplanService.delete(vo);
			vo.setLikeplannum("");
		}		
		return vo;
	}	
	
}
