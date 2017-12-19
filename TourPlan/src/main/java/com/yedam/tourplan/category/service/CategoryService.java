package com.yedam.tourplan.category.service;

import java.util.List;

public interface CategoryService {
	public CategoryVO select(CategoryVO vo);
	public List<CategoryVO> selectAll(CategoryVO vo);
}
