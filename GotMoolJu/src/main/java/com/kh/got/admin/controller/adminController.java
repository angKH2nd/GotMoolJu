package com.kh.got.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	@RequestMapping("/main.ad")
    public String openHome() {
        return "admin/adminMain";
    }
	
	@RequestMapping("/memberList.ad")
    public String openMember() {
        return "admin/member/adminMember";
    }

}
