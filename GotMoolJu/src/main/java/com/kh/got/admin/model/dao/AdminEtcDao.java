package com.kh.got.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.etc.model.vo.Improvement;

@Repository
public class AdminEtcDao {

	// 개선사항 3개 정도 조회용
	public ArrayList<Improvement> adminImprovementMiniList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("etcMapper.adminImprovementMiniList");
	}

}
