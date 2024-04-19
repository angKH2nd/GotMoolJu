package com.kh.got.qna.model.service;

import java.util.ArrayList;

import com.kh.got.qna.model.vo.Qna;

public interface QnaService {
	
	//qna 전체 목록 조회
	ArrayList<Qna> selectQnaList();
	
	//qna 상세 보기
	int increaseCount(int qnaNo);
	Qna selectQna(int qnaNo);
	
	//q작성하기
	int insertQna(Qna q);
	
	//q삭제하기
	int deleteQna(int qnaNo);
	
	//q수정하기
	int updateQna(Qna q);
	

}
