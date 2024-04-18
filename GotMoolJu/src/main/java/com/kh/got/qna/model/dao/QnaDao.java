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

}
