package com.kh.got.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.admin.model.service.AdminEtcService;
import com.kh.got.common.model.vo.MapVO;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;

@Controller
public class AdminEtcController {
	
	@Autowired
	private AdminEtcService adminEService;
	
//	@RequestMapping
	@RequestMapping("impList.ad")
	public ModelAndView selectAdminImpList(@RequestParam (value = "cpage", defaultValue = "1") int currentPage, ModelAndView mv) {	
		int listCount = adminEService.selectImpCount(); // 전체 개선의견 개수
		PageInfo adminPi = Pagination.getPageInfo(listCount, currentPage, 5/*pageLimit*/, 10/*boardLimit*/);
		
		ArrayList<MapVO> admImpList = adminEService.selectAdminImpList(adminPi);
		
		mv.addObject("adminImpPi", adminPi)
		  .addObject("admImpList", admImpList)
		  .setViewName("admin/etc/adminImprovement");
		return mv;
	}
	
	@RequestMapping("deleteImp.ad")
	public String deleteAdminImp(int impNo, HttpSession session, Model model) {
		int result = adminEService.deleteAdminImp(impNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 개선의견이 삭제되었습니다!");
			return "redirect:impList.ad";
		}else {
			model.addAttribute("errorMsg", "개선의견 삭제 실패!");
			return "common/errorPage";
		}
	}
	

}
