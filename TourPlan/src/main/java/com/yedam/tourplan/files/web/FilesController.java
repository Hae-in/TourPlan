package com.yedam.tourplan.files.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.tourplan.files.service.FilesService;

@Controller
@RequestMapping("files")
public class FilesController {
	
	@Autowired
	FilesService filesService;
	
	//등록처리
	
	

}
