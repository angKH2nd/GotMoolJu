package com.kh.got.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.admin.model.service.AdminAnnouncementService;
import com.kh.got.admin.model.service.AdminMemberService;
import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;
import com.kh.got.member.model.vo.Member;

@Controller
public class AdminAnnouncementController {

	@Autowired
	private AdminAnnouncementService adminAService;
	
	// 공지사항 전체 리스트
	@RequestMapping("announcementList.ad")
    public ModelAndView openAnnouncementList(@RequestParam (value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = adminAService.selectAnnouncementCount(); // 공지사항 총 개수
		
		PageInfo adminPi = Pagination.getPageInfo(listCount, currentPage, 5/*pageLimit*/, 10/*boardLimit*/);

		ArrayList<Announcement> admAnnouncementList = adminAService.selectAnnouncementList(adminPi); // 공지사항 전체 리스트
//		System.out.println(listCount); - good
//		System.out.println(pi);
//		System.out.println(list); - good
		mv.addObject("adminPi", adminPi)
		  .addObject("admAnnouncementList", admAnnouncementList)
		  .setViewName("admin/announcement/adminAnnouncement");
		// 메소드 체이닝
		return mv;
        
    }
	
	// 공지사항 디테일
	@RequestMapping("announcementDetail.ad")
    public String openAnnounDetail(@RequestParam("ano") int ano, Model model) {
		Announcement adminA = adminAService.selectAnnouncementDetail(ano);
		
		model.addAttribute("adminA", adminA);
        return "admin/announcement/adminAnnouncementDetail";
    }
	
	// 예비 공지사항 등록
	@RequestMapping("announcementEnroll.ad")
    public String openAnnounEnroll() {
		
        return "admin/announcement/adminAnnouncementEnroll";
    }
	
	
}
