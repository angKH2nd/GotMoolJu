package com.kh.got.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.qna.model.vo.Qna;

@Repository
public class AdminQnaDao {

	// qna 리스트
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo adminPi) {
		
		int offset = (adminPi.getCurrentPage() - 1) * adminPi.getBoardLimit();
		int limit = adminPi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("qnaMapper.selectQnaList", null, rowBounds);
	}

	public int selectQnaListCount(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("qnaMapper.selectQnaListCount");
	}

}
