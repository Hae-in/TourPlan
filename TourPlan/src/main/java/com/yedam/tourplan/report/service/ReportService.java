package com.yedam.tourplan.report.service;

import java.util.List;

public interface ReportService {
	
	public List<ReportVO> selectAll(ReportSearchVO vo);
	
	public boolean insertPlace(ReportVO vo);
	
	public boolean insertPlan(ReportVO vo);
	
	public boolean update(ReportVO vo);

	public boolean delete(ReportVO vo);
}
