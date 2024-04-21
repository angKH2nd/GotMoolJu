package com.kh.got.qna.model.service;

import java.util.ArrayList;

import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.qna.model.vo.Qna;

public interface QnaService {
	
	//페이징비 와 qna 전체 목록 조회 
	int selectListCount();
	ArrayList<Qna> selectQnaList(PageInfo pi);
	
	//qna 상세 보기
	int increaseCount(int qnaNo);
	Qna selectQna(int qnaNo);
	
	//q작성하기
	int insertQna(Qna q);
	
	//q삭제하기
	int deleteQna(int qnaNo);
	
	//q수정하기

	int updateQna(int qnaNo, Qna q);
	

}
