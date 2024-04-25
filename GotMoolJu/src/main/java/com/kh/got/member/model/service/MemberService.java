package com.kh.got.member.model.service;

import com.kh.got.member.model.vo.LikeVO;
import com.kh.got.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);
	
	// 정보수정 서비스 (update)
	int updateMemberFile(Member m);
	
	// 정보수정 서비스 (update)
	int updateMember(Member m);
	
	// 회원탈퇴 서비스 (update)
	int deleteMember(String userId);
	
	// 아이디 중복체크 서비스 (select)
	int idCheck(String checkId);

	// 아이디 찾기 서비스 (select)
	String searchId(String searchIdName, String searchIdPhone);

	// 비밀번호 찾기 서비스 (update)
	int searchNewPwd(String searchNewPwd, String searchNewPwdUserId);
	
	// 소셜 회원가입
	int insertSocial(Member m);
	
	// 좋아요가 되어있는지 확인용
	int selectLikeYN(LikeVO lvo);
	
	// 좋아요 클릭시 db에 저장하는 insert
	int insertLike(LikeVO lvo);
	
	// 이미 하트가 있으면 다시 db 지우고 빈하트로 바꾸는 delete
	int deleteLike(LikeVO lvo);
	
	// 마이페이지 좋아요 갯수 select
	int countLike(int userNo);
}
