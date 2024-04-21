package com.kh.got.admin.model.service;

import java.util.ArrayList;

import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.qna.model.vo.Qna;

public interface AdminQnaService {

	// qna 리스트
	ArrayList<Qna> selectQnaList(PageInfo adminPi);
	int selectQnaListCount(); // qna 개수

}
