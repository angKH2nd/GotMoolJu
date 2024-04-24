package com.kh.got.admin.model.service;

import java.util.ArrayList;

import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.qna.model.vo.Qna;
import com.kh.got.qna.model.vo.QnaAnswer;

public interface AdminQnaService {

	// qna 미니 리스트
	ArrayList<Qna> adminSelectQnaMiniList();
	
	// qna 리스트
	ArrayList<Qna> adminSelectQnaList(PageInfo adminPi);
	int adminSelectQnaListCount(); // qna 개수
	ArrayList<QnaAnswer> adminSelectQnaAnswerList(); // qna answer list
	
	// qna 리스트 삭제
	int adminDeleteQnaList(int qnaNo);
	
	// qna 답글 등록
	int adminEnrollQnaAnswer(String qnaAnswerContent, int qnaNo, int qnaType);
	int adminEnrollQnaAnswerQnaUpdate(int qnaNo); // qna 답글 등록 시 qna 답변 완료로 수정
	
	// qna 답글 수정
	int adminUpdateQnaAnswer(String qnaAnswerContent, int qnaNo);
	

}
