package com.kh.got.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.common.model.vo.MapVO;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.etc.model.vo.Improvement;

@Repository
public class AdminEtcDao {

	// 개선사항 3개 정도 조회용
	public ArrayList<Improvement> adminImprovementMiniList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("etcMapper.adminImprovementMiniList");
	}

	// 개선사항 전체 개수 조회용
	public int selectImpCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("etcMapper.selectImpCount");
	}

	// 개선사항 전체 조회용
	public ArrayList<MapVO> selectAdminImpList(SqlSessionTemplate sqlSession, PageInfo adminPi) {
		int offset = (adminPi.getCurrentPage() - 1) * adminPi.getBoardLimit();
		int limit = adminPi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("etcMapper.selectAdminImpList", null, rowBounds);
	}

	public int deleteAdminImp(SqlSessionTemplate sqlSession, int impNo) {
		return sqlSession.update("etcMapper.deleteAdminImp", impNo);
	}

}
