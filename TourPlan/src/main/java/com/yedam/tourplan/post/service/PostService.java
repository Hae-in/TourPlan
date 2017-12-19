package com.yedam.tourplan.post.service;

import java.util.List;

import com.yedam.tourplan.plantable.service.PlanTableVO;

public interface PostService {
	//post 일정 전체조회
	public List<PostVO> selectPost(PostVO vo);
	
	public List<PlanTableVO> select(PlanTableVO vo);
	
	public boolean insert(PostVO vo);
}
