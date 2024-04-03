package com.kh.got.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.got.member.model.service.MemberService;
import com.kh.got.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;

	@RequestMapping("login.me")
	public String loginMember(Member m, Model model, HttpSession session) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) {
			model.addAttribute("errorMsg", "로그인 실패");
			return "common/errorPage";
		}else {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/home.got?toggle=member";
		}
	}
	
	@RequestMapping("insert.me")
	public void insertMember(Member m) {
		
	}
	
	@RequestMapping("update.me")
	public void updateMember(Member m) {
		
	}
	
	@RequestMapping("delete.me")
	public void deleteMember(String userId) {
		
	}
	
	@RequestMapping("idCheck.me")
	public void idCheck(String checkId) {
		
	}
	
}
