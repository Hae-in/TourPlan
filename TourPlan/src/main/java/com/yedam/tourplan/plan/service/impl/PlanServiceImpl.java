package com.yedam.tourplan.plan.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;

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
		//기간 sql에 넣기위해 자르는과정
		if(vo == null) {
		} else if (vo.getPeriod1() != null) {
			String day1 = vo.getPeriod1();
			day1 = day1.replace("-", ",");
			day1 = day1.replaceAll("day", "");
			day1 = day1.replaceAll(" ", "");
			String temp[] = day1.split(",");
			vo.setPeriod1(temp[0]);
			vo.setPeriod2(temp[1]);
		} else {}
		
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
	
	//임시
	
	
}
