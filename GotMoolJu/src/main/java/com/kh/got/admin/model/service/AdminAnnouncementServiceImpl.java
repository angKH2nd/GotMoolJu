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
	
	// 공지사항 조회수	
	@Override
	public int adminAnnouncementIncreaseCount(int announcementNo) {
		return adminADao.adminAnnouncementIncreaseCount(sqlSession, announcementNo);
	}
	

	// 공지사항 삭제
	@Override
	public int adminAnnouncementDelete(int announcementNo) {
		return adminADao.adminAnnouncementDelete(sqlSession, announcementNo);
	}

	// 공지사항 복구
	@Override
	public int adminAnnouncementRevive(int announcementNo) {
		return adminADao.adminAnnouncementRevive(sqlSession, announcementNo);
	}

	// 공지사항 등록
	@Override
	public int adminAnnouncementEnroll(Announcement adminA) {
		return adminADao.adminAnnouncementEnroll(sqlSession, adminA);
	}

	
	
	
	
	
}
