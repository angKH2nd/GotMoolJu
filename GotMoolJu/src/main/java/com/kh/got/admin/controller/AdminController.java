package com.kh.got.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.got.admin.model.service.AdminAnnouncementService;
import com.kh.got.admin.model.service.AdminEtcService;
import com.kh.got.admin.model.service.AdminMemberService;
import com.kh.got.admin.model.service.AdminQnaService;
import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.FileConverter;
import com.kh.got.common.template.Pagination;
import com.kh.got.etc.model.vo.Improvement;
import com.kh.got.member.model.vo.Member;
import com.kh.got.qna.model.vo.Qna;

@Controller
public class AdminController {
	
	@Autowired
	private AdminMemberService adminMService;
	
	@Autowired
	private AdminAnnouncementService adminAService;
	
	@Autowired
	private AdminQnaService adminQService;
	
	@Autowired
	private AdminEtcService adminEService; // Improvement
	
	// 메인 페이지
	@RequestMapping("main.ad")
    public ModelAndView openHome(ModelAndView mv) {
		// 회원 5명 정도 조회용
		ArrayList<Member> admMemberList = adminMService.adminSelectMemberMiniList();
		// 공지글 5개 정도 조회용
		ArrayList<Announcement> admAnnouncementList = adminAService.adminSelectAnnouncementMiniList();
		// qna 3개 정도 조회용
		ArrayList<Qna> admQnaList = adminQService.adminSelectQnaMiniList();
		// 개선사항 3개 정도 조회용
		ArrayList<Improvement> admImprovementList = adminEService.adminImprovementMiniList();
		
		
        mv.addObject("admMemberList", admMemberList)
          .addObject("admAnnouncementList", admAnnouncementList)
          .addObject("admQnaList", admQnaList)
          .addObject("admImprovementList", admImprovementList)
		  .setViewName("admin/adminMain");

        return mv;
    }

	
	// 회원 정보 조회 페이지로 이동
	@RequestMapping("memberList.ad")
    public ModelAndView openMemberList(@RequestParam (value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {
		
		int listCount = adminMService.adminSelectMemberCount();
		
		PageInfo adminPi = Pagination.getPageInfo(listCount, currentPage, 5/*pageLimit*/, 10/*boardLimit*/);

		ArrayList<Member> admMemberList = adminMService.adminSelectMemberList(adminPi);
		
//		System.out.println(listCount);
//		System.out.println(list);
		
		mv.addObject("adminPi", adminPi)
		  .addObject("admMemberList", admMemberList)
		  .setViewName("admin/member/adminMember");
		// 메소드 체이닝
		return mv;
		
    }
	
	// 회원 상세 정보 조회 페이지, detailForm
	@RequestMapping("memberDetail.ad")
	public String openMemberDetail(@RequestParam("mno") int mno, Model model) {
		Member adminM = adminMService.adminSelectMemberDetail(mno);
		
		
		model.addAttribute("adminM", adminM);
		return "admin/member/adminMemberDetail";
		
	}
	
	// 회원 디테일 폼 status 변경
	@RequestMapping("memberDetailUpdate.ad")
	public String updateMemberDetail(@RequestParam("mno") int mno,@RequestParam("mStatus") String mStatus, Model model, HttpSession session) {
//		System.out.println(mStatus); // 여기가 Y만 나오는데, 선택한대로 넘어오게 바꾸기
		Member adminM = new Member();
		adminM.setUserNo(mno);
		adminM.setUserStatus(mStatus);
//		System.out.println(mStatus);
		int result = adminMService.adminUpdateMemberDetail(adminM);
		
//		System.out.println(adminM.getUserStatus());
//		System.out.println(result); // 1 => 성공
		
		if (result > 0) { 
			// alert 띄워줄 문구 담기
			session.setAttribute("alertMsg", "수정되었습니다.");
			
			// 디테일폼 url 재요청
			return "redirect:memberDetail.ad?mno=" + mno;
		} else { // 수정 실패 => 에러문구 담아서 에러페이지 포워딩
			model.addAttribute("errorMsg", "수정이 실패하였습니다.");
			return "common/errorPage";
		}
	
	
	}

	
	
}
