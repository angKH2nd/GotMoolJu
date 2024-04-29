package com.kh.got.common.model.service;

import java.util.ArrayList;

import com.kh.got.common.model.vo.MapVO;

public interface MapService {

	ArrayList<MapVO> selectAllList();

	String countJachi(String jachi);
	
	String countDong(String dong);
	
	ArrayList<MapVO> detailAptCount(String minX, String minY, String maxX, String maxY);
	
	ArrayList<MapVO> detailApt(String aptName, String aptLocation);
	
	MapVO selectAptDetail(String aptNo);
	
	int selectAptCount();
	
	ArrayList<MapVO> selectTopAptList();
	
	ArrayList<MapVO> selectTopPrice();
	
	ArrayList<MapVO> selectDibsList(int userNo);
	
	ArrayList<MapVO> searchEx(String searchType, String searchInput);
	
	int searchCountUp(String aptName);
	
	ArrayList<MapVO> popularTitle();
	
	ArrayList<MapVO> selectHotAptList();
}
