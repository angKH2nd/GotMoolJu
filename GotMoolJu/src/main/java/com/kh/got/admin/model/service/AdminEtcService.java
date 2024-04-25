package com.kh.got.admin.model.service;

import java.util.ArrayList;

import com.kh.got.common.model.vo.MapVO;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.etc.model.vo.Improvement;

public interface AdminEtcService {

	// 개선사항 3개 정도 조회용
	ArrayList<Improvement> adminImprovementMiniList();

	// 개선사항 전체 갯수 조회용
	int selectImpCount();

	// 개선사항 전체 조회용
	ArrayList<MapVO> selectAdminImpList(PageInfo adminPi);

	// 개선사항 삭제용
	int deleteAdminImp(int impNo);
	
	

}
