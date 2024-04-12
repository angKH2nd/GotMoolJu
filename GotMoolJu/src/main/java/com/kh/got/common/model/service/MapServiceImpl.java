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

}
