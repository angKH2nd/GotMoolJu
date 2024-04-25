package com.kh.got.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.admin.model.dao.AdminEtcDao;
import com.kh.got.common.model.vo.MapVO;
import com.kh.got.common.model.vo.PageInfo;
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

	// 개선사항 전체 갯수 조회용
	@Override
	public int selectImpCount() {
		return adminEDao.selectImpCount(sqlSession);
	}

	// 개선사항 전체 조회용
	@Override
	public ArrayList<MapVO> selectAdminImpList(PageInfo adminPi) {
		return adminEDao.selectAdminImpList(sqlSession, adminPi);
	}

	// 개선사항 삭제용
	@Override
	public int deleteAdminImp(int impNo) {
		return adminEDao.deleteAdminImp(sqlSession, impNo);
	}
	


}
