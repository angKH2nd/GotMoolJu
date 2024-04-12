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
//	@Override
//	public ArrayList<Member> selectMemberMiniList(PageInfo pi) {
//		return adminMDao.selectMemberMiniList(sqlSession, pi);
//	}
	
	// 회원 전체 숫자 조회용
	@Override
	public int selectMemberCount() {
		return adminMDao.selectMemberCount(sqlSession);
	}

	// 회원 전체 리스트 조회용
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return adminMDao.selectMemberList(sqlSession, pi);
	}

	// 회원 상세 정보 조회용
	@Override
	public String selectMemberDetail() {
		return null;
	}



	
	
	
}