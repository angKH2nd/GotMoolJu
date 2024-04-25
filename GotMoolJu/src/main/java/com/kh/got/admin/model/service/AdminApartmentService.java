package com.kh.got.admin.model.service;

import java.util.ArrayList;

import com.kh.got.common.model.vo.MapVO;
import com.kh.got.common.model.vo.PageInfo;

public interface AdminApartmentService {

	// 아파트 조회
	ArrayList<MapVO> selectAdminAptList(PageInfo adminPi);

	// 아파트 삭제
	int deleteAdminApt(int aptNo);

	
}
