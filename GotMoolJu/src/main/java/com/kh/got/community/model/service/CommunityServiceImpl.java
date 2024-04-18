package com.kh.got.community.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.community.model.dao.CommunityDao;
import com.kh.got.community.model.vo.Town;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao cDao;
	
	@Override
	public ArrayList<Town> selectTownList() {
		return null;
	}
	
	/*
	@Override
	public ArrayList<TownLikes> selectTownLikesList() {
		return null;
	}
	
	@Override
	public ArrayList<TownStar> selectTownStarList() {
		return null;
	}
	*/
	
}
