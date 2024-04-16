package com.kh.got.loan.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoanController {

	private static final String serviceKey = "a53t3HEZpk6x58lQICFNhQSjKd29BFTqVXBEubF%2FsQet6BotMcCJddwmyUUjIlCq2rHsborCNqanqKFUuOkNDw%3D%3D";

	@ResponseBody
	@RequestMapping(value="loanList.lo", produces = "text/xml; charset=utf-8")
	public String selectLoanList() throws IOException {
		String url = "https://apis.data.go.kr/B551408/rent-loan-rate-multi-dimensional-info/dimensional-list";
		url += "?serviceKey=" + serviceKey;
		url += "&pageNo=1";
		url += "&numOfRows=15";
		url += "&loanYm=L1M";
		url += "&cbGrd=1";
		url += "&jobCd=01";
		url += "&houseTycd=06";
		url += "&dataType=XML";
		
		URL requestUrl = new URL(url);
		HttpURLConnection urlConnection = (HttpURLConnection) requestUrl.openConnection();
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseText = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseText += line;
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseText;
	}
	
}
