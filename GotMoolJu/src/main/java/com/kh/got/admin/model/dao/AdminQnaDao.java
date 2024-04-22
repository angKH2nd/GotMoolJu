package com.kh.got.admin.model.dao;

import java.util.ArrayList;

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
	public int adminDeleteQnaList(SqlSessionTemplate sqlSession, int adminQno) {
		return sqlSession.update("qnaMapper.selectQnaAnswerList", adminQno);
	}

	
	
}
