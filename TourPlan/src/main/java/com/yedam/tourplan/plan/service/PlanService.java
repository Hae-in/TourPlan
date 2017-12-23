package com.yedam.tourplan.plan.service;

import java.util.List;
import java.util.Map;

public interface PlanService {
	//단건조회
	public PlanVO select(PlanSearchVO vo);
	//전체조회
	public List<PlanVO> selectAll(PlanSearchVO vo);
	//등록
	public int insert(PlanVO vo);
	//수정
	public int update(PlanVO vo);
	//삭제
	public int delete(PlanVO vo);
	
	
	//임시
	public PlanVO selectSeq(PlanVO vo);
}
