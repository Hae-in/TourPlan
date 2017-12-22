package com.yedam.tourplan.plantable.service;

import java.util.List;

public interface PlanTableService {
	public boolean insert(PlanTableSearchVO vo);
	public boolean delete(PlanTableSearchVO vo);
	public List<PlanTableVO> selectPT(PlanTableVO vo);
}
