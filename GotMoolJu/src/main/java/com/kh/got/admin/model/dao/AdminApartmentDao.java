package com.kh.got.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.common.model.vo.MapVO;
import com.kh.got.common.model.vo.PageInfo;

@Repository
public class AdminApartmentDao {

	// 공지사항 전체 조회용
	public ArrayList<MapVO> selectAdminAptList(SqlSessionTemplate sqlSession, PageInfo adminPi) {
		int offset = (adminPi.getCurrentPage() - 1) * adminPi.getBoardLimit();
		int limit = adminPi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mapMapper.selectAdminAptList", null, rowBounds);
	}

	public int deleteAdminApt(SqlSessionTemplate sqlSession, int aptNo) {
		return sqlSession.update("mapMapper.deleteAdminApt", aptNo);
	}

	// 미니 리스트
	public ArrayList<MapVO> adminAptMiniList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("mapMapper.adminAptMiniList");
	}
	
}
