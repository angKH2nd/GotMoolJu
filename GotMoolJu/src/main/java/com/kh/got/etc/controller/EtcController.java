package com.kh.got.etc.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.got.etc.model.service.EtcService;
import com.kh.got.etc.model.vo.Improvement;
import com.kh.got.member.model.vo.Member;

@Controller
public class EtcController {

	@Autowired
	private EtcService eService;
	
	@ResponseBody
	@RequestMapping(value="impList.etc", produces = "application/json; charset=utf-8")
	public String selectImpReplyList(HttpSession session) {
		JSONObject jObj = new JSONObject();
		jObj.put("impList", new Gson().toJson(eService.selectImpReplyList()));
		jObj.put("myImp", new Gson().toJson(eService.selectImpChooseList(((Member)session.getAttribute("loginUser")).getUserNo())));
		
		return jObj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="deleteImpList.etc")
	public int deleteImpReply(@RequestParam("impReplyNo") int impReplyNo) {
		return eService.deleteImpReply(impReplyNo);
	}
	
	@ResponseBody
	@RequestMapping(value="updateImpList.etc")
	public int updateImpReply(@RequestParam("impReplyNo") int impReplyNo, @RequestParam("impReplyContent") String impReplyContent) {
		return eService.updateImpReply(impReplyNo, impReplyContent);
	}
	
}
