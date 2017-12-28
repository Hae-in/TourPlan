package com.yedam.tourplan.category.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public List<CategoryVO> selectAll(@RequestParam(value="group", required=false) String group) {		
		CategoryVO category = new CategoryVO();
		category.setCategorygroup(group);		
		return categoryService.selectAll(category);
	}
	
	@RequestMapping("adminUpdate.do")
	@ResponseBody
	public void update(CategoryVO vo, HttpServletRequest request) {
		String oper = request.getParameter("oper");
		if(oper.equals("edit")) {
			categoryService.update(vo);			
		} else if(oper.equals("add")) {
			categoryService.insert(vo);
		} else if(oper.equals("del")) {
			vo.setCategorynum(request.getParameter("id"));
			categoryService.delete(vo);
		}		
	}
}
