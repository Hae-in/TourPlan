package com.yedam.tourplan.post.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yedam.tourplan.plantable.service.PlanTableVO;
import com.yedam.tourplan.post.service.PostService;
import com.yedam.tourplan.post.service.PostVO;

@Controller
@SessionAttributes("post")
@RequestMapping("/postAjax/")
public class PostAjaxController {
	
	@Autowired
	PostService postService;
	
	@RequestMapping("selectPost")
	@ResponseBody
	public List<PostVO> postView(PostVO vo) {
		return postService.selectPost(vo);
	}
	
	@RequestMapping("insert")
	@ResponseBody
	public boolean insert(PostVO vo) {
		return postService.insert(vo);
	}
}
