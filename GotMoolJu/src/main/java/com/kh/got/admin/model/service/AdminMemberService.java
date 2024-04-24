package com.kh.got.admin.model.service;

import java.util.ArrayList;

import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.member.model.vo.Member;

public interface AdminMemberService {

	// 메인 화면, 회원 5명 정도 조회용
	ArrayList<Member> adminSelectMemberMiniList();
	
	// 회원 리스트 조회 서비스 (select) 
	int adminSelectMemberCount(); 			 			 // 회원 전체 숫자 조회용
	ArrayList<Member> adminSelectMemberList(PageInfo adminPi); // 회원 전체 리스트 조회용

	// 회원 상세 정보 조회용, detailForm
	Member adminSelectMemberDetail(int userNo);

	// 회원 디테일 폼 status 변경
	int adminUpdateMemberDetail(Member adminM);
	
	
	
}
