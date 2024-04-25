package com.kh.got.etc.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
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
		String newChoose = "";
		
		if(impReplyChoose == 1) {
			newChoose = "2";
		}else {
			newChoose = "1";
		}
		
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
	
	@ResponseBody
	@RequestMapping(value="insertImpReply.etc")
	public int insertImpReply(@RequestParam("impReplyContent") String impReplyContent, @RequestParam("impReplyType") String impReplyType, HttpSession session) {
		String realType = "";
		if(impReplyType.equals("O")) {
			realType = "S";
		}else {
			realType = "O";
		}
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Improvement imp = new Improvement(); 
		imp.setImpReplyContent(impReplyContent);
		imp.setImpReplyWriter(loginUser.getUserNickname());
		imp.setImpReplyProfile(loginUser.getUserUpdateName());
		imp.setImpReplyType(realType);
		
		int result = eService.insertImpReply(imp); 
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "tax.et", produces = "application/json; charset=utf-8")
	public String taxCalculate(String realEstateType, String areaType, String own ,String amount) throws IOException {
		
		String url = "https://calcapi.fran.kr/v1/acquisition?clientID=tkfkaksek97&clientSecret=3a00E884A2998975f9f1fD67b738D84fb2";
		
		url += "&realEstateType=" + realEstateType;
		url += "&areaType=" + areaType;
		url += "&own=" + own;
		url += "&amount=" + amount;
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();

		System.out.println(responseText);
		
		return responseText;
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
