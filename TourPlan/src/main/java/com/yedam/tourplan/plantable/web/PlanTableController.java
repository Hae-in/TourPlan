package com.yedam.tourplan.plantable.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yedam.tourplan.plan.service.PlanSearchVO;
import com.yedam.tourplan.plan.service.PlanService;
import com.yedam.tourplan.plan.service.PlanVO;
import com.yedam.tourplan.plantable.service.PlanTableVO;

@Controller
public class PlanTableController {
	
	@Autowired
	PlanService planService;
	
	private static final Logger logger = LoggerFactory.getLogger(PlanTableController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "planTable/planTableView.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		return "planTable/planTableView_dragdrop";
	}
	
	@RequestMapping("/plan/shareView.do")
	public String shareView(PlanTableVO vo, Model model, HttpSession session
			, HttpServletRequest request
			, HttpServletResponse response) {
		//makePlan : PlanVO || plan, shareView, post : PlanVO로 vo받음
		PlanSearchVO num_vo = new PlanSearchVO();
		num_vo.setPlannum(vo.getPlannum());
		PlanVO real_vo = new PlanVO();
		real_vo = planService.select(num_vo);
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");  
			String departure = real_vo.getDeparturedate(); 
			String arrival = real_vo.getArrivaldate(); 
			
			Date day1 = format.parse(departure);
			Date day2 = format.parse(arrival);
			long l_day = day2.getTime() - day1.getTime();
			int day = (int) (l_day/86400000) + 1;
			
			real_vo.setDay(Integer.toString(day));
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("vo", real_vo);
		
		return "plan/shareView";
	}
	
	@RequestMapping("planTable/makePlan.do")
	public String makePlan() {
		return "plan/makePlan";
	}
	
}
