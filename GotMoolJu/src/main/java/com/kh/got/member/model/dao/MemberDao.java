package com.kh.got.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.member.model.vo.LikeVO;
import com.kh.got.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMemberFile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMemberFile", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public String searchId(SqlSessionTemplate sqlSession, String searchIdName, String searchIdPhone) {
		Map<String, String> searchIdParameters = new HashMap<>();
		searchIdParameters.put("searchIdName", searchIdName);
		searchIdParameters.put("searchIdPhone", searchIdPhone);
	    
		return sqlSession.selectOne("memberMapper.searchId", searchIdParameters);
	}

	public int searchNewPwd(SqlSessionTemplate sqlSession, String searchNewPwd, String searchNewPwdUserId) {
		Map<String, String> searchNewPwdParameters = new HashMap<>();
		searchNewPwdParameters.put("searchNewPwd", searchNewPwd);
		searchNewPwdParameters.put("searchNewPwdUserId", searchNewPwdUserId);
		
		return sqlSession.update("memberMapper.searchNewPwd", searchNewPwdParameters);
	}
	
	public int selectLikeYN(SqlSessionTemplate sqlSession, LikeVO lvo) {
		
		return sqlSession.selectOne("memberMapper.selectLikeYN", lvo);
	}
	
}
