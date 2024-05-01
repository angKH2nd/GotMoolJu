package com.kh.got.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.admin.model.dao.AdminQnaDao;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.qna.model.vo.Qna;
import com.kh.got.qna.model.vo.QnaAnswer;


@Service
public class AdminQnaServiceImpl implements AdminQnaService {


	@Autowired
	private AdminQnaDao adminQDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// qna 미니 리스트
	@Override
	public ArrayList<Qna> adminSelectQnaMiniList() {
		return adminQDao.adminSelectQnaMiniList(sqlSession);
	}
	
	// qna 리스트
	@Override
	public ArrayList<Qna> adminSelectQnaList(PageInfo adminPi) {
		return adminQDao.adminSelectQnaList(sqlSession, adminPi);
	}

	// qna 개수
	@Override
	public int adminSelectQnaListCount() {
		return adminQDao.adminSelectQnaListCount(sqlSession);
	}

	// qna answer list
	@Override
	public ArrayList<QnaAnswer> adminSelectQnaAnswerList() {
		return adminQDao.adminSelectQnaAnswerList(sqlSession);
	}

	// qna 리스트 삭제
	@Override
	public int adminDeleteQnaList(int qnaNo) {
		return adminQDao.adminDeleteQnaList(sqlSession, qnaNo);
	}

	// qna 답글 등록
	@Override
	public int adminEnrollQnaAnswer(String qnaAnswerContent, int qnaNo, int qnaType) {
		return adminQDao.adminEnrollQnaAnswer(sqlSession, qnaAnswerContent, qnaNo, qnaType);
	}

	// qna 답글 등록 시 qna 답변 완료로 수정
	@Override
	public int adminEnrollQnaAnswerQnaUpdate(int qnaNo) {
		return adminQDao.adminEnrollQnaAnswerQnaUpdate(sqlSession, qnaNo);
	}

	// qna 답글 수정
	@Override
	public int adminUpdateQnaAnswer(String qnaAnswerContent, int qnaNo) {
		return adminQDao.adminUpdateQnaAnswer(sqlSession, qnaAnswerContent, qnaNo);
	}

	@Override
	public QnaAnswer qnaAnswer(int qnaNo) {
		return adminQDao.qnaAnswer(sqlSession, qnaNo);
	}

	

	
	
	
	
	
}
