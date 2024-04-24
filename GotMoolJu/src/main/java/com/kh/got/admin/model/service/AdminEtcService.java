package com.kh.got.admin.model.service;

import java.util.ArrayList;

import com.kh.got.etc.model.vo.Improvement;

public interface AdminEtcService {

	// 개선사항 3개 정도 조회용
	ArrayList<Improvement> adminImprovementMiniList();

}
