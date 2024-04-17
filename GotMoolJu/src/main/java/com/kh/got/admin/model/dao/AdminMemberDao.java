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
	public ArrayList<Member> selectMemberMiniList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("memberMapper.selectMemberMiniList");
	}
	
	// 회원 리스트 조회 (select) 
	public int selectMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectMemberCount");
	}

	// 회원 전체 리스트 조회용
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("memberMapper.selectMemberList", null, rowBounds);
	}

	// 회원 상세 정보 조회 페이지, detailForm
	public Member selectMemberDetail(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("memberMapper.selectMemberDetail", userNo);
	}

	// 회원 디테일 폼 status 변경
	public int updateMemberDetail(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemberDetail", m);
	}
	
	
	
	


}
