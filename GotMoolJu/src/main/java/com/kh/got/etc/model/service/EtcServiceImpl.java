package com.kh.got.etc.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.etc.model.dao.EtcDao;
import com.kh.got.etc.model.vo.Improvement;

@Service
public class EtcServiceImpl implements EtcService {

	@Autowired
	private EtcDao eDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Improvement> selectImpReplyList() {
		return eDao.selectImpReplyList(sqlSession);
	}

	
	
}
