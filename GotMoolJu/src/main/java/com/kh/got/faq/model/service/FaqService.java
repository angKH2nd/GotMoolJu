package com.kh.got.faq.model.service;

import java.util.ArrayList;

import com.kh.got.faq.model.vo.Faq;

public interface FaqService {
	
	//ttl faq 구하기
	ArrayList<Faq> selectFaqList();
	

}
