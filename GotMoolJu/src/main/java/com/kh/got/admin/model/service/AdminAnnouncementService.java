package com.kh.got.admin.model.service;

import java.util.ArrayList;

import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;

public interface AdminAnnouncementService {

	// 메인 화면, 공지글 5개 정도 조회용
	ArrayList<Announcement> selectAnnouncementMiniList();

	// 공지사항 전체 리스트 
	int selectAnnouncementCount();								 // 총 공지사항 개수
	ArrayList<Announcement> selectAnnouncementList(PageInfo adminPi); // 전체 공지사항

	// 공지사항 디테일
	Announcement selectAnnouncementDetail(int announcementNo);
	

	
	
	
}
