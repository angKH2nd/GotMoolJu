package com.kh.got.etc.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.got.etc.model.service.EtcService;
import com.kh.got.etc.model.vo.Improvement;

@Controller
public class EtcController {

	@Autowired
	private EtcService eService;
	
	@ResponseBody
	@RequestMapping(value="impList.etc", produces = "application/json; charset=utf-8")
	public String selectImpReplyList() {
		return new Gson().toJson(eService.selectImpReplyList());
	}
	
}
