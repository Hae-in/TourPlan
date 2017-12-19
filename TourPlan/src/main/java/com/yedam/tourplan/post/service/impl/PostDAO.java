package com.yedam.tourplan.post.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.plantable.service.PlanTableVO;
import com.yedam.tourplan.post.service.PostVO;

@Repository
public class PostDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// Post 일정단위 전체조회
	public List<PostVO> selectPost(PostVO vo) {
		return mybatis.selectList("PostDAO.selectPost", vo);
	}

	// 일정조회
	public List<PlanTableVO> select(PlanTableVO vo) {
		return mybatis.selectList("PostDAO.select", vo);
	}

	// Post 등록
	public boolean insert(PostVO vo) {
		int r = mybatis.insert("PostDAO.insert", vo);
		if (r>0)
			return true;
		else
			return false;
	}
	
	// Post Content 수정
	public boolean update(PostVO vo) {
		int r = mybatis.update("PostDAO.update", vo);
		if (r>0)
			return true;
		else
			return false;
	}
	
	// Post 삭제
	public boolean delete(PostVO vo) {
		int r = mybatis.delete("PostDAO.delete", vo);
		if (r>0)
			return true;
		else
			return false;
	}
}
