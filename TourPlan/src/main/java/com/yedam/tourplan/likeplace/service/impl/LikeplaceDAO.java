package com.yedam.tourplan.likeplace.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.likeplace.service.LikeplaceSearchVO;
import com.yedam.tourplan.likeplace.service.LikeplaceVO;

@Repository
public class LikeplaceDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public LikeplaceVO select(LikeplaceVO vo) {
		return mybatis.selectOne("LikeplaceDAO.select", vo);
	}
	
	public List<LikeplaceVO> selectAll(LikeplaceSearchVO vo) {
		return mybatis.selectList("LikeplaceDAO.selectAll", vo);
	}
	
	public int insert(LikeplaceVO vo) {
		return mybatis.insert("LikeplaceDAO.insert", vo);
	}
	
	public int delete(LikeplaceVO vo) {
		return mybatis.delete("LikeplaceDAO.delete", vo);
	}
	
	public int selectListTotCnt(LikeplaceSearchVO vo) {
		return mybatis.selectOne("LikeplaceDAO.selectListTotCnt", vo);
	}

}
