package com.kh.got.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.community.model.vo.Town;

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
			return result = sqlSession.delete("communityMapper.deleteTownStar", updateTownStarParameters);
		}else if(result == 0){
			return result = sqlSession.insert("communityMapper.insertTownStar", updateTownStarParameters);
		}else {
			return result; 
		}
	}
	
	

}
