package com.yedam.tourplan.plantable.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.plantable.service.PlanTableSearchVO;
import com.yedam.tourplan.plantable.service.PlanTableVO;

@Repository
public class PlanTableDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(PlanTableVO vo) {
		return mybatis.insert("PlanTableDAO.insert", vo);
	}
	
	public int delete(PlanTableVO vo) {
		return mybatis.delete("PlanTableDAO.delete", vo);
	}
	
	public int update(PlanTableVO vo) {
		return mybatis.update("PlanTableDAO.update", vo);
	}
	
	public List<PlanTableVO> selectPT(PlanTableVO vo) {
		return mybatis.selectList("PlanTableDAO.selectPT", vo);
	}
}
