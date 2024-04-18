package com.kh.got.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.got.community.model.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;
	
}
