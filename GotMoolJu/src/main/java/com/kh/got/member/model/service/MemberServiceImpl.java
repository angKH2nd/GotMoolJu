package com.kh.got.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.member.model.dao.MemberDao;
import com.kh.got.member.model.vo.LikeVO;
import com.kh.got.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMemberFile(Member m) {
		return mDao.updateMemberFile(sqlSession, m);
	}
	
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String userId) {
		return mDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int idCheck(String checkId) {
		return mDao.idCheck(sqlSession, checkId);
	}

	@Override
	public String searchId(String searchIdName, String searchIdPhone) {
		return mDao.searchId(sqlSession, searchIdName, searchIdPhone);
	}

	@Override
	public int searchNewPwd(String searchNewPwd, String searchNewPwdUserId) {
		return mDao.searchNewPwd(sqlSession, searchNewPwd, searchNewPwdUserId);
	}

	@Override
	public int selectLikeYN(LikeVO lvo) {
		return mDao.selectLikeYN(sqlSession, lvo);
	}


}
