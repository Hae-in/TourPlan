package com.yedam.tourplan.category.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.category.service.CategoryVO;

@Repository
public class CategoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CategoryVO select(CategoryVO vo) {
		return mybatis.selectOne("CategoryDAO.select", vo);
	}	

	public List<CategoryVO> selectAll(CategoryVO vo) {
		return mybatis.selectList("CategoryDAO.selectAll", vo);
	}	

}
