package com.kh.got.announcement.model.service;

import java.util.ArrayList;

import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;

public interface AnnouncementService {


	//게시판 리스트 (패이징)
	int selectListCount();
	ArrayList<Announcement> selectList(PageInfo pi);
	
	//게시판 작성 
	int insertAnnouncement(Announcement a);
	
	//게시글 상세조회
	int increaseCount(int announcementNo);
	Announcement selectAnnouncement(int announcementNo);
	
	//게시글 삭제
	int deleteAnnouncement(int announcementNo);
	
	//게시글 수정
	int updateAnnouncement(Announcement a);
}
