package com.yedam.tourplan.category.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.tourplan.category.service.CategoryService;
import com.yedam.tourplan.category.service.CategoryVO;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDAO categoryDAO;

	@Override
	public CategoryVO select(CategoryVO vo) {
		return categoryDAO.select(vo);
	}

	@Override
	public List<CategoryVO> selectAll(CategoryVO vo) {
		return categoryDAO.selectAll(vo);
	}	
	
}
