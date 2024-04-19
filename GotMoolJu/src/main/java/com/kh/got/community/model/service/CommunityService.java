package com.kh.got.community.model.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.kh.got.community.model.vo.Town;

public interface CommunityService {

	// 1. 커뮤니티 조회 서비스
	ArrayList<Town> selectTownList();
	// ArrayList<TownStar> selectTownStarList();

	// 2. 커뮤니티 좋아요 서비스
	int updateTownLikes(int townNo);

	// 3. 커뮤니티 즐겨찾기 서비스
	int updateTownStar(int townNo, int userNo);
	
	
}
