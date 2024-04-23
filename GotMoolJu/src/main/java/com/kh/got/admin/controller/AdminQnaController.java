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
	public String openAdminQnaDelete(int qno, HttpSession session, Model model) {
		int result = adminQService.adminDeleteQnaList(qno);
//		System.out.println("db후 " + result);
//		System.out.println(qno);
		
		if(result > 0) {
			return "redirect:qnaList.ad";

		} else {
			model.addAttribute("errorMsg", "qna 삭제가 실패하였습니다.");
			return "common/errorPage";
		}
	
	}
	
	// qna 답글 등록
	@RequestMapping("qnaAnswerEnroll.ad")
	public String openAdminQnaAnswerEnroll(@RequestParam("qno") int qno, String qnaAnswerContent, int qnaType, HttpSession session, Model model) {
//		System.out.println("db 전");
//		System.out.println("qno" + qno + ", qnaAnswerContent " + qnaAnswerContent + ", qnaType " + qnaType);
		
		int result = adminQService.adminEnrollQnaAnswer(qnaAnswerContent, qno, qnaType); // 답글 등록
//		System.out.println("db 후" + result);
		
		if(result > 0) {
			// 1받아오면 qna 답급 완료도 함께 수정되게 
			int result1 = adminQService.adminEnrollQnaAnswerQnaUpdate(qno); // qna 답글 등록 시 qna 답변 완료로 수정
			
			return "redirect:qnaList.ad";
		}else {
			model.addAttribute("errorMsg", "답글 등록이 실패하였습니다.");
			return "common/errorPage";
		}

	}
	
	// qna 답글 수정
	@RequestMapping("qnaAnswerUpdate.ad")
	public String openAdminQnaAnswerUpdate(@RequestParam("qno") int qno, String qnaAnswerContent, HttpSession session, Model model) {
		System.out.println("qno = " + qno + ", qnaAnswerContent = " + qnaAnswerContent);
		
		int result = adminQService.adminUpdateQnaAnswer(qnaAnswerContent, qno); // 답글 수정
		System.out.println(result);
		
		if(result > 0) {
			
			return "redirect:qnaList.ad";
		}else {
			model.addAttribute("errorMsg", "답글 수정이 실패하였습니다.");
			return "common/errorPage";
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
