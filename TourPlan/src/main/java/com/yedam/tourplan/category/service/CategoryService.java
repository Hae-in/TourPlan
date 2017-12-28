package com.yedam.tourplan.category.service;

import java.util.List;

public interface CategoryService {
	public boolean insert(CategoryVO vo);
	public int update(CategoryVO vo);
	public int delete(CategoryVO vo);	
	public CategoryVO select(CategoryVO vo);
	public List<CategoryVO> selectAll(CategoryVO vo);
}
