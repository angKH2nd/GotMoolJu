package com.kh.got.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userNickname;
	private String userPhone;
	private String userEmail;
	private String userGender;
	private String userAddressNormal; // 주소 조합용
    private String userAddressDetail; // 주소 조합용
	private String userAddress;		  // 주소 완성형
	private String userAreaNo;
	private Date userEnrollDate;
	private Date userModifyDate;
	private String userStatus;
	private String userOriginName;
	private String userUpdateName;
	
	
}
