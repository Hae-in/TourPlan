package com.yedam.tourplan.helpdesk.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.helpdesk.service.HelpdeskSearchVO;
import com.yedam.tourplan.helpdesk.service.HelpdeskService;
import com.yedam.tourplan.helpdesk.service.HelpdeskVO;

@Service
public class HelpdeskServiceImpl implements HelpdeskService {
	
	@Autowired
	HelpdeskDAO helpdeskDAO;

	@Override
	public boolean insert(HelpdeskVO vo) {
		int r = helpdeskDAO.insert(vo);
		if(r>0) return true;
		else return false;		
	}

	@Override
	public int update(HelpdeskVO vo) {
		return helpdeskDAO.update(vo);
	}

	@Override
	public int delete(HelpdeskVO vo) {
		return helpdeskDAO.delete(vo);
	}

	@Override
	public HelpdeskVO select(HelpdeskVO vo) {
		return helpdeskDAO.select(vo);
	}

	@Override
	public List<HelpdeskVO> selectAll(HelpdeskSearchVO vo) {
		return helpdeskDAO.selectAll(vo);
	}

}
