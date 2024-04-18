package com.kh.got.home.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.announcement.model.service.AnnouncementService;
import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;

@Controller
public class HomeController {

	@Autowired
	private AnnouncementService aService;
	
	@RequestMapping("/home.got")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue =  "1") int currentPage, ModelAndView mv) {
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 10);
		ArrayList<Announcement> list = aService.selectList(pi);
		
		mv.addObject("announcementPi", pi)
			.addObject("announcementList", list)
			.setViewName("home/home");	
       
		return mv;
    }
	
}
