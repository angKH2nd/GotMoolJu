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
	
	
	
	
	
	
	
	

}
