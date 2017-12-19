package com.yedam.tourplan.category.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.tourplan.category.service.CategoryService;
import com.yedam.tourplan.category.service.CategoryVO;

@Controller
@RequestMapping("categoryAjax")
public class CategoryAjaxController {

	@Autowired
	CategoryService categoryService;
	
	//목록
	@RequestMapping("selectAll.do")
	@ResponseBody
	public List<CategoryVO> selectAll() {
		return categoryService.selectAll(null);
	}
}
