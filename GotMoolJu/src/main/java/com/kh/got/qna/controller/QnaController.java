package com.kh.got.qna.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.got.common.model.vo.PageInfo;
import com.kh.got.common.template.Pagination;
import com.kh.got.qna.model.service.QnaServiceImpl;
import com.kh.got.qna.model.vo.Qna;

@Controller
public class QnaController {
    
@Autowired    
private QnaServiceImpl qService;
    
@ResponseBody
@RequestMapping(value = "list.qna", produces = "application/json; charset=utf-8")
public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage) {
	int listCount = qService.selectListCount();// total qna list 구하기    
	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 3, 3);
	ArrayList<Qna> list = qService.selectQnaList(pi);
	
	Map<String, Object> resultMap = new HashMap<>();
	resultMap.put("qnaList", list);
	resultMap.put("qnaPageInfo", pi);
	    
	    // set format we need
	    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	
	    return gson.toJson(resultMap); 
	}

@ResponseBody
@RequestMapping(value = "detail.qna", produces= "application/json; charset=utf-8")
public String selectQna(@RequestParam("qno") int qno) {
	
		Qna q = qService.selectQna(qno);
		//System.out.println(q);
		return new Gson().toJson(q);

	}

@ResponseBody
@RequestMapping(value = "delete.qna")
public int deleteQna(@RequestParam("qno") int qno) {
    int result = qService.deleteQna(qno);
    return result;
        
    }


@ResponseBody
@RequestMapping(value = "update.qna")
public String updateQna(@RequestParam("qno") int qno, @RequestParam ("Qna q")Qna q) {
   
	return new Gson().toJson(q);
    }
}

