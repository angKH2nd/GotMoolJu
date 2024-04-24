package com.kh.got.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.kh.got.community.model.dao.CommunityDao;
import com.kh.got.community.model.vo.Town;
import com.kh.got.community.model.vo.TownReply;
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

	@Override
	public int increaseTownClick(int townNo) {
		return cDao.increaseTownClick(sqlSession, townNo);
	}

	@Override
	public boolean isMyStarTown(int userNo, int townNo) {
		return cDao.isMyStarTown(sqlSession, userNo, townNo);
	}

	@Override
	public Town selectTownDetail(int townNo) {
		return cDao.selectTownDetail(sqlSession, townNo);
	}

	@Override
	public ArrayList<TownReply> selectTownReplyList(int townNo) {
		return cDao.selectTownReplyList(sqlSession, townNo);
	}

	@Override
	public int insertTownReply(TownReply tr) {
		return cDao.insertTownReply(sqlSession, tr);
	}

	@Override
	public Town selectBestTownPicture() {
		return cDao.selectBestTownPicture(sqlSession);
	}

	@Override
	public int decreaseTownClick(int townNo) {
		return cDao.decreaseTownClick(sqlSession, townNo);
	}

	@Override
	public int deleteTown(int townNo) {
		return cDao.deleteTown(sqlSession, townNo);
	}

	@Override
	public int updateTown(Town t) {
		return cDao.updateTown(sqlSession, t);
	}

	@Override
	public ArrayList<Town> selectTownHotList() {
		return cDao.selectTownHotList(sqlSession);
	}

	@Override
	public ArrayList<Town> selectTownRankCount() {
		return cDao.selectTownRankCount(sqlSession);
	}
	
	
}
