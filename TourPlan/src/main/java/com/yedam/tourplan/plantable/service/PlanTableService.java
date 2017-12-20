package com.yedam.tourplan.plantable.service;

import java.util.List;

public interface PlanTableService {
	public boolean insert(PlanTableVO vo);
	public boolean delete(PlanTableVO vo);
	public List<PlanTableVO> selectPT(PlanTableVO vo);
}
