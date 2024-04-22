package com.kh.got.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.admin.model.service.AdminMemberService;
import com.kh.got.admin.model.service.AdminQnaService;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;
import com.kh.got.member.model.vo.Member;
import com.kh.got.qna.model.vo.Qna;
import com.kh.got.qna.model.vo.QnaAnswer;

@Controller
public class AdminQnaController {

	@Autowired
	private AdminQnaService adminQService;
	
	// qna 리스트
	@RequestMapping("qnaList.ad")
	public ModelAndView openAdminQnaList(@RequestParam (value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv){
		int listCount = adminQService.selectQnaListCount(); // qna 개수

		PageInfo adminPi = Pagination.getPageInfo(listCount, currentPage, 5/*pageLimit*/, 10/*boardLimit*/);
//		System.out.println(adminPi);
				
		ArrayList<Qna> admQnaList = adminQService.selectQnaList(adminPi); // qna 리스트
//		System.out.println(admQnaList); - 나옴
		
		ArrayList<QnaAnswer> admQnaAnswerList = adminQService.selectQnaAnswerList(); // qna 답변 리스트
//		System.out.println(admQnaList);
//		System.out.println(admQnaAnswerList);


		mv.addObject("adminPi", adminPi)
		  .addObject("admQnaList", admQnaList)
		  .addObject("admQnaAnswerList", admQnaAnswerList)
		  .setViewName("admin/qna/adminQnA");

      return mv;
		
	}
	
	// qna 사용자 글 삭제
	@RequestMapping("qnaListDelete.ad")
	public String openAdminQnaDelete(int adminQno, HttpSession session, Model model) {
		
		int result = adminQService.adminDeleteQnaList(adminQno);
		
		System.out.println("db후 " + result);
		System.out.println(adminQno); // 1로 받아와지는 중, 정상화되게 수정 필요
		
		if(result > 0) {
			return "redirect:qnaList.ad";

		} else {
			model.addAttribute("errorMsg", "qna 삭제가 실패하였습니다.");
			return "common/errorPage";
		}
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
