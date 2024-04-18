<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/homeTown/weather.css">
</head>
<body>
	<div class="weather-form br5">
		<div class="weather-title">
			<div class="weather-title-text centerY fl fb">오늘의 날씨</div>
			<div class="weather-title-date fl"></div>
		</div>
		<div class="weather-content">
			<div class="weather-content-left centerXY fl">
				<div class="skyState" style="font-size: 50px;"></div>
			</div>
			<div class="weather-content-right fl">
				<div class="curTime"></div>
				<div class="maxTemp"></div>
				<div class="minTemp"></div>
			</div>
		</div>
		<div class="weather-bottom mh centerY" onclick="openCommunity();"></div>
		
		<p class="result">
			<%-- 오늘 날짜, 예보 시간, 온도 --%>
		</p>
	</div>
	
	<script>
	// 현재 날짜
	let date = new Date();
	let year = date.getFullYear(); //2024
	let month = "0"+(date.getMonth() + 1); // 04 "012"
	let month2 = month.substr(-2);
	let day = '0'+date.getDate(); //16
	let day2 = day.substr(-2);
	let initDate = year +month2 + day2;
	
	let initDate2 = year + "년 " + month2 + "월 " + day2 + "일"
	// console.log(initDate);
	
	// 오늘 날짜 년월일
	$(".weather-title-date").html(initDate2);

	// 현재 시각
	let curHour = "0" +date.getHours();
	let curHour1 = curHour.substr(-2);
	let curMin = "00";

	// 예보시각에 쓰일 현재시각 '0000' 이런식으로 시는 '00'~'23', 분은 '00' 고정
	let curTime = curHour1 + curMin;

	// console.log(curHour)
	// console.log(curMin)
	// console.log(curTime)

	$.ajax({
		url:`https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=RDLS1cD9J8pJQjT2wsuBRh96aVWxu8vfzUWKvc9wbnL7HF4Dbg7lHiVktOf80BrpBxNnZsSPKA2iCR6KWF7IGQ%3D%3D&pageNo=1&numOfRows=900&dataType=json&base_date=\${initDate}&base_time=0200&nx=61&ny=125`,
		success: function(result){
			// console.log(result)
			let item = result.response.body.items.item
			// let temp = result.response.body.items.item[0].fcstValue
			// console.log(temp)
			let tmx; // 일 최고 온도
			let tmn;  // 일 최저 온도
			let skyState = ""; // 하늘 상태
			let value = "";

			let sky = "";

			for(let i=0; i<item.length; i++){
				if(item[i].category == "SKY" && item[i].fcstDate == initDate && item[i].fcstTime == curTime){
					sky = item[i].fcstValue;
				}
			}
			// console.log(sky)

			for(let i=0; i<item.length; i++){
				
				// 당일 
				if(item[i].fcstDate == initDate){
					// 최고기온
					if(item[i].category == "TMX"){
						tmx = parseInt(item[i].fcstValue) + '℃';
					}
					// 최저기온
					if(item[i].category == "TMN"){
						tmn = parseInt(item[i].fcstValue) + '℃';
					}

					// 하늘 상태는 현재시각을 기준으로 가져와야 하니까
					// 현재 날짜(initDate)와 시간(curTime) 조건식으로 걸기
					if(item[i].fcstTime == curTime){
						if(item[i].category == "PTY"){
							if(item[i].fcstValue != "0"){
								switch(item[i].fcstValue){
									case "1":
										$(".skyState").html('🌧');
										$(".weather-bottom").html('🌧 날씨를 담은 단지 사진을 공유해보아요!');
										break;
									case "3":
										$(".skyState").html('🌨');
										$(".weather-bottom").html('🌨 날씨를 담은 단지 사진을 공유해보아요!');
										break;
									case "4":
										$(".skyState").html('⛈');
										$(".weather-bottom").html('⛈ 날씨를 담은 단지 사진을 공유해보아요!');
										break;
								}
								$(".weather-form").css({
					                "background-image": "url('resources/images/weather/weather_bg_rain.jpg')",
					                "background-size": "cover"
					            });
							}else{
								switch(sky){
								case "1":
									$(".skyState").html('🌞');
									$(".weather-bottom").html('🌞 날씨를 담은 단지 사진을 공유해보아요!');
									break;
								case "3":
									$(".skyState").html('🌥');
									$(".weather-bottom").html('🌥 날씨를 담은 단지 사진을 공유해보아요!');
									break;
								case "4":
									$(".skyState").html('☁');
									$(".weather-bottom").html('☁ 날씨를 담은 단지 사진을 공유해보아요!');
									break;
								}
								$(".weather-form").css({
					                "background-image": "url('resources/images/weather/weather_bg_no_rain.jpg')",
					                "background-size": "cover"
					            });
							}
						}					

						if(item[i].category == "TMP"){
							$(".curTime").html('현재기온: ' + item[i].fcstValue + '℃');
						}
					}
				}
				// 3일치 시간별 기온
				/*
				if(item[i].category == "TMP"){
					value += item[i].fcstTime + '온도: ' + item[i].fcstValue + "<br>"
				}
				*/
			}
			//$(".result").html(value);
			$(".maxTemp").html(`일 최고기온: \${tmx}`);
			$(".minTemp").html(`일 최저기온: \${tmn}`);
		},
		
	})
	</script>
	
	<script src="resources/js/homeTown/weather.js"></script>
</body>
</html>