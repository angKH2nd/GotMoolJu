package com.kh.got.faq.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.got.faq.model.vo.Faq;

@Repository
public class FaqDao {
	
	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("faqMapper.selectFaqList");
	}

}
