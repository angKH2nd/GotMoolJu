package com.kh.got.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Member {
	
	private String userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userNickname;
	private String userPhone;
	private String userEmail;
	private String userGender;
	private String userAge;
	private String userAddress;
	private String userAreaNo;
	private Date userEnrollDate;
	private Date userModifyDate;
	private String userStatus;
	
}
