package com.kh.got.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.qna.model.vo.Qna;
import com.kh.got.qna.model.vo.QnaAnswer;

@Repository
public class AdminQnaDao {

	// qna 리스트
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo adminPi) {
		
		int offset = (adminPi.getCurrentPage() - 1) * adminPi.getBoardLimit();
		int limit = adminPi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("qnaMapper.selectQnaList", null, rowBounds);
	}

	// qna 개수
	public int selectQnaListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("qnaMapper.selectQnaListCount");
	}

	// qna answer list
	public ArrayList<QnaAnswer> selectQnaAnswerList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("qnaMapper.selectQnaAnswerList");
	}

	// qna 리스트 삭제
	public int adminDeleteQnaList(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("qnaMapper.adminDeleteQnaList", qnaNo);
	}

	// qna 답글 등록
	public int adminEnrollQnaAnswer(SqlSessionTemplate sqlSession, String qnaAnswerContent, int qnaNo, int qnaType) {
		Map<String, Object> adminEnrollQnaAnswerParameters = new HashMap<>();
		adminEnrollQnaAnswerParameters.put("qnaAnswerContent", qnaAnswerContent);
		adminEnrollQnaAnswerParameters.put("qnaNo", qnaNo);
		adminEnrollQnaAnswerParameters.put("qnaType", qnaType);
		
		return sqlSession.insert("qnaMapper.adminEnrollQnaAnswer", adminEnrollQnaAnswerParameters);
	}

	// qna 답글 등록 시 qna 답변 완료로 수정
	public int adminEnrollQnaAnswerQnaUpdate(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("qnaMapper.adminEnrollQnaAnswerQnaUpdate", qnaNo);
	}

	// qna 답글 수정
	public int adminUpdateQnaAnswer(SqlSessionTemplate sqlSession, String qnaAnswerContent, int qnaNo) {
		Map<String, Object> adminUpdateQnaAnswerParameters = new HashMap<>();
		adminUpdateQnaAnswerParameters.put("qnaAnswerContent", qnaAnswerContent);
		adminUpdateQnaAnswerParameters.put("qnaNo", qnaNo);
		
		return sqlSession.update("qnaMapper.adminUpdateQnaAnswer", adminUpdateQnaAnswerParameters);
//		return sqlSession.update("qnaMapper.adminEnrollQnaAnswerQnaUpdate", qnaNo);

		
	}

	
}
