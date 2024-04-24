package com.kh.got.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.admin.model.service.AdminApartmentService;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;

@Controller
public class AdminApartmentController {
	
	@Autowired
	private AdminApartmentService adminAptService;
	
	@RequestMapping("aptList.ad")
	
	public String openAdminAptList() {		
		
		
		return "admin/apartment/adminApartment";
			
			
	}
	
}
