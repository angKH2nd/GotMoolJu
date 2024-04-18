package com.kh.got.qna.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.qna.model.dao.QnaDao;
import com.kh.got.qna.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Qna> selectQnaList() {
		return qDao.selectQnaList(sqlSession);
	}

}
