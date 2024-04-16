package com.kh.got.etc.model.service;

import java.util.ArrayList;

import com.kh.got.etc.model.vo.ImpChoose;
import com.kh.got.etc.model.vo.Improvement;

public interface EtcService {

	// 1. 개선의견 조회 서비스
	ArrayList<ImpChoose> selectImpChooseList(int impChooseUserNo);
	ArrayList<Improvement> selectImpReplyList();
	
	// 2. 개선의견 삭제 서비스
	int deleteImpReply(int impReplyNo);

	// 3. 개선의견 수정 서비스
	int updateImpReply(int impReplyNo, String impReplyContent);
	
}
