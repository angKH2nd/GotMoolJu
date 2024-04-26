package com.kh.got.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.common.model.vo.MapVO;

@Repository
public class MapDao {
	
	public ArrayList<MapVO> selectAllList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("mapMapper.selectAllList");
	}
	
	public String countJachi(SqlSessionTemplate sqlSession, String jachi) {
		return sqlSession.selectOne("mapMapper.countJachi", jachi);
	}
	
	public ArrayList<MapVO> detailAptCount(SqlSessionTemplate sqlSession, String minX, String minY, String maxX, String maxY){
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("minX", minX);
		searchMap.put("minY", minY);
		searchMap.put("maxX", maxX);
		searchMap.put("maxY", maxY);
		
		return (ArrayList)sqlSession.selectList("mapMapper.detailAptCount", searchMap);
	}
	
	public ArrayList<MapVO> detailApt(SqlSessionTemplate sqlSession, String aptName, String aptLocation){
		Map<String, String> detailApt = new HashMap<>();
		detailApt.put("aptName", aptName);
		detailApt.put("aptLocation", aptLocation);
		
		return (ArrayList)sqlSession.selectList("mapMapper.detailApt", detailApt);
	}
	
	public String countDong(SqlSessionTemplate sqlSession, String dong) {
		return sqlSession.selectOne("mapMapper.countDong", dong);
	}

	public MapVO selectAptDetail(SqlSessionTemplate sqlSession, String aptNo) {
		return sqlSession.selectOne("mapMapper.selectAptDetail", aptNo);
	}

	public int selectAptCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mapMapper.selectAptCount");
	}

	public ArrayList<MapVO> selectTopAptList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("mapMapper.selectTopAptList");
	}

	public ArrayList<MapVO> selectTopPrice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mapMapper.selectTopPrice");
	}

	public ArrayList<MapVO> selectDibsList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("mapMapper.selectDibsList", userNo);
	}
	
	public ArrayList<MapVO> searchEx(SqlSessionTemplate sqlSession, String searchType, String searchInput){
		
		if(searchType.equals("apt")) {
			return (ArrayList)sqlSession.selectList("mapMapper.searchExApt", searchInput);
			
		}else {
			
			return (ArrayList)sqlSession.selectList("mapMapper.searchExAddress", searchInput);
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

