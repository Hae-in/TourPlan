package com.yedam.tourplan.likeplan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.likeplan.service.LikeplanService;
import com.yedam.tourplan.likeplan.service.LikeplanVO;

@Service
public class LikeplanServiceImpl implements LikeplanService {
	
	@Autowired
	LikeplanDAO likeplanDAO;

	@Override
	public LikeplanVO select(LikeplanVO vo) {
		return likeplanDAO.select(vo);
	}

	@Override
	public List<LikeplanVO> selectAll(LikeplanVO vo) {
		return likeplanDAO.selectAll(vo);
	}

	@Override
	public int insert(LikeplanVO vo) {
		return likeplanDAO.insert(vo);
	}

	@Override
	public int delete(LikeplanVO vo) {
		return likeplanDAO.delete(vo);
	}



}
