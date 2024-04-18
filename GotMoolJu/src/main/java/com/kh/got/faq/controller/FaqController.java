package com.kh.got.faq.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.got.faq.model.service.FaqService;
import com.kh.got.faq.model.service.FaqServiceImpl;
import com.kh.got.faq.model.vo.Faq;

@Controller
public class FaqController {

	@Autowired
	private FaqServiceImpl fService;	
	
	@ResponseBody
	@RequestMapping(value = "list.faq", produces = "application/json; charset = utf-8")
	public String selectList() {
		ArrayList<Faq> list = fService.selectFaqList();
		return new Gson().toJson(list);
	}	
}
