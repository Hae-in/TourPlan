package com.yedam.tourplan.home.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.tourplan.place.service.PlaceSearchVO;
import com.yedam.tourplan.place.service.PlaceService;
import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired PlanService planService;
	@Autowired PlaceService placeService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "main/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//place 인기순 4개
		PlaceSearchVO place = new PlaceSearchVO();
		place.setFirst(1);
		place.setLast(4);
		place.setSort("likecnt");
		model.addAttribute("placeList", placeService.selectAll(place));
		
		//plan Search
		PlanSearchVO p_vo = new PlanSearchVO();
		p_vo.setFirst(1);
		p_vo.setLast(4);
		p_vo.setPlan_sort("likecount");
		model.addAttribute("planList",  planService.selectAll(p_vo));
		
		return "main/main";
	}
	
}
