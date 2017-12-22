package com.yedam.tourplan.helpdesk.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.helpdesk.service.HelpdeskSearchVO;
import com.yedam.tourplan.helpdesk.service.HelpdeskVO;

@Repository
public class HelpdeskDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(HelpdeskVO vo) {
		return mybatis.insert("HelpdeskDAO.insert", vo);
	}
	
	public int update(HelpdeskVO vo) {
		return mybatis.update("HelpdeskDAO.update", vo);
	}
	
	public int delete(HelpdeskVO vo) {
		return mybatis.delete("HelpdeskDAO.delete", vo);
	}
	
	public HelpdeskVO select(HelpdeskVO vo) {
		return mybatis.selectOne("HelpdeskDAO.select", vo);
	}	
	
	public List<HelpdeskVO> selectAll(HelpdeskSearchVO vo) {
		return mybatis.selectList("HelpdeskDAO.selectAll", vo);
	}
	
}
