<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/homeTown/searchApt.css">
<style>
	#search-outer{
		width: 100%;
		height: 100%;
		overflow-y: auto;
		border: 1px solid blue;
	}
	#search-area{
		height: 4%;
		display: flex;
		
	}
	#search-result{
		height: 857px;
		position: relative;
		overflow-y: auto;
	}
	.searchExResult{
		padding: 10px;
		width: 100%;
		padding-left: 50px;
	}
	.searchExResult:hover{
		background-color: lightgray;
		cursor: pointer;
	}
	#search-ex{
		position: absolute;
		z-index: 99;
		background-color: white;
		width: 342px;
		overflow-y: auto;
		height: 250px;
		border: 1px solid lightgrey;
		border-top: 0;
		left: 64px;
		border-radius: 0px 0px 10px 10px;
		overflow-x: hidden;
		display: none;
	}
	#search-ex::-webkit-scrollbar {
		width: 10px;
		background-color: white;
	}
	#search-ex::-webkit-scrollbar-thumb {
		background-color: #2f3542;
		border-radius: 10px;
		background-clip: padding-box;
		border: 2px solid transparent;
	}
</style>
</head>
<body>
	

	<div id="search-outer">
		<div onclick="cancelHomeTownDiv();">
			searchApt.jsp 입니다
		</div>

		<div id="search-area">
			<select name="search" id="search-select">
				<option value="apt" selected>아파트</option>
				<option value="address">지역</option>
			</select>
			<input type="text" style="flex: 1;" id="search-input">
			<button>검색</button>
		</div>
		<div id="search-ex">
			
		</div>
		<div id="search-result" class="no-scrollbar">
				
		</div>


	</div>

	

	<script>

		var selectAptLocationX = "";
		var selectAptLocationY = "";

		$(function(){

			$("#search-input").keyup(function(){

				$("#search-ex").css("display", "block");

				if($("#search-input").val() != ""){

				

					$.ajax({
						url:"searchEx.ma",
						data:{
							searchType:$("#search-select").val(),
							searchInput:$("#search-input").val()
						},
						success:function(data){

							let value = "";

							for(let i in data){

								value += "<div class='searchExResult'>"
									   + "<input class='inputAddressX' type='hidden' value='"+ data[i].aptLocationX +"'>"
									   + "<input class='inputAddressY' type='hidden' value='"+ data[i].aptLocationY +"'>"
									   + "<div class='inputAptName'>" + data[i].aptName + "</div>"
									   + "</div>"

								   

							}

							$("#search-ex").html(value);
							$(".searchExResult").on('click', function() {			
								selectAptLocationX = $(this).find(".inputAddressX").val();
								selectAptLocationY = $(this).find(".inputAddressY").val();
									detailAptListSearch([
										$(this).find(".inputAddressX").val(), // 클릭된 요소의 자식 input 값
										$(this).find(".inputAptName").text() // 클릭된 요소의 자식 div 텍스트
									]);
									document.getElementById("search-result").scrollTop=0;
									$("#search-ex").css("display", "none");
									$("#search-input").val("");
									
									$.ajax({
										url:"searchCountUp.ma",
										data:{
											aptName:$(this).find(".inputAptName").text()
										},
										success:function(){
											
											popularTitle();
										},
										error:function(){
											console.log("ajax통신 실패")
										}

									})

								});	
							

						},
						error:function(){
							console.log("ajax 실패")
						}

					})

				}

			})


		})

		function popularTitle(){
			
			$.ajax({
				url:"popularTitle.ap",
				success:function(data){

					let value = "";
					let popularNum = 1;

					for(let i in data){
						
						value += "<li>"
							+ "<button type='button' class='hoverZ'>"
							+ "<span>" 
							+ popularNum++
							+ "</span>"
							+ data[i].aptName
							+ "</button>"
							+ "</li>"

					}

					$("#ticker").html(value);

				},
				error:function(){
					console.log("ajax실패");
				}
				
			})
			}



		function detailAptListSearch(value){

			$.ajax({
				url:"detailApt.ma",
				data:{
					aptName: value[1],
					aptLocation: value[0]
				},
				success:function(data){
					let aptData = "";

					for(let i=0; i<data.length; i++){
						aptData += `
									<div class='detailMap-apt' onclick="toggleAptDetailDiv('aptDetailForm', \${data[i].aptNo});">
										<div class='detailMap-apt-img centerXY hoverZ'>
											<img src='\${data[i].aptImgUrl}'>
										</div>
										<div class='detailMap-apt-content'>
											<div><i class="fa-brands fa-bandcamp"></i> 매물번호 <span style="color: blue;">\${data[i].aptNo}</span></div>
											<ul>
												<li><i class="fa-solid fa-sack-dollar"></i> \${data[i].aptSellingType}\${data[i].aptPrice}</li>
												<li><i class="fa-solid fa-building"></i> &nbsp;\${data[i].aptName}</li>
												<li><i class="fa-solid fa-tag"></i> <span style="color: gray;">\${data[i].aptDesc}</span></li>
											</ul>
										</div>
									</div>
								`;
					}
					$("#search-result").html(aptData);
					$(".detailMap-apt").on('click', function() {	
						var currentZoom = map.getZoom();
		   				 	map.setZoom(17);
						var selectApt = new naver.maps.LatLng(selectAptLocationX, selectAptLocationY);
							map.setCenter(selectApt);
					});	
				},
				error:function(){
					console.log("실패");
				}
			})
	}
	</script>







	<script src="resources/js/homeTown/searchApt.js"></script>
</body>
</html>