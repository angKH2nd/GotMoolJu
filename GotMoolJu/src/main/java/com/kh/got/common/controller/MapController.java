package com.kh.got.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.got.common.model.service.MapServiceImpl;
import com.kh.got.common.model.vo.MapVO;
import com.kh.got.member.model.vo.Member;

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
		// System.out.println(aptName);
		// System.out.println(aptLocation);
		
		ArrayList<MapVO> list = mService.detailApt(aptName, aptLocation);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "selectAptDetail.ma", produces = "application/json; charset=utf-8")
	public String selectAptDetail(String aptNo, HttpServletRequest request) {
		
		return new Gson().toJson(mService.selectAptDetail(aptNo));
	}
	
	@ResponseBody
	@RequestMapping(value = "rank.do", produces = "application/json; charset=utf-8")
	public String selectTopAptList() {
		
		ArrayList<MapVO> list = mService.selectTopAptList();
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rank2.do", produces = "application/json; charset=utf-8")
	public String selectTopPrice() {
		ArrayList<MapVO> list = mService.selectTopPrice();
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="selectDibsList.ma", produces="application/json; charset=utf-8")
	public String selectDibsList(HttpSession session) {
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		ArrayList<MapVO> list = mService.selectDibsList(userNo);

		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value ="searchEx.ma" , produces = "application/json; charset=utf-8")
	public String searchEx(String searchType, String searchInput) {
		
		ArrayList<MapVO> list = mService.searchEx(searchType, searchInput);
		
		return new Gson().toJson(list);
		
	}
	
	@RequestMapping("searchCountUp.ma")
	@ResponseBody
	public String searchCountUp(String aptName) {
		
		int result = mService.searchCountUp(aptName);
		
		if(result > 0) { // 성공
			return "NNNNY";
		}else { // 실패
			return "NNNNN";
		}
		
		
	}
	
	@RequestMapping(value = "popularTitle.ap", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String popularTitle() {
		
		ArrayList<MapVO> list = mService.popularTitle();
		
		return new Gson().toJson(list);
		
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value ="searchEx.ma" , produces = "application/json; charset=utf-8")
	public String searchEx(String searchType, String searchInput) {
		
		ArrayList<MapVO> list = mService.searchEx(searchType, searchInput);
		
		return new Gson().toJson(list);
		
	}
	
	@RequestMapping("searchCountUp.ma")
	@ResponseBody
	public String searchCountUp(String aptName) {
		
		int result = mService.searchCountUp(aptName);
		
		if(result > 0) { // 성공
			return "NNNNY";
		}else { // 실패
			return "NNNNN";
		}
		
		
	}
	
	@RequestMapping(value = "popularTitle.ap", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String popularTitle() {
		
		ArrayList<MapVO> list = mService.popularTitle();
		
		return new Gson().toJson(list);
		
	}
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="selectHotList.ma", produces="application/json; charset=utf-8")
	public String selectHotAptList() {
		ArrayList<MapVO> list = mService.selectHotAptList();
		
		return new Gson().toJson(list);
	}
	
}
