package com.yedam.tourplan.plan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.plan.service.SharePlanVO;

@Service
public class PlanServiceImpl implements PlanService {
	
	@Autowired
	PlanDAO planDAO;

	@Override
	public PlanVO select(PlanSearchVO vo) {
		return planDAO.select(vo);
	}
	
	@Override
	public List<PlanVO> selectAll(PlanSearchVO vo) {
		return planDAO.selectAll(vo);
	}

	@Override
	public int insert(PlanVO vo) {
		return planDAO.insert(vo);
	}
	
	@Override
	public int update(PlanVO vo) {
		return planDAO.update(vo);
	}

	@Override
	public int delete(PlanVO vo) {
		return planDAO.delete(vo);
	}

	@Override
	public PlanVO selectSeq(PlanVO vo) {
		return planDAO.selectSeq(vo);
	}

	@Override
	public int insertShare(Map<String, String> map) {
		return planDAO.insertShare(map);
	}

	@Override
	public List<SharePlanVO> selectShare(SharePlanVO vo) {
		return planDAO.selectShare(vo);
	}

	@Override
	public int selectListTotCnt(PlanSearchVO vo) {
		return planDAO.selectListTotCnt(vo);
	}
	
	//임시
	
}
