package com.kh.got.announcement.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.announcement.model.vo.Announcement;
import com.kh.got.common.model.vo.PageInfo;

@Repository
public class AnnouncementDao {
		
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("announcementMapper.selectListCount");
		}

	public ArrayList<Announcement> selectList(SqlSessionTemplate sqlSession,PageInfo pi){
			
		int offset = (pi.getCurrentPage()- 1)* pi.getBoardLimit();//how many pages it be seen 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("announcementMapper.selectList", null, rowBounds);
	
	}
	
	public int insertAnnouncement(SqlSessionTemplate sqlSession, Announcement a) {
		return sqlSession.insert("announcementMapper.insertAnnouncement", a);
	}

}
