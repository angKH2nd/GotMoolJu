package com.kh.got.member.model.vo;

import java.sql.Date;

public class Member {
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userNickname;
	private String userSsn;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	private int userAreaNo;
	private Date userEnrollDate;
	private Date userModifyDate;
	private String userStatus;
	
	public Member() {}

	public Member(int userNo, String userId, String userPwd, String userName, String userNickname, String userSsn,
			String userPhone, String userEmail, String userAddress, int userAreaNo, Date userEnrollDate,
			Date userModifyDate, String userStatus) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userSsn = userSsn;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.userAreaNo = userAreaNo;
		this.userEnrollDate = userEnrollDate;
		this.userModifyDate = userModifyDate;
		this.userStatus = userStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserSsn() {
		return userSsn;
	}

	public void setUserSsn(String userSsn) {
		this.userSsn = userSsn;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public int getUserAreaNo() {
		return userAreaNo;
	}

	public void setUserAreaNo(int userAreaNo) {
		this.userAreaNo = userAreaNo;
	}

	public Date getUserEnrollDate() {
		return userEnrollDate;
	}

	public void setUserEnrollDate(Date userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}

	public Date getUserModifyDate() {
		return userModifyDate;
	}

	public void setUserModifyDate(Date userModifyDate) {
		this.userModifyDate = userModifyDate;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userNickname=" + userNickname + ", userSsn=" + userSsn + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", userAddress=" + userAddress + ", userAreaNo=" + userAreaNo
				+ ", userEnrollDate=" + userEnrollDate + ", userModifyDate=" + userModifyDate + ", userStatus="
				+ userStatus + "]";
	}
	
}
