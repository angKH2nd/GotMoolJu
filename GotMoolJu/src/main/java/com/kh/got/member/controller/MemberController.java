package com.kh.got.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.member.model.service.MemberService;
import com.kh.got.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
		}else {
			mv.addObject("alertMsg", "로그인에 실패하였습니다.");
		}
		mv.setViewName("redirect:/home.got");
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/home.got";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "/";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입되었습니다.");
			return "redirect:/home.got";
		}else {
			model.addAttribute("errorMsg", "회원가입에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		int result = mService.updateMember(m);
		
		if(result > 0) {
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "성공적으로 회원정보 수정되었습니다.");
			return "redirect:/home.got";
		}else {
			model.addAttribute("errorMsg", "회원정보수정에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.me")
	public String deleteMember(String userId, String userPwd, HttpSession session, Model model) {
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
			int result = mService.deleteMember(userId);
			
			if(result > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그 동안 이용해주셔서 감사합니다.");
				return "redirect:/home.got";
			}else {
				model.addAttribute("errorMsg", "회원 탈퇴에 실패하였습니다.");
				return "common/errorPage";
			}
		}else {
			session.setAttribute("alertMsg", "비밀번호를 잘못 입력하셨습니다.");
			return "redirect:/home.got?toggle=myPage";
		}
	}
	
	@RequestMapping("idCheck.me")
	public void idCheck(String checkId) {
		
	}
	
}
