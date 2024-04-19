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

	@Override
	public int increaseCount(int qnaNo) {
		return qDao.increaseCount(sqlSession, qnaNo);
	}

	@Override
	public Qna selectQna(int qnaNo) {
		return qDao.selectQna(sqlSession, qnaNo) ;
	}

	@Override
	public int insertQna(Qna q) {
		return qDao.insertQna(sqlSession, q);
	}

	@Override
	public int deleteQna(int qnaNo) {
		return qDao.deleteQna(sqlSession, qnaNo);
	}

	@Override
	public int updateQna(Qna q) {
		return qDao.updateQna(sqlSession, q);
	}

}
