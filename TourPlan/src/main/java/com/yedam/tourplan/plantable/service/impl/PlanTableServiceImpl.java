package com.yedam.tourplan.plantable.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.plantable.service.PlanTableSearchVO;
import com.yedam.tourplan.plantable.service.PlanTableService;
import com.yedam.tourplan.plantable.service.PlanTableVO;

@Service
public class PlanTableServiceImpl implements PlanTableService {

	@Autowired
	PlanTableDAO planTableDAO;
	
	@Override
	public boolean insert(PlanTableVO vo) {
		int r = planTableDAO.insert(vo);
		if(r>0)
			return true;
		else
			return false;
	}
	
	@Override
	public boolean delete(PlanTableVO vo) {
		int r = planTableDAO.delete(vo);
		if(r>0)
			return true;
		else
			return false;
	}

	@Override
	public List<PlanTableVO> selectPT(PlanTableVO vo) {
		return planTableDAO.selectPT(vo);
	}

	@Override
	public boolean update(PlanTableVO vo) {
		int r = planTableDAO.update(vo);
		if(r>0)
			return true;
		else
			return false;
	}
	
	
	
}
