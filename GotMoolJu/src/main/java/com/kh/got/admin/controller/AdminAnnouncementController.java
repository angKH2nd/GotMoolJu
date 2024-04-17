package com.kh.got.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.got.admin.model.service.AdminAnnouncementService;
import com.kh.got.admin.model.service.AdminMemberService;

@Controller
public class AdminAnnouncementController {

	@Autowired
	private AdminAnnouncementService adminAService;
	
	// 공지사항 폼
	@RequestMapping("announcementList.ad")
    public String openAnnoun() {
		
        return "admin/announcement/adminAnnouncement";
    }
	
	// 예비, 공지사항 디테일
	@RequestMapping("announcementDetailList.ad")
    public String openAnnounDetail() {
		
        return "admin/announcement/adminAnnouncementEnroll";
    }
	
	
}
