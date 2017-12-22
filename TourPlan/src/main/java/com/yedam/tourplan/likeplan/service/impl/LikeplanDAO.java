package com.yedam.tourplan.likeplan.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.likeplan.service.LikeplanVO;

@Repository
public class LikeplanDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public LikeplanVO select(LikeplanVO vo) {
		return mybatis.selectOne("LikeplanDAO.select", vo);
	}
	
	public List<LikeplanVO> selectAll(LikeplanVO vo) {
		return mybatis.selectList("LikeplanDAO.selectAll", vo);
	}
	
	public int insert(LikeplanVO vo) {
		return mybatis.insert("LikeplanDAO.insert", vo);
	}
	
	public int delete(LikeplanVO vo) {
		return mybatis.delete("LikeplanDAO.delete", vo);
	}

}
