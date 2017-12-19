package com.yedam.tourplan.report.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.plantable.service.PlanTableVO;
import com.yedam.tourplan.post.service.PostVO;
import com.yedam.tourplan.report.service.ReportSearchVO;
import com.yedam.tourplan.report.service.ReportVO;

@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// selectAll
	public List<ReportVO> selectAll(ReportSearchVO vo) {
		return mybatis.selectList("ReportDAO.selectAll", vo);
	}

	// insert
	public boolean insert(ReportVO vo) {
		int r = mybatis.insert("ReportDAO.insert", vo);
		if (r>0)
			return true;
		else
			return false;
	}
	
	// update
	public boolean update(ReportVO vo) {
		int r = mybatis.update("ReportDAO.update", vo);
		if (r>0)
			return true;
		else
			return false;
	}
	
	// delete
	public boolean delete(ReportVO vo) {
		int r = mybatis.delete("ReportDAO.delete", vo);
		if (r>0)
			return true;
		else
			return false;
	}
}
