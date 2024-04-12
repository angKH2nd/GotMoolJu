package com.kh.got.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.got.common.model.service.MapServiceImpl;
import com.kh.got.common.model.vo.MapVO;

@Controller
public class MapController {
	
	@Autowired
	private MapServiceImpl mService;
	
	@RequestMapping(value="select.ma", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectAllList() {
		
		ArrayList<MapVO> list = mService.selectAllList();
		
		return new Gson().toJson(list);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
