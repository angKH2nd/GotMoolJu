package com.kh.got.common.template;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber;
	
	// 회원가입 이메일 양식
	public String joinEmail(String name, String email) {
		authNumber = RandomNumber.random6();
		String setFrom = "khproject2nd@gmail.com";
		String toMail = email;
		String title = "회원 가입 인증 이메일 입니다.";
		String content = 
				name + " 님 홈페이지를 방문해주셔서 감사합니다." + 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	// 회원정보수정 이메일 양식
	public String updateEmail(String name, String email) {
		authNumber = RandomNumber.random6();
		String setFrom = "khproject2nd@gmail.com";
		String toMail = email;
		String title = "회원 정보 수정 인증 이메일 입니다.";
		String content = 
				"갓물주를 이용해주시는 " + name + " 님, 늘 감사드립니다." + 
                "<br><br>" + 
			    "인증 번호는 " + authNumber + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	//이메일 전송
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
}
