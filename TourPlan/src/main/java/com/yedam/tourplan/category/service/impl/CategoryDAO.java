package com.yedam.tourplan.category.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.tourplan.category.service.CategoryVO;
import com.yedam.tourplan.place.service.PlaceVO;

@Repository
public class CategoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(CategoryVO place) {
		return mybatis.insert("CategoryDAO.insert", place);
	}
	
	public int update(CategoryVO place) {
		return mybatis.update("CategoryDAO.update", place);
	}
	
	public int delete(CategoryVO place) {
		return mybatis.delete("CategoryDAO.delete", place);
	}		
	
	public CategoryVO select(CategoryVO vo) {
		return mybatis.selectOne("CategoryDAO.select", vo);
	}	

	public List<CategoryVO> selectAll(CategoryVO vo) {
		return mybatis.selectList("CategoryDAO.selectAll", vo);
	}	

}
