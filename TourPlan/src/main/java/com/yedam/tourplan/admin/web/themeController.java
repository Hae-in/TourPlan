package com.yedam.tourplan.admin.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/theme/")
public class themeController {

	@RequestMapping("theme1.do")
	public String goTheme1() {
		return "theme/theme1";
	}

	@RequestMapping("theme2.do")
	public String goTheme2() {
		return "theme/theme2";
	}
	
	@RequestMapping("theme3.do")
	public String goTheme3() {
		return "theme/theme3";
	}
	
	@RequestMapping("theme4.do")
	public String goTheme4() {
		return "theme/theme4";
	}
	
}
