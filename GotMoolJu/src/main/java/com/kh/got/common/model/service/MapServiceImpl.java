package com.kh.got.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.common.model.dao.MapDao;
import com.kh.got.common.model.vo.MapVO;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<MapVO> selectAllList() {
		return mDao.selectAllList(sqlSession);
	}

	@Override
	public String countJachi(String jachi) {
		return mDao.countJachi(sqlSession, jachi);
	}


	@Override
	public ArrayList<MapVO> detailAptCount(String minX, String minY, String maxX, String maxY) {
		
		return mDao.detailAptCount(sqlSession, minX, minY, maxX, maxY);
	}

	@Override
	public ArrayList<MapVO> detailApt(String aptName, String aptLocation) {

		return mDao.detailApt(sqlSession, aptName, aptLocation);
	}

	@Override
	public String countDong(String dong) {
		
		return mDao.countDong(sqlSession, dong);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
