package com.kh.got.home.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.announcement.model.service.AnnouncementService;
import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.service.MapServiceImpl;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;

@Controller
public class HomeController {

	@Autowired
	private AnnouncementService aService;
	
	@Autowired
	private MapServiceImpl mService;
	
	@RequestMapping("/home.got")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue =  "1") int currentPage, ModelAndView mv) {
		// ----------------- apt 관련 -----------------
		int aptCount = mService.selectAptCount();
		
		NumberFormat numberFormat = NumberFormat.getNumberInstance();

		Locale locale = new Locale("en", "US");
		numberFormat = NumberFormat.getNumberInstance(locale);

		String formattedAptCount = numberFormat.format(aptCount);
		
		// ----------------- apt 관련 -----------------
		
		// ----------------- announcement 관련 -----------------
		
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 10);
		ArrayList<Announcement> list = aService.selectList(pi);
		
		// ----------------- announcement 관련 -----------------
		
		mv.addObject("announcementPi", pi)
			.addObject("announcementList", list)
			.addObject("aptCount", formattedAptCount)
			.setViewName("home/home");	
       
		return mv;
    }
	
}
