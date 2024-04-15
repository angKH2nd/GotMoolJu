package com.kh.got.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.got.admin.model.service.AdminMemberService;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;
import com.kh.got.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminMemberService adminMService;
	
	// 메인 페이지
	@RequestMapping("main.ad")
    public ModelAndView openHome(ModelAndView mv) {
		// 회원 5명 정도 조회용
		ArrayList<Member> list = adminMService.selectMemberMiniList();
		
        mv.addObject("list", list)
		  .setViewName("admin/adminMain");

        return mv;
    }

	
	// 회원 정보 조회 페이지로 이동
	@RequestMapping("memberList.ad")
    public ModelAndView openMemberList(@RequestParam (value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = adminMService.selectMemberCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5/*pageLimit*/, 10/*boardLimit*/);

		ArrayList<Member> list = adminMService.selectMemberList(pi);
		
//		System.out.println(listCount);
//		System.out.println(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("admin/member/adminMember");
		// 메소드 체이닝
		return mv;
		
    }
	
	// 회원 상세 정보 조회 페이지로 이동
	@RequestMapping("memberDetail.ad")
	public String openMemberDetail() {
		return "admin/member/adminMemberDetail";
	}

	
	// 실험용
	@RequestMapping("typography")
    public String openHomeq() {
        return "admin/common/typography";
    }
	
}
