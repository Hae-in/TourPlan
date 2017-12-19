package com.yedam.tourplan.post.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.tourplan.plantable.service.PlanTableVO;
import com.yedam.tourplan.post.service.PostService;

@Controller
@SessionAttributes("post")
@RequestMapping("/post/")
public class PostController {
	
	@Autowired
	PostService postService;
	
	@RequestMapping("select.do")
	public String View(PlanTableVO vo, Model model) {
		model.addAttribute("ptList", postService.select(vo));
		return "post/postView";
	}
}
