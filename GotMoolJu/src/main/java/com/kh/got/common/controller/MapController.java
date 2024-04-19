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
	public String selectAllList(String north, String east, String south, String west, String centerLat, String centerLng) {

		
		ArrayList<MapVO> list = mService.selectAllList();
		
		return new Gson().toJson(list);
		
	}
	
	@RequestMapping(value="countJachi.ma")
	@ResponseBody
	public String countJachi(String jachi) {
		
		String count = mService.countJachi(jachi);
		
		
		return count;
		
	}
	
	@RequestMapping(value="countDong.ma")
	@ResponseBody
	public String countDong(String dong) {
		
		String count = mService.countDong(dong);
		
		
		return count;
		
	}
	
	@RequestMapping(value = "detailAptCount.ma", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String detailAptCount(String minX, String minY, String maxX, String maxY) {
		
		ArrayList<MapVO> list = mService.detailAptCount(minX, minY, maxX, maxY);
		
			
		return new Gson().toJson(list);
		
	}
	
	@RequestMapping(value = "detailApt.ma", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String detailApt(String aptName, String aptLocation) {
		System.out.println(aptName);
		System.out.println(aptLocation);
		
		ArrayList<MapVO> list = mService.detailApt(aptName, aptLocation);
		
		
		return new Gson().toJson(list);
		
	}
	
	
	
	
	
	
	
	
	
	

}
