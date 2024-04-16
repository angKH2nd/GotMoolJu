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
import com.kh.got.etc.model.vo.ImpChoose;
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
	
	@ResponseBody
	@RequestMapping(value="updateImpReplyChoose.etc")
	public int updateImpReplyChoose(@RequestParam("impReplyNo") int impReplyNo, @RequestParam("impReplyChoose") int impReplyChoose, HttpSession session) {
		int result = 0;
		int loginUserNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		String newChoose = impReplyChoose == 1 ? "2" : "1";
		
		ArrayList<ImpChoose> myChooselist = eService.selectImpChooseList(loginUserNo);
		
		for(int i = 0; i < myChooselist.size(); i++) {
			if(myChooselist.get(i).getImpChooseReplyNo() == impReplyNo) { // 기존에 좋아요 싫어요 택했던 게시글인 경우
				if(myChooselist.get(i).getImpChooseStatus().equals(String.valueOf(impReplyChoose))) { // 기존과 동일한 것을 누른 경우
					// 기존 내용을 삭제(delete)
					result = eService.deleteImpChooseList(new ImpChoose(loginUserNo, impReplyNo, String.valueOf(impReplyChoose)));
				}else { // 기존과 다른 것을 누른 경우
					// 기존 내용을 변경(update)
					result = eService.updateImpChooseList(new ImpChoose(loginUserNo, impReplyNo, newChoose));
				}
			}else { // 좋아요 싫어요 선택한적 없던 게시글인 경우
				// (insert)
				result = eService.insertImpChooseList(new ImpChoose(loginUserNo, impReplyNo, String.valueOf(impReplyChoose)));
			}
		}
		
		return result;
	}
	
	
}
