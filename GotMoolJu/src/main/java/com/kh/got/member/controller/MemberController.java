package com.kh.got.member.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.got.common.model.vo.SmsConfig;
import com.kh.got.common.template.PhoneNumber;
import com.kh.got.common.template.RandomNumber;
import com.kh.got.member.model.service.MemberService;
import com.kh.got.member.model.vo.Member;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("login.me")
	public ModelAndView loginMember(@ModelAttribute Member m, HttpSession session, ModelAndView mv) {
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
	
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, Model model, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		String userAddressNormal = m.getUserAddressNormal();
		String userAddressDetail = m.getUserAddressDetail();
		
		m.setUserAddress(userAddressNormal + userAddressDetail);
		m.setUserPwd(encPwd);
		m.setUserOriginName("basicUserProfile.png");
		m.setUserUpdateName("resources/images/member/basicUserProfile.png");
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
	public String updateMember(@ModelAttribute Member m, Model model, HttpSession session) {
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
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = mService.idCheck(checkId);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
	@Autowired
    private SmsConfig smsConfig;
	
	@ResponseBody
	@RequestMapping(value="sendIdSms", produces = "application/json; charset=UTF-8")
    public String sendIdSms(@RequestParam("searchIdName") String searchIdName, @RequestParam("searchIdPhone") String searchIdPhone) {
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(
				smsConfig.getSmsApiKey(),
                smsConfig.getSmsApiSecret(),
                "https://api.coolsms.co.kr"
        );
		
        JSONObject jObj = new JSONObject();
        
        int random = new RandomNumber().random4();
        
        Message message = new Message();
        message.setFrom("01091907946");
        message.setTo(searchIdPhone);
        message.setText("[갓물주] " + searchIdName + "님의 인증번호는 " + random + " 입니다.");
        
        try {
            messageService.send(message);
            jObj.put("result", "Y");
            jObj.put("random", random);
            return jObj.toJSONString();
        } catch (NurigoMessageNotReceivedException exception) {
        	jObj.put("result", "N");
            return "SMSF";
        } catch (Exception exception) {
        	jObj.put("result", "N");
            return "SMSF";
        }
    }
	
	@ResponseBody
	@RequestMapping(value="searchId", produces = "text/html; charset=utf-8")
	public String searchId(@RequestParam("searchIdName") String searchIdName, @RequestParam("searchIdPhone") String searchIdPhone) {
		return mService.searchId(searchIdName, PhoneNumber.phoneNumberFormat(searchIdPhone));
	}
	
	@ResponseBody
	@RequestMapping(value="sendPwdSms", produces = "application/json; charset=UTF-8")
    public String sendPwdSms(@RequestParam("searchPwdId") String searchPwdId, @RequestParam("searchPwdPhone") String searchPwdPhone) {
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(
				smsConfig.getSmsApiKey(),
                smsConfig.getSmsApiSecret(),
                "https://api.coolsms.co.kr"
        );
		
        JSONObject jObj = new JSONObject();
        
        int random = new RandomNumber().random4();
        
        Message message = new Message();
        message.setFrom("01091907946");
        message.setTo(searchPwdPhone);
        message.setText("[갓물주] 비밀번호찾기 인증번호는 " + random + " 입니다.");
        
        try {
            messageService.send(message);
            jObj.put("result", "Y");
            jObj.put("random", random);
            return jObj.toJSONString();
        } catch (NurigoMessageNotReceivedException exception) {
        	jObj.put("result", "N");
            return "SMSF";
        } catch (Exception exception) {
        	jObj.put("result", "N");
            return "SMSF";
        }
    }
	
}
