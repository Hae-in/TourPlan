package com.yedam.tourplan.report.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.report.service.ReportSearchVO;
import com.yedam.tourplan.report.service.ReportService;
import com.yedam.tourplan.report.service.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDAO reportDAO;

	@Override
	public List<ReportVO> selectAll(ReportSearchVO vo) {
		return reportDAO.selectAll(null);
	}

	@Override
	public boolean insert(ReportVO vo) {
		return reportDAO.insert(vo);
	}

	@Override
	public boolean update(ReportVO vo) {
		return reportDAO.update(vo);
	}

	@Override
	public boolean delete(ReportVO vo) {
		return reportDAO.delete(vo);
	}
}
