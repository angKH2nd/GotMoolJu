package com.kh.got.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.got.common.template.UploadFile;
import com.kh.got.community.model.service.CommunityService;
import com.kh.got.community.model.vo.Town;
import com.kh.got.community.model.vo.TownReply;
import com.kh.got.member.model.vo.Member;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;
	
	@ResponseBody
	@RequestMapping(value="townList.cm", produces = "application/json; charset=utf-8")
	public String selectTownList(HttpSession session) {
		Member loginUser = null;
		JSONObject jObj = new JSONObject();
		
		if((Member)session.getAttribute("loginUser") != null) {
			loginUser = (Member)session.getAttribute("loginUser");
			jObj.put("myTownStarList", new Gson().toJson(cService.isMyTown(loginUser.getUserNo())));
		}
		jObj.put("townList", new Gson().toJson(cService.selectTownList()));
		
		return jObj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="updateTownLikes.cm")
	public int updateTownLikes(@RequestParam("townNo") int townNo) {
		return cService.updateTownLikes(townNo);
	}
	
	@ResponseBody
	@RequestMapping(value="updateTownStar.cm")
	public int updateTownStar(@RequestParam("townNo") int townNo, HttpSession session) {
		return cService.updateTownStar(townNo, ((Member)session.getAttribute("loginUser")).getUserNo());
	}
	
	@ResponseBody
	@RequestMapping(value="selectMyBestTown.cm")
	public Town selectMyBestTown(HttpSession session) {
		return cService.selectMyBestTown(((Member)session.getAttribute("loginUser")).getUserNickname());
	}
	
	@ResponseBody
	@RequestMapping(value="townStarList.cm", produces = "application/json; charset=utf-8")
	public String selectStarTownList(HttpSession session) {
		Member loginUser = null;
		JSONObject jObj = new JSONObject();
		
		if((Member)session.getAttribute("loginUser") != null) {
			loginUser = (Member)session.getAttribute("loginUser");
			jObj.put("myTownStarList", new Gson().toJson(cService.isMyTown(loginUser.getUserNo())));
		}
		jObj.put("townList", new Gson().toJson(cService.selectTownStarList(loginUser.getUserNo())));
		
		return jObj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="selectMyStarCount.cm")
	public int selectMyStarCount(HttpSession session) {
		return cService.selectMyStarCount(((Member)session.getAttribute("loginUser")).getUserNickname());
	}
	
	@ResponseBody
	@RequestMapping(value="insertTown.cm")
	public int insertTown(@RequestParam("townTitle") String townTitle,
				             @RequestParam("townContent") String townContent,
				             HttpSession session,
				             @RequestParam(value = "insertTownImgFile0", required = false) MultipartFile file0,
				             @RequestParam(value = "insertTownImgFile1", required = false) MultipartFile file1,
				             @RequestParam(value = "insertTownImgFile2", required = false) MultipartFile file2,
				             @RequestParam(value = "insertTownImgFile3", required = false) MultipartFile file3,
				             @RequestParam(value = "insertTownImgFile4", required = false) MultipartFile file4) {
		Town t = new Town();
		t.setTownTitle(townTitle);
		t.setTownContent(townContent);
		t.setTownWriter(((Member)session.getAttribute("loginUser")).getUserNickname());
		t.setTownWriterImg(((Member)session.getAttribute("loginUser")).getUserUpdateName());
		
		String uploadDir = "resources/uploadFiles/town/";

	    MultipartFile[] files = {file0, file1, file2, file3, file4};
	    for (int i = 0; i < files.length; i++) {
	        MultipartFile file = files[i];
	        if (file != null) {
	            String beforeName = UploadFile.saveTownFile(file, session);
	            String updateName = uploadDir + beforeName;
	            switch (i) {
	                case 0: t.setTownThumbnail(updateName); break;
	                case 1: t.setTownDetailImg2(updateName); break;
	                case 2: t.setTownDetailImg3(updateName); break;
	                case 3: t.setTownDetailImg4(updateName); break;
	                case 4: t.setTownDetailImg5(updateName); break;
	            }
	        }
	    }
	    return cService.insertTown(t);
	}
	
	@ResponseBody
	@RequestMapping(value="increaseTownClick.cm")
	public int increaseTownClick(@RequestParam("townNo") int townNo) {
		return cService.increaseTownClick(townNo);
	}
	
	@ResponseBody
	@RequestMapping(value="selectTownDetail.cm", produces = "application/json; charset=utf-8")
	public String selectTownDetail(@RequestParam("townNo") int townNo, HttpSession session) {
		Member loginUser = null;
		JSONObject jObj = new JSONObject();
		
		if((Member)session.getAttribute("loginUser") != null) {
			loginUser = (Member)session.getAttribute("loginUser");
			jObj.put("isMyStarTown", new Gson().toJson(cService.isMyStarTown(loginUser.getUserNo(), townNo)));
		}
		jObj.put("townDetail", new Gson().toJson(cService.selectTownDetail(townNo)));
		jObj.put("townReplyList", new Gson().toJson(cService.selectTownReplyList(townNo)));
		
		return jObj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="insertTownReply.cm")
	public int insertTownReply(@RequestParam("townNo") int townNo, @RequestParam("townReplyContent") String townReplyContent, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		TownReply tr = new TownReply();
		tr.setTownReplyRefNo(townNo);
		tr.setTownReplyWriter(loginUser.getUserNickname());
		tr.setTownReplyWriterImg(loginUser.getUserUpdateName());
		tr.setTownReplyContent(townReplyContent);
		return cService.insertTownReply(tr);
	}
}
