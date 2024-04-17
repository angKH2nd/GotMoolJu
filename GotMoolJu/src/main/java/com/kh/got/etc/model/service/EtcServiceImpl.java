package com.kh.got.etc.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.etc.model.dao.EtcDao;
import com.kh.got.etc.model.vo.ImpChoose;
import com.kh.got.etc.model.vo.Improvement;

@Service
public class EtcServiceImpl implements EtcService {

	@Autowired
	private EtcDao eDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<ImpChoose> selectImpChooseList(int impChooseUserNo) {
		return eDao.selectImpChooseList(sqlSession, impChooseUserNo);
	}
	
	@Override
	public ArrayList<Improvement> selectImpReplyList() {
		return eDao.selectImpReplyList(sqlSession);
	}

	@Override
	public int deleteImpReply(int impReplyNo) {
		return eDao.deleteImpReply(sqlSession, impReplyNo);
	}

	@Override
	public int updateImpReply(int impReplyNo, String impReplyContent) {
		return eDao.updateImpReply(sqlSession, impReplyNo, impReplyContent);
	}

	@Override
	public int deleteImpChooseList(ImpChoose impChoose) {
		return eDao.deleteImpChooseList(sqlSession, impChoose);
	}

	@Override
	public int updateImpChooseList(ImpChoose impChoose) {
		return eDao.updateImpChooseList(sqlSession, impChoose);
	}

	@Override
	public int insertImpChooseList(ImpChoose impChoose) {
		return eDao.insertImpChooseList(sqlSession, impChoose);
	}

	@Override
	public int insertImpReply(Improvement imp) {
		return eDao.insertImpReply(sqlSession, imp);
	}
	
	
}
