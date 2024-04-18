package com.kh.got.community.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.got.community.model.service.CommunityService;
import com.kh.got.member.model.vo.Member;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;
	
	@ResponseBody
	@RequestMapping(value="townList.cm", produces = "application/json; charset=utf-8")
	public String selectTownList(HttpSession session) {
		JSONObject jObj = new JSONObject();
		jObj.put("townList", new Gson().toJson(cService.selectTownList()));
		// jObj.put("myTown", new Gson().toJson(cService.selectTownList(((Member)session.getAttribute("loginUser")).getUserNo())));
		
		return jObj.toJSONString();
	}
	
}
