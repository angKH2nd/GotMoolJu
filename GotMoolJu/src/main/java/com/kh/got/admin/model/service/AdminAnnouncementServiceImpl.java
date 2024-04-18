package com.kh.got.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.admin.model.dao.AdminAnnouncementDao;
import com.kh.got.admin.model.dao.AdminMemberDao;
import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;

@Service
public class AdminAnnouncementServiceImpl implements AdminAnnouncementService {

	@Autowired
	private AdminAnnouncementDao adminADao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 메인 화면, 공지글 5개 정도 조회용
	@Override
	public ArrayList<Announcement> selectAnnouncementMiniList() {
		return adminADao.selectAnnouncementMiniList(sqlSession);
	}

	// 공지사항 전체 리스트 개수 / count
	@Override
	public int selectAnnouncementCount() {
		return adminADao.selectAnnouncementCount(sqlSession);
	}

	// 공지사항 전체 리스트
	@Override
	public ArrayList<Announcement> selectAnnouncementList(PageInfo adminPi) {
		return adminADao.selectAnnouncementList(sqlSession, adminPi);
	}

	// 공지사항 디테일
	@Override
	public Announcement selectAnnouncementDetail(int announcementNo) {
		return adminADao.selectAnnouncementDetail(sqlSession, announcementNo);
	}
	
	
	
	
}
