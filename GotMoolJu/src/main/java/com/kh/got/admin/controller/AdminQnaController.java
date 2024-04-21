package com.kh.got.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.admin.model.service.AdminMemberService;
import com.kh.got.admin.model.service.AdminQnaService;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;
import com.kh.got.member.model.vo.Member;
import com.kh.got.qna.model.vo.Qna;

@Controller
public class AdminQnaController {

	@Autowired
	private AdminQnaService adminQService;
	
	// qna 리스트
	@RequestMapping("qnaList.ad")
	public ModelAndView openAdminQnaList(@RequestParam (value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv){
//		System.out.println("db전");
		int listCount = adminQService.selectQnaListCount(); // qna 개수
//		System.out.println("db후 " + listCount);
		PageInfo adminPi = Pagination.getPageInfo(listCount, currentPage, 5/*pageLimit*/, 10/*boardLimit*/);

		ArrayList<Qna> admQnaList = adminQService.selectQnaList(adminPi);
//		System.out.println(admQnaList); - 나옴
		
		mv.addObject("adminPi", adminPi)
		  .addObject("admQnaList", admQnaList)
		  .setViewName("admin/qna/adminQnA");

      return mv;
		
		
	}
	
	
	
}
