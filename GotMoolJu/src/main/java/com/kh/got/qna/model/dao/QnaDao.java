package com.kh.got.qna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.qna.model.vo.Qna;

@Repository
public class QnaDao {
	
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaList");
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("qnaMapper", qnaNo);
		
	}

	public Qna selectQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.selectOne("qnaMapper.selectQna", qnaNo);
	}
	
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("qnaMapper", q);
	}
	
	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("qnaMapper", qnaNo);
	}
	
	public int updateQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("qnaMapper", q);
	}
}
