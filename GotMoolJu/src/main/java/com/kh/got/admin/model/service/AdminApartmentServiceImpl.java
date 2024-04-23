package com.kh.got.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.admin.model.dao.AdminApartmentDao;

@Service
public class AdminApartmentServiceImpl implements AdminApartmentService{

	@Autowired
	private AdminApartmentDao adminAptDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//@Override
	
	
}
