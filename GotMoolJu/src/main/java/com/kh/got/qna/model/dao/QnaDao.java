package com.kh.got.qna.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.qna.model.vo.Qna;

@Repository
public class QnaDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("qnaMapper.selectListCount");
	}
	
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage()-1)* pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaList", null, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("qnaMapper", qnaNo);
		
	}

	public Qna selectQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.selectOne("qnaMapper.selectQna", qnaNo);
	}
	
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("qnaMapper.insertQna", q);
	}
	
	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("qnaMapper.deleteQna", qnaNo);
	}
	
	public int updateQna(SqlSessionTemplate sqlSession, int qnaNo, Qna q) {
		return sqlSession.update("qnaMapper.updateQna", q);
	}
}	
