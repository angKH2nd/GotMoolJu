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
	
	// 4. 개선의견 좋아요싫어요 삭제 서비스
	int deleteImpChooseList(ImpChoose impChoose);
	
	// 5. 개선의견 좋아요싫어요 변경 서비스
	int updateImpChooseList(ImpChoose impChoose);
	
	// 6. 개선의견 좋아요싫어요 등록 서비스
	int insertImpChooseList(ImpChoose impChoose);
	
}
