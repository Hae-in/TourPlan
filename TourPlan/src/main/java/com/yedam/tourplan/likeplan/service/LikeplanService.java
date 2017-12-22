package com.yedam.tourplan.likeplan.service;

import java.util.List;

public interface LikeplanService {
	public LikeplanVO select(LikeplanVO vo);
	public List<LikeplanVO> selectAll(LikeplanVO vo);
	public int insert(LikeplanVO vo);
	public int delete(LikeplanVO vo);	
}
