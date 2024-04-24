package com.kh.got.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.member.model.vo.Member;

@Repository
public class AdminMemberDao {

	// 메인 화면, 회원 5명 정도 조회용
	public ArrayList<Member> adminSelectMemberMiniList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("memberMapper.adminSelectMemberMiniList");
	}
	
	// 회원 리스트 명 수 조회 (select) 
	public int adminSelectMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.adminSelectMemberCount");
	}

	// 회원 전체 리스트 조회용
	public ArrayList<Member> adminSelectMemberList(SqlSessionTemplate sqlSession, PageInfo adminPi) {
		
		int offset = (adminPi.getCurrentPage() - 1) * adminPi.getBoardLimit();
		int limit = adminPi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("memberMapper.adminSelectMemberList", null, rowBounds);
	}

	// 회원 상세 정보 조회 페이지, detailForm
	public Member adminSelectMemberDetail(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.adminSelectMemberDetail", userNo);
	}

	// 회원 디테일 폼 status 변경
	public int adminUpdateMemberDetail(SqlSessionTemplate sqlSession, Member adminM) {
		return sqlSession.update("memberMapper.adminUpdateMemberDetail", adminM);
	}
	
	
	
	


}
