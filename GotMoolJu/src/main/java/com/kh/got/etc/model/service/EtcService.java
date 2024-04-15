package com.kh.got.etc.model.service;

import java.util.ArrayList;

import com.kh.got.etc.model.vo.Improvement;

public interface EtcService {

	// 1. 개선의견 조회 서비스
	ArrayList<Improvement> selectImpReplyList();
	
}
