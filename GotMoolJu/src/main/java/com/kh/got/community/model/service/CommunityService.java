package com.kh.got.community.model.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.kh.got.community.model.vo.Town;
import com.kh.got.community.model.vo.TownStar;

public interface CommunityService {

	// 1. 커뮤니티 조회 서비스
	ArrayList<Town> selectTownList();
	ArrayList<TownStar> isMyTown(int userNo);

	// 2. 커뮤니티 좋아요 서비스
	int updateTownLikes(int townNo);

	// 3. 커뮤니티 즐겨찾기 서비스
	int updateTownStar(int townNo, int userNo);
	
	// 4. 커뮤니티 내 최고 인기글 서비스
	Town selectMyBestTown(String userNickname);
	
	// 5. 커뮤니티 즐겨찾기 목록 조회 서비스
	ArrayList<Town> selectTownStarList(int userNo);
	
}
