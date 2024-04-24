package com.kh.got.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.admin.model.dao.AdminMemberDao;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.member.model.vo.Member;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDao adminMDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메인 화면, 회원 5명 정도 조회용
	@Override
	public ArrayList<Member> adminSelectMemberMiniList() {
		return adminMDao.adminSelectMemberMiniList(sqlSession);
	}
	
	// 회원 전체 숫자 조회용
	@Override
	public int adminSelectMemberCount() {
		return adminMDao.adminSelectMemberCount(sqlSession);
	}

	// 회원 전체 리스트 조회용
	@Override
	public ArrayList<Member> adminSelectMemberList(PageInfo adminPi) {
		return adminMDao.adminSelectMemberList(sqlSession, adminPi);
	}

	// 회원 상세 정보 조회 페이지, detailForm
	@Override
	public Member adminSelectMemberDetail(int userNo) {
		return adminMDao.adminSelectMemberDetail(sqlSession, userNo);
	}

	// 회원 디테일 폼 status 변경
	@Override
	public int adminUpdateMemberDetail(Member adminM) {
		return adminMDao.adminUpdateMemberDetail(sqlSession, adminM);
	}








	
	
	
}
