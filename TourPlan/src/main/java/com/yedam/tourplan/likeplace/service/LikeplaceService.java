package com.yedam.tourplan.likeplace.service;

import java.util.List;

public interface LikeplaceService {
	public LikeplaceVO select(LikeplaceVO vo);
	public List<LikeplaceVO> selectAll(LikeplaceVO vo);
	public int insert(LikeplaceVO vo);
	public int delete(LikeplaceVO vo);	
}
