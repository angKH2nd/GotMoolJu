package com.kh.got.community.model.service;

import java.util.ArrayList;

import com.google.gson.JsonElement;
import com.kh.got.community.model.vo.Town;

public interface CommunityService {

	// 1. 커뮤니티 조회 서비스
	ArrayList<Town> selectTownList();
	// ArrayList<TownLikes> selectTownLikesList();
	// ArrayList<TownStar> selectTownStarList();

}
