package com.kh.got.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.admin.model.dao.AdminApartmentDao;
import com.kh.got.common.model.vo.MapVO;
import com.kh.got.common.model.vo.PageInfo;

@Service
public class AdminApartmentServiceImpl implements AdminApartmentService{

	@Autowired
	private AdminApartmentDao adminAptDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 아파트 전체 조회
	@Override
	public ArrayList<MapVO> selectAdminAptList(PageInfo adminPi) {
		return adminAptDao.selectAdminAptList(sqlSession, adminPi);
	}

	@Override
	public int deleteAdminApt(int aptNo) {
		return adminAptDao.deleteAdminApt(sqlSession, aptNo);
	}

	// 아파트 미니 리스트
	@Override
	public ArrayList<MapVO> adminAptMiniList() {
		return adminAptDao.adminAptMiniList(sqlSession);
	}

	// 아파트 디테일
	@Override
	public MapVO detailAdminApt(int aptNo) {
		return adminAptDao.detailAdminApt(sqlSession, aptNo);
	}

	
	
	
}
