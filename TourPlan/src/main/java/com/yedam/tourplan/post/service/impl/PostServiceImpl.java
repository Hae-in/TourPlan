package com.yedam.tourplan.post.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.plantable.service.PlanTableVO;
import com.yedam.tourplan.post.service.PostService;
import com.yedam.tourplan.post.service.PostVO;

@Service
public class PostServiceImpl implements PostService {
	
	@Autowired
	PostDAO postDAO;

	@Override
	public List<PostVO> selectPost(PostVO vo) {
		return postDAO.selectPost(vo);
	}
	
	@Override
	public List<PlanTableVO> select(PlanTableVO vo) {
		return postDAO.select(vo);
	}

	@Override
	public boolean insert(PostVO vo) {
		return postDAO.insert(vo);
	}
}
