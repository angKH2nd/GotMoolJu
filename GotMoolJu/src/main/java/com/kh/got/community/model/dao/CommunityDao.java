package com.kh.got.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.community.model.vo.Town;
import com.kh.got.community.model.vo.TownStar;

@Repository
public class CommunityDao {

	public ArrayList<Town> selectTownList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectTownList");
	}

	public int updateTownLikes(SqlSessionTemplate sqlSession, int townNo) {
		return sqlSession.update("communityMapper.updateTownLikes", townNo);
	}

	public int updateTownStar(SqlSessionTemplate sqlSession, int townNo, int userNo) {
		Map<String, Object> updateTownStarParameters = new HashMap<>();
		updateTownStarParameters.put("townNo", townNo);
		updateTownStarParameters.put("userNo", userNo);
		
		int result = sqlSession.selectOne("communityMapper.isTownStar", updateTownStarParameters);
		
		if(result == 1) {
			result = sqlSession.delete("communityMapper.deleteTownStar", updateTownStarParameters);
			if(result > 0) {
				sqlSession.update("communityMapper.decreaseTownStar", townNo);
			}
			return result;
		}else if(result == 0){
			result = sqlSession.insert("communityMapper.insertTownStar", updateTownStarParameters);
			if(result > 0) {
				sqlSession.update("communityMapper.increaseTownStar", townNo);
			}
			return result;
		}else {
			return result; 
		}
	}

	public ArrayList<TownStar> isMyTown(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("communityMapper.isMyTown", userNo);
	}

	public Town selectMyBestTown(SqlSessionTemplate sqlSession, String userNickname) {
		return sqlSession.selectOne("communityMapper.selectMyBestTown", userNickname);
	}

	public ArrayList<Town> selectTownStarList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectTownStarList", userNo);
	}

	public int selectMyStarCount(SqlSessionTemplate sqlSession, String userNickname) {
		int result = 0;
		if(sqlSession.selectOne("communityMapper.selectMyStarCount", userNickname) != null) {
			result = sqlSession.selectOne("communityMapper.selectMyStarCount", userNickname);
		}
		return result;
	}

	public int insertTown(SqlSessionTemplate sqlSession, Town t) {
		return sqlSession.insert("communityMapper.insertTown", t);
	}
	
	

}
