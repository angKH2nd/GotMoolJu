package com.kh.got.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.common.model.vo.MapVO;

@Repository
public class MapDao {
	
	public ArrayList<MapVO> selectAllList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("mapMapper.selectAllList");
		
	}
	
	

}
