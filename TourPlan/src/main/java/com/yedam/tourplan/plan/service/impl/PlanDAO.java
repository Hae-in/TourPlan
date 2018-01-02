package com.yedam.tourplan.plan.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.plan.service.SharePlanVO;

@Repository
public class PlanDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//단건조회
	public PlanVO select(PlanSearchVO vo) {
		return mybatis.selectOne("PlanDAO.select", vo);
	}
	
	//전체조회
	public List<PlanVO> selectAll(PlanSearchVO vo) {
		return mybatis.selectList("PlanDAO.selectAll", vo);
	}
	
	//등록
	public int insert(PlanVO vo) {
		int r = mybatis.insert("PlanDAO.insert", vo);
		if (r>0)
			System.out.println("dao : " + vo.getPlannum());
		else
			System.out.println("insret실패");
		return r;
	}
	
	//수정
	public int update(PlanVO vo) {
		return mybatis.update("PlanDAO.update", vo);
	}
	
	//삭제
	public int delete(PlanVO vo) {
		return mybatis.delete("PlanDAO.delete", vo);
	}
	
	//공유상태 insert
	public int insertShare(Map<String, String> map) {
		return mybatis.insert("PlanDAO.insertShare", map);
	}
	
	//공유상태 select
	public List<SharePlanVO> selectShare(SharePlanVO vo) {
		return mybatis.selectList("PlanDAO.selectShare", vo);
	}
	
	//공유상태 delete
	public int shareDelete(SharePlanVO vo) {
		return mybatis.delete("PlanDAO.shareDelete", vo);
	}
	
	/* 임시------------------------------------------------------*/
	public PlanVO selectSeq(PlanVO vo) {
		return mybatis.selectOne("PlanDAO.selectSeq", vo);
	}
	
	public int selectListTotCnt(PlanSearchVO vo) {
		return mybatis.selectOne("PlanDAO.selectListTotCnt", vo);
	}
}
