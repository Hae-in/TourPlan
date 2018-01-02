package com.yedam.tourplan.likeplace.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.tourplan.common.Paging;
import com.yedam.tourplan.likeplace.service.LikeplaceSearchVO;
import com.yedam.tourplan.likeplace.service.LikeplaceService;
import com.yedam.tourplan.place.service.PlaceSearchVO;
import com.yedam.tourplan.place.service.PlaceService;

@Controller
@RequestMapping("likeplace/")
public class LikeplaceController {
	@Autowired LikeplaceService likeplaceService;
	@Autowired PlaceService placeService;
	
	//마이페이지 > 내가 등록한 명소
	@RequestMapping("selectAllMypage.do")
	public String selectAllMypage(LikeplaceSearchVO vo, Model model, HttpSession session, Paging paging) {
		//전체 건수
		int total = likeplaceService.selectListTotCnt(vo);
		paging.setTotalRecord(total);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());	
		vo.setMembernum((String)session.getAttribute("membernum"));
		model.addAttribute("likeplaceList", likeplaceService.selectAll(vo));
		model.addAttribute("paging", paging);
		return "member/myPage/myLikeplace";
	}	
}
