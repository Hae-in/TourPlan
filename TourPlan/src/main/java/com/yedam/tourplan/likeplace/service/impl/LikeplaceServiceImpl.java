package com.yedam.tourplan.likeplace.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.likeplace.service.LikeplaceSearchVO;
import com.yedam.tourplan.likeplace.service.LikeplaceService;
import com.yedam.tourplan.likeplace.service.LikeplaceVO;

@Service
public class LikeplaceServiceImpl implements LikeplaceService {
	
	@Autowired
	LikeplaceDAO likeplaceDAO;

	@Override
	public LikeplaceVO select(LikeplaceVO vo) {
		return likeplaceDAO.select(vo);
	}

	@Override
	public List<LikeplaceVO> selectAll(LikeplaceSearchVO vo) {
		return likeplaceDAO.selectAll(vo);
	}

	@Override
	public int insert(LikeplaceVO vo) {
		return likeplaceDAO.insert(vo);
	}

	@Override
	public int delete(LikeplaceVO vo) {
		return likeplaceDAO.delete(vo);
	}

	@Override
	public int selectListTotCnt(LikeplaceSearchVO vo) {
		return likeplaceDAO.selectListTotCnt(vo);
	}



}
