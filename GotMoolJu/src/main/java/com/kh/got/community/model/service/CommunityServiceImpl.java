package com.kh.got.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.got.community.model.dao.CommunityDao;
import com.kh.got.community.model.vo.Town;
import com.kh.got.community.model.vo.TownStar;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Town> selectTownList() {
		return cDao.selectTownList(sqlSession);
	}

	@Override
	public int updateTownLikes(int townNo) {
		return cDao.updateTownLikes(sqlSession, townNo);
	}

	@Override
	public int updateTownStar(int townNo, int userNo) {
		return cDao.updateTownStar(sqlSession, townNo, userNo);
	}

	@Override
	public ArrayList<TownStar> isMyTown(int userNo) {
		return cDao.isMyTown(sqlSession, userNo);
	}

	@Override
	public Town selectMyBestTown(String userNickname) {
		return cDao.selectMyBestTown(sqlSession, userNickname);
	}

	@Override
	public ArrayList<Town> selectTownStarList(int userNo) {
		return cDao.selectTownStarList(sqlSession, userNo);
	}

	@Override
	public int selectMyStarCount(String userNickname) {
		return cDao.selectMyStarCount(sqlSession, userNickname);
	}

	@Override
	public int insertTown(Town t) {
		return cDao.insertTown(sqlSession, t);
	}
	
	
}
