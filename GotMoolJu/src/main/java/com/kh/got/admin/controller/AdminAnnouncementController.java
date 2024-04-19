package com.kh.got.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
		Announcement adminA = adminAService.adminAnnouncementselectDetail(ano); // 공지사항 디테일
//		System.out.println(ano + " db전");
		int result = adminAService.adminAnnouncementIncreaseCount(ano); // 공지사항 조회수
//		System.out.println("db 후 " + result);
		
		if(result > 0) {
		
		model.addAttribute("adminA", adminA);
        return "admin/announcement/adminAnnouncementDetail";
        
		}else {
			model.addAttribute("errorMsg", "조회 실패");
			return "common/errorPage";
		}
		
    }

	// 공지사항 삭제
	@RequestMapping("announcementDelete.ad")
	public String openAnnounDelete(int ano, HttpSession session, Model model) {

//		System.out.println( ano + "db전");		
		int result = adminAService.adminAnnouncementDelete(ano);
//		System.out.println("db후" + result);
		
		if(result > 0) {
			return "redirect:announcementList.ad";

		} else {
			model.addAttribute("errorMsg", "공지사항 삭제가 실패하였습니다.");
			return "common/errorPage";
		}
	
	}
	// 공지사항 복구
	@RequestMapping("announcementRevive.ad")
	public String openAnnounRevive(int ano, HttpSession session, Model model) {
//		System.out.println( ano + "db전");		
		int result = adminAService.adminAnnouncementRevive(ano);
//		System.out.println("db후" + result);
		
		if(result > 0) {
			return "redirect:announcementList.ad";

		} else {
			model.addAttribute("errorMsg", "공지사항 복구가 실패하였습니다.");
			return "common/errorPage";
		}
	
	}
		
	// 공지사항 폼
	@RequestMapping("announcementEnrollForm.ad")
    public String openAnnounEnrollForm() {

		return "admin/announcement/adminAnnouncementEnroll";
	}
	
	// 공지사항 등록
	@RequestMapping("announcementEnroll.ad")
    public String openAnnounEnroll(Announcement adminA, HttpSession session, Model model) {
		int result = adminAService.adminAnnouncementEnroll(adminA);
		
//			System.out.println(result);
			
			if(result > 0) { // 성공 => 게시글 리스트 페이지 (list.bo url 재요청)
				session.setAttribute("alertMsg", "공지사항 등록 성공");
				return "redirect:announcementList.ad";
				
			}else { // 실패 => 에러페이지 포워딩
				model.addAttribute("errorMsg", "공지사항 등록 실패");
				return "common/errorPage";
			}
	}
	
	// 공지사항 수정 폼
	@RequestMapping("announcementUpdateForm.ad")
	public String openAnnounUpdateForm(int ano, Model model) {
		model.addAttribute("adminA", adminAService.adminAnnouncementselectDetail(ano));
		
		return "admin/announcement/adminAnnouncementUpdate";
	}
	
	// 공지사항 수정
	@RequestMapping("announcementUpdate.ad")
	public String openAnnounUpdate(Announcement adminA, HttpSession session, Model model) {
		int result = adminAService.adminAnnouncementupdate(adminA);
//		System.out.println("db후" + result); // 여기까진 오나 result가 아직 안 넘어옴
//		System.out.println(adminA.getAnnouncementNo());
//		System.out.println(adminA.getAnnouncementTitle());
//		System.out.println(adminA.getAnnouncementContent());
		
		if(result > 0) { // 수정 성공 => 상세페이지 url 재요청 => detail.bo
			session.setAttribute("alertMsg", "공지사항 수정이 완료되었습니다.");
			return "redirect:announcementDetail.ad?ano=" + adminA.getAnnouncementNo();
		}else { // 수정 실패 => 에러페이지
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			return "common/errorPage";
		}
		
		
		
	}
	
	
	
}
