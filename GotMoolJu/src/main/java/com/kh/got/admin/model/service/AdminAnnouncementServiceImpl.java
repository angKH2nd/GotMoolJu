package com.kh.got.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.admin.model.dao.AdminAnnouncementDao;
import com.kh.got.admin.model.dao.AdminMemberDao;

@Service
public class AdminAnnouncementServiceImpl implements AdminAnnouncementService {

	@Autowired
	private AdminAnnouncementDao adminADao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
