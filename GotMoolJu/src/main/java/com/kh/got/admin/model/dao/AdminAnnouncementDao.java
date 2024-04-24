package com.kh.got.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;

@Repository
public class AdminAnnouncementDao {

	// 메인 화면, 공지글 5개 정도 조회용
	public ArrayList<Announcement> adminSelectAnnouncementMiniList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("announcementMapper.adminSelectAnnouncementMiniList");
	}

	// 공지사항 전체 리스트 개수
	public int adminSelectAnnouncementCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("announcementMapper.adminSelectAnnouncementCount");
	}

	// 공지사항 전체 리스트 
	public ArrayList<Announcement> adminSelectAnnouncementList(SqlSessionTemplate sqlSession, PageInfo adminPi) {
	
		int offset = (adminPi.getCurrentPage() - 1) * adminPi.getBoardLimit();
		int limit = adminPi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList) sqlSession.selectList("announcementMapper.adminSelectAnnouncementList", null, rowBounds);
	}
	
	// 공지사항 디테일
	public Announcement adminAnnouncementselectDetail(SqlSessionTemplate sqlSession, int announcementNo) {
		return sqlSession.selectOne("announcementMapper.adminAnnouncementselectDetail", announcementNo);
	}
	
	// 공지사항 조회수
	public int adminAnnouncementIncreaseCount(SqlSessionTemplate sqlSession, int announcementNo) {
		return sqlSession.update("announcementMapper.adminAnnouncementIncreaseCount", announcementNo);
	}

	// 공지사항 삭제
	public int adminAnnouncementDelete(SqlSessionTemplate sqlSession, int announcementNo) {
		return sqlSession.update("announcementMapper.adminAnnouncementDelete", announcementNo);
	}

	// 공지사항 복구
	public int adminAnnouncementRevive(SqlSessionTemplate sqlSession, int announcementNo) {
		return sqlSession.update("announcementMapper.adminAnnouncementRevive", announcementNo);
	}

	// 공지사항 등록
	public int adminAnnouncementEnroll(SqlSessionTemplate sqlSession, Announcement adminA) {
		return sqlSession.insert("announcementMapper.adminAnnouncementEnroll", adminA);
	}

	// 공지사항 수정
	public int adminAnnouncementupdate(SqlSessionTemplate sqlSession, Announcement adminA) {
		return sqlSession.update("announcementMapper.adminAnnouncementupdate", adminA);
	}



	
	
	
	
	
	
	
	
	
	
	

}
