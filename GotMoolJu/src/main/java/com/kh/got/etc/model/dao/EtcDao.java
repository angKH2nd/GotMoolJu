package com.kh.got.etc.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.etc.model.vo.Improvement;

@Repository
public class EtcDao {

	public ArrayList<Improvement> selectImpReplyList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("etcMapper.selectImpReplyList");
	}

	
	
}
