package com.kh.got.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.admin.model.service.AdminApartmentService;
import com.kh.got.common.model.service.MapServiceImpl;
import com.kh.got.common.model.vo.MapVO;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;

@Controller
public class AdminApartmentController {
	
	@Autowired
	private AdminApartmentService adminAptService;
	
	@Autowired
	private MapServiceImpl mService;
	
	@RequestMapping("aptList.ad")
	public ModelAndView selectAdminAptList(@RequestParam (value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {	
		int listCount = mService.selectAptCount(); // 전체 아파트 개수
		PageInfo adminPi = Pagination.getPageInfo(listCount, currentPage, 5/*pageLimit*/, 10/*boardLimit*/);
		
		ArrayList<MapVO> admAptList = adminAptService.selectAdminAptList(adminPi);
		
		mv.addObject("adminAptPi", adminPi)
		  .addObject("admAptList", admAptList)
		  .setViewName("admin/apartment/adminApartment");
		return mv;
	}
	
	@RequestMapping("deleteApt.ad")
	public String deleteAdminApt(int aptNo, HttpSession session, Model model) {
		int result = adminAptService.deleteAdminApt(aptNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 아파트가 삭제되었습니다!");
			return "redirect:aptList.ad";
		}else {
			model.addAttribute("errorMsg", "아파트 삭제 실패!");
			return "common/errorPage";
		}
	}
	
	// 아파트 디테일
	@RequestMapping("aptDetail.ad")
	public ModelAndView detailAdminApt(@RequestParam("aptNo") int aptNo, HttpSession session, ModelAndView mv) {
		
//		System.out.println(aptNo);
		MapVO admApt = adminAptService.detailAdminApt(aptNo);
		
//		System.out.println(admApt);
		mv.addObject("admApt", admApt)
		  .setViewName("admin/apartment/adminApartDetail");
		
		
		return mv;
		
	}
	
	
	
	
}
