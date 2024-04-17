package com.kh.got.etc.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.etc.model.vo.ImpChoose;
import com.kh.got.etc.model.vo.Improvement;

@Repository
public class EtcDao {

	public ArrayList<Improvement> selectImpReplyList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("etcMapper.selectImpReplyList");
	}

	public int deleteImpReply(SqlSessionTemplate sqlSession, int impReplyNo) {
		return sqlSession.update("etcMapper.deleteImpReply", impReplyNo);
	}

	public int updateImpReply(SqlSessionTemplate sqlSession, int impReplyNo, String impReplyContent) {
		Map<String, Object> updateImpReplyParameters = new HashMap<>();
		updateImpReplyParameters.put("impReplyNo", impReplyNo);
		updateImpReplyParameters.put("impReplyContent", impReplyContent);
		
		return sqlSession.update("etcMapper.updateImpReply", updateImpReplyParameters);
	}

	public ArrayList<ImpChoose> selectImpChooseList(SqlSessionTemplate sqlSession, int impChooseUserNo) {
		return (ArrayList)sqlSession.selectList("etcMapper.selectImpChooseList", impChooseUserNo);
	}

	public int deleteImpChooseList(SqlSessionTemplate sqlSession, ImpChoose impChoose) {
		return sqlSession.delete("etcMapper.deleteImpChooseList", impChoose);
	}

	public int updateImpChooseList(SqlSessionTemplate sqlSession, ImpChoose impChoose) {
		return sqlSession.update("etcMapper.updateImpChooseList", impChoose);
	}

	public int insertImpChooseList(SqlSessionTemplate sqlSession, ImpChoose impChoose) {
		return sqlSession.insert("etcMapper.insertImpChooseList", impChoose);
	}

	public int insertImpReply(SqlSessionTemplate sqlSession, Improvement imp) {
		return sqlSession.insert("etcMapper.insertImpReply", imp);
	}
	
}
