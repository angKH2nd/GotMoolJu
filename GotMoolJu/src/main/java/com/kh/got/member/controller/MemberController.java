package com.kh.got.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.util.FileCopyUtils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.got.common.model.vo.SmsConfig;
import com.kh.got.common.template.FileConverter;
import com.kh.got.common.template.MailSendService;
import com.kh.got.common.template.PhoneNumber;
import com.kh.got.common.template.RandomNumber;
import com.kh.got.common.template.UploadFile;
import com.kh.got.member.model.service.MemberService;
import com.kh.got.member.model.vo.LikeVO;
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
	
	@Autowired
    private SmsConfig smsConfig;
	
	@Autowired
	private MailSendService mailService;

	@RequestMapping("login.me")
	public String loginMember(@ModelAttribute Member m, @RequestParam(value = "rememberId", required = false, defaultValue = "false") boolean rememberId, HttpSession session, HttpServletResponse response) {
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("swalMsg1", "로그인 성공!");
			session.setAttribute("swalMsg2", "갓물주에 오신 것을 환영합니다!");
			session.setAttribute("swalMsg3", "success");
			
			if (rememberId) {
		        // 아이디 기억하기가 체크된 경우
				Cookie cookie = new Cookie("id", loginUser.getUserId());
				response.addCookie(cookie);
		    }else {
		    	// 아이디 기억하기가 체크되지 않은 경우
		    	Cookie cookie = new Cookie("id", loginUser.getUserId());
		    	cookie.setMaxAge(0);
		    	response.addCookie(cookie);
		    }
		}else {
			session.setAttribute("swalMsg1", "로그인 실패!");
			session.setAttribute("swalMsg2", "아이디, 비밀번호를 확인해주세요.");
			session.setAttribute("swalMsg3", "warning");
		}
		return "redirect:/home.got";
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/home.got";
	}
	
	@ResponseBody
	@RequestMapping(value="sendEnrollPhone.me", produces = "application/json; charset=UTF-8")
    public String sendEnrollPhone(@RequestParam("enrollName") String enrollName, @RequestParam("enrollPhone") String enrollPhone) {
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(
				smsConfig.getSmsApiKey(),
                smsConfig.getSmsApiSecret(),
                "https://api.coolsms.co.kr"
        );
		
        JSONObject jObj = new JSONObject();
        
        int random = new RandomNumber().random4();
        
        Message message = new Message();
        message.setFrom("01091907946");
        message.setTo(enrollPhone);
        message.setText("[갓물주] " + enrollName + "님의 회원가입 인증번호는 " + random + " 입니다.");
        
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
	
	@RequestMapping("insert.me")
	public String insertMember(@ModelAttribute Member m, Model model, HttpSession session) {
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		String userAddressNormal = m.getUserAddressNormal();
		String userAddressDetail = m.getUserAddressDetail();
		
		// 회원가입 기본 프로필 이미지 배정용
		String resourcePath = "member/basicUserProfile.png"; 	 // 기본 프로필 이미지의 리소스 경로
		Resource resource = new ClassPathResource(resourcePath); // 리소스를 가져오기 위한 ClassPathResource 객체 생성
		
		MultipartFile file = null;
		try {
			File imgFile = resource.getFile();
			file = FileConverter.convert(imgFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String beforeName = UploadFile.saveFile(file, session);
		String updateName = "resources/uploadFiles/member/" + beforeName;
		
		m.setUserAddress(userAddressNormal + userAddressDetail);
		m.setUserPwd(encPwd);
		m.setUserOriginName("basicUserProfile.png");
		m.setUserUpdateName(updateName);
		int result = mService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("swalMsg1", "회원가입 성공!");
			session.setAttribute("swalMsg2", "로그인 해주세요!");
			session.setAttribute("swalMsg3", "warning");
			return "redirect:/home.got";
		}else {
			model.addAttribute("errorMsg", "회원가입에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = mService.idCheck(checkId);
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	
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
        message.setText("[갓물주] " + searchIdName + "님의 아이디 찾기 인증번호는 " + random + " 입니다.");
        
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
	@RequestMapping(value="searchId.me", produces = "text/html; charset=utf-8")
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
	
	@ResponseBody
	@RequestMapping(value="searchNewPwd.me")
	public int searchNewPwd(@RequestParam("searchNewPwd") String searchNewPwd, @RequestParam("searchNewPwdUserId") String searchNewPwdUserId, HttpSession session, Model model) {
		return mService.searchNewPwd(bcryptPasswordEncoder.encode(searchNewPwd), searchNewPwdUserId);
	}
	
	@ResponseBody
	@RequestMapping(value="delete.me")
	public int deleteMember(@RequestParam("deletePwd") String deletePwd, HttpSession session) {
		int result = 0;
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(bcryptPasswordEncoder.matches(deletePwd, encPwd)) {
			result = mService.deleteMember(((Member)session.getAttribute("loginUser")).getUserId());
		}
		
		if(result > 0) {
			session.setAttribute("swalMsg1", "회원탈퇴 성공!");
			session.setAttribute("swalMsg2", "그 동안 저희 갓물주를 이용해주셔서 감사합니다.");
			session.setAttribute("swalMsg3", "success");
			session.removeAttribute("loginUser");
  	 	 }else {
  	 		session.setAttribute("swalMsg1", "회원탈퇴 실패!");
			session.setAttribute("swalMsg2", "비밀번호를 확인해주세요.");
			session.setAttribute("swalMsg3", "warning");	
  	 	 }
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="sendUpdateSms.me", produces = "application/json; charset=UTF-8")
    public String sendUpdateSms(@RequestParam("UpdatePhone") String UpdatePhone, HttpSession session) {
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(
				smsConfig.getSmsApiKey(),
                smsConfig.getSmsApiSecret(),
                "https://api.coolsms.co.kr"
        );
		
        JSONObject jObj = new JSONObject();
        
        int random = new RandomNumber().random4();
        
        Message message = new Message();
        message.setFrom("01091907946");
        message.setTo(UpdatePhone);
        message.setText("[갓물주] " + ((Member)session.getAttribute("loginUser")).getUserName() + "님의 전화번호 변경 인증번호는 " + random + " 입니다.");
        
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
	@RequestMapping(value="updateFile.me")
	public int updateMemberFile(@RequestParam("profileImg") MultipartFile profileImg,
				             @RequestParam("updateNickname") String updateNickname,
				             @RequestParam("updatePhone") String updatePhone,
				             @RequestParam("updateEmail") String updateEmail,
				             @RequestParam("updateAddress") String updateAddress,
				             							  Model model, HttpSession session) {
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		loginUser.setUserNickname(updateNickname);
		loginUser.setUserPhone(updatePhone);
		loginUser.setUserEmail(updateEmail);
		loginUser.setUserAddress(updateAddress);
		
		// 기존 프로필 이미지 파일을 삭제
	    if (!profileImg.isEmpty() && loginUser.getUserUpdateName() != null) {
	    	new File(session.getServletContext().getRealPath(loginUser.getUserUpdateName())).delete();
	    }

	    // 새로운 프로필 이미지 파일을 저장
		if(!profileImg.getOriginalFilename().equals("")) {
			String updateName = UploadFile.saveFile(profileImg, session);
			loginUser.setUserOriginName(profileImg.getOriginalFilename());
			loginUser.setUserUpdateName("resources/uploadFiles/member/" + updateName);
		}
		
		int result = mService.updateMemberFile(loginUser);
		
		if(result > 0) {
			session.setAttribute("loginUser", mService.loginMember(loginUser));
			session.setAttribute("swalMsg1", "회원정보수정 성공!");
			session.setAttribute("swalMsg2", "성공적으로 수정되었습니다.");
			session.setAttribute("swalMsg3", "success");
		}else {
			model.addAttribute("errorMsg", "회원정보수정에 실패했습니다.");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="update.me")
	public int updateMember(@RequestParam("updateNickname") String updateNickname,
				             @RequestParam("updatePhone") String updatePhone,
				             @RequestParam("updateEmail") String updateEmail,
				             @RequestParam("updateAddress") String updateAddress,
				             							  Model model, HttpSession session) {
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		loginUser.setUserNickname(updateNickname);
		loginUser.setUserPhone(updatePhone);
		loginUser.setUserEmail(updateEmail);
		loginUser.setUserAddress(updateAddress);
		
		int result = mService.updateMember(loginUser);
		
		if(result > 0) {
			session.setAttribute("loginUser", mService.loginMember(loginUser));
			session.setAttribute("swalMsg1", "회원정보수정 성공!");
			session.setAttribute("swalMsg2", "성공적으로 수정되었습니다.");
			session.setAttribute("swalMsg3", "success");
		}else {
			model.addAttribute("errorMsg", "회원정보수정에 실패했습니다.");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="updatePwd.me")
	public int updatePwd(@RequestParam("updatePwd") String searchNewPwd, HttpSession session, Model model) {
		int result = mService.searchNewPwd(bcryptPasswordEncoder.encode(searchNewPwd), ((Member)session.getAttribute("loginUser")).getUserId());		
		if(result > 0) {
			session.removeAttribute("loginUser");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="sendEnrollEmail.me", produces = "application/json; charset=UTF-8")
    public String sendEnrollEmail(@RequestParam("enrollName") String enrollName, @RequestParam("enrollEmail") String enrollEmail) {
		return mailService.joinEmail(enrollName, enrollEmail);
    }
	
	@ResponseBody
	@RequestMapping(value="sendUpdateEmailSms.me", produces = "application/json; charset=UTF-8")
    public String sendUpdateEmailSms(@RequestParam("updateName") String updateName, @RequestParam("updateEmail") String updateEmail) {
		return mailService.updateEmail(updateName, updateEmail);
    }
	
	// ---------------------- 소셜 로그인 ----------------------------
	
	

	@RequestMapping(value = "login/getKakaoAuthUrl")
	@ResponseBody
	public String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		String url = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=a07a1d3336ad0e46b650f0614d3df7c7"
				+ "&redirect_uri=http://localhost:8222/got/login.ka"
				+ "&response_type=code";
		
		return url;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "login.ka")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model, HttpSession session) throws Exception {

        String access_Token = getAccessToken(code);
        
        
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
       
        JSONObject kakaoInfo =  new JSONObject(userInfo);
        model.addAttribute("kakaoInfo", kakaoInfo);
        
        if(access_Token != "") {
        	
        	Member kakaoM = new Member();
        	kakaoM.setUserName((String)userInfo.get("nickname"));
        	kakaoM.setUserId((String)userInfo.get("email")+"(kakao)");
        	
        	Member loginUser = mService.loginMember(kakaoM);
        	
        	if(loginUser == null) {
        		
        		int insertKakao = mService.insertSocial(kakaoM);
        		
        		if(insertKakao > 0) {
        			
        			Member loginUser1 = mService.loginMember(kakaoM);
        			session.setAttribute("loginUser", loginUser1);
        			session.setAttribute("swalMsg1", "로그인 성공!");
        			session.setAttribute("swalMsg2", "갓물주에 오신 것을 환영합니다!");
        			session.setAttribute("swalMsg3", "success");
        			
        		}
        		
        	}else {
        		session.setAttribute("loginUser", loginUser);
        		session.setAttribute("swalMsg1", "로그인 성공!");
    			session.setAttribute("swalMsg2", "갓물주에 오신 것을 환영합니다!");
    			session.setAttribute("swalMsg3", "success");
        		
        	}
        	    	
        }else {
        	session.setAttribute("swalMsg1", "로그인 실패!");
			session.setAttribute("swalMsg2", "아이디, 비밀번호를 확인해주세요.");
			session.setAttribute("swalMsg3", "warning");
        }
        
        
        return "redirect:/home.got"; //본인 원하는 경로 설정
	}
	
    //토큰발급
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=a07a1d3336ad0e46b650f0614d3df7c7");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8222/got/login.ka");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();


            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
    //유저정보조회
    public HashMap<String, Object> getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }
 
	// ----------------- 네이버 로그인 --------------------
    @RequestMapping(value="naver.me", method=RequestMethod.GET)
    public String callBack(){
        return "member/callback";
    }
	
	
    @RequestMapping(value="login.na", produces = "applicaiont/html; charset=utf-8")
    @ResponseBody
	public String naverLogin(String name, String email, String gender, HttpSession session) {
    	
    	
    	if(name != null && email != null) {
        	
        	Member naverM = new Member();
        	naverM.setUserName(name);
        	naverM.setUserId(email+"(naver)");
        	
        	Member loginUser = mService.loginMember(naverM);
        	
        	
        	if(loginUser == null) {
        		
        		int insertNaver = mService.insertSocial(naverM);
        		
        		if(insertNaver > 0) {
        			
        			Member loginUser1 = mService.loginMember(naverM);
        			session.setAttribute("loginUser", loginUser1);
        			session.setAttribute("swalMsg1", "로그인 성공!");
        			session.setAttribute("swalMsg2", "갓물주에 오신 것을 환영합니다!");
        			session.setAttribute("swalMsg3", "success");
        			
        		}
        		
        	}else {
        		session.setAttribute("loginUser", loginUser);
        		session.setAttribute("swalMsg1", "로그인 성공!");
    			session.setAttribute("swalMsg2", "갓물주에 오신 것을 환영합니다!");
    			session.setAttribute("swalMsg3", "success");
        		
        	}
        	    	
        }else {
        	session.setAttribute("swalMsg1", "로그인 실패!");
			session.setAttribute("swalMsg2", "아이디, 비밀번호를 확인해주세요.");
			session.setAttribute("swalMsg3", "warning");
        }
    	
    	String result = "no";
    	
    	if(session.getAttribute("loginUser") != null) {
    		
    		result = "yes";
    		
    	}
    	
    	return result;
    	
    }
    
	
	
	@ResponseBody
	@RequestMapping(value="selectLike.me")
	public int selectLikeYN(int userNo, int aptNo) {
		
		LikeVO lvo = new LikeVO();
		
		lvo.setDibsUserNo(userNo);
		lvo.setDibsAptNo(aptNo);
		
		int result = mService.selectLikeYN(lvo);
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="checkLike.me")
	public int checkLike(LikeVO lvo) {
		
		return mService.selectLikeYN(lvo);
		
	}
	
	@ResponseBody
	@RequestMapping(value="insertLike.me")
	public int insertLike(LikeVO lvo) {
		
		return mService.insertLike(lvo);
		
	}
	
	@ResponseBody
	@RequestMapping(value="deleteLike.me")
	public int deleteLike(LikeVO lvo) {
		
		return mService.deleteLike(lvo);
		
	}
	
	@ResponseBody
	@RequestMapping(value="countLike.me")
	public int countingLike(int userNo) {
		
		return mService.countLike(userNo);
		
	}
}
