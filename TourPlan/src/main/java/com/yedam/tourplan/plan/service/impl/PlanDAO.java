package com.yedam.tourplan.plan.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanVO;

@Repository
public class PlanDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//단건조회
	public PlanVO select(PlanVO vo) {
		return mybatis.selectOne("PlanDAO.select", vo);
	}
	
	//전체조회
	public List<PlanVO> selectAll(PlanSearchVO vo) {
		return mybatis.selectList("PlanDAO.selectAll", vo);
	}
	
	//등록
	public int insert(PlanVO vo) {
		return mybatis.insert("PlanDAO.insert", vo);
	}
	
	//수정
	public int update(PlanVO vo) {
		return mybatis.update("PlanDAO.update", vo);
	}
	
	//삭제
	public int delete(PlanVO vo) {
		return mybatis.delete("PlanDAO.delete", vo);
	}
}
