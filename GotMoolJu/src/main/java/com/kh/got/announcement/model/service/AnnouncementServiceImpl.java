package com.kh.got.announcement.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.announcement.model.dao.AnnouncementDao;
import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;

@Service
public class AnnouncementServiceImpl implements AnnouncementService{
	
	@Autowired
	private AnnouncementDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Announcement> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertAnnouncement(Announcement a) {
		return aDao.insertAnnouncement(sqlSession, a);
	}

	@Override
	public int increaseCount(int announcementNo) {
		return 0;
	}

	@Override
	public Announcement selectAnnouncement(int announcementNo) {
		return null;
	}

	@Override
	public int deleteAnnouncement(int announcementNo) {
		return 0;
	}

	@Override
	public int updateAnnouncement(Announcement a) {
		return 0;
	}

}
