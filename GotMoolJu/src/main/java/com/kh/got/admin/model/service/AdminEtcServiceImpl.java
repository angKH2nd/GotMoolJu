package com.kh.got.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.admin.model.dao.AdminEtcDao;
import com.kh.got.etc.model.vo.Improvement;

@Service
public class AdminEtcServiceImpl implements AdminEtcService {
	
	@Autowired
	private AdminEtcDao adminEDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 개선사항 3개 정도 조회용
	@Override
	public ArrayList<Improvement> adminImprovementMiniList() {
		return adminEDao.adminImprovementMiniList(sqlSession);
	}
	


}
