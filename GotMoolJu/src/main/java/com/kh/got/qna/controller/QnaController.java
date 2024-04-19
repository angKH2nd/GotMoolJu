package com.kh.got.qna.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.got.qna.model.service.QnaServiceImpl;
import com.kh.got.qna.model.vo.Qna;

@Controller
public class QnaController {
    
@Autowired    
private QnaServiceImpl qService;
    
@ResponseBody
@RequestMapping(value = "list.qna", produces = "application/json; charset=utf-8")
public String selectList() {
	    ArrayList<Qna> list = qService.selectQnaList();
	    
	    // set format we need
	    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	
	    return gson.toJson(list); 
	}

@ResponseBody
@RequestMapping(value = "detail.qna", produces= "application/json; charset=utf-8")
public String selectQna(@RequestParam("qno") int qno) {
	
		Qna q = qService.selectQna(qno);
		//System.out.println(q);
		return new Gson().toJson(q);

	}
}

