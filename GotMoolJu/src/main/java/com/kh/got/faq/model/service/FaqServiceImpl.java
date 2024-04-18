package com.kh.got.faq.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.got.faq.model.dao.FaqDao;
import com.kh.got.faq.model.vo.Faq;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Faq> selectFaqList() {
		return fDao.selectFaqList(sqlSession);
	}
	
	
}
