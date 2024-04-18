package com.kh.got.announcement.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.got.announcement.model.service.AnnouncementServiceImpl;
import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;

@Controller
public class AnnouncementController {

@Autowired
private AnnouncementServiceImpl aService;
		

@ResponseBody
@RequestMapping(value = "list.an", produces = "application/json; charset=utf-8")
public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage) {
    int listCount = aService.selectListCount(); // Total announcements
    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 3); // 3 announcements per page
    ArrayList<Announcement> list = aService.selectList(pi);

    Map<String, Object> resultMap = new HashMap<>();
    resultMap.put("anList", list);
    resultMap.put("anPageInfo", pi);
    
    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

    return gson.toJson(resultMap);
}

@RequestMapping("enrollForm.an")
public String enrollForm() {
	return "helpCenter/announcement/announcementEnrollForm";
}

@RequestMapping("insert.an")
public String insertAnnouncement(Announcement a, HttpSession session, Model model) {
	int result = aService.insertAnnouncement(a);
	
	if(result>0) {
		session.setAttribute("alertMsg", "게시글 등록되었습니다");
		return "redirect:list.an";
	}else {
		model.addAttribute("errorMsg", "게시글 등록 실패");
		return "common/errorPage";
	}
}
	@RequestMapping("detail.an")
	public String selectAnnouncement(int ano, Model model) {
		int aCount = aService.increaseCount(ano);
		
		if(aCount > 0) {
			Announcement a = aService.selectAnnouncement(ano);
			model.addAttribute("a", a);
			return "helpCenter.announcement/announcementDetailView;";
		}else {
			model.addAttribute("errorPage", "대당 게시글 없습니다");
		}
		return "common/errorPage";
	}

}
