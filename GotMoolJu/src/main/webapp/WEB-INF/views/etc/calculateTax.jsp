<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<style>
	#tax-area{
		border-spacing: 10px 10px; 
		width: 100%;
		font-size: 16px;
	}
	#tax-area input[type=radio]{
		display: none;
	}
	#tax-area input[type=radio]+label{
		display: inline-block;
		cursor: pointer;
		height: 24px;
		width: 90px;
		border: 1px solid #333;
		line-height: 24px;
		text-align: center;
		font-weight:bold;
		font-size:13px;
	}
	#tax-area input[type=radio]+label{
		background-color: #fff;
		color: #333;
	}
	#tax-area input[type=radio]:checked+label{
		background-color: #333;
		color: #fff;
	}
	.tax-money{
		font-size: 20px;
	}
	#amount-value{
		width: 260px;
		height: 23px;
	}
	#taxCalculateBtn{
		background-color: #817676;
		color: white;
		width: 120px;
		height: 30px;
		border-radius: 5px;
		border: 0px;
	}
	.tax-btn-hover:hover{
		cursor: pointer;
		box-shadow: 0 0.5em 0.5em -0.4em #636161;
		scale: 1.1;
	}
</style>
<link rel="stylesheet" href="resources/css/etc/calculateTax.css">
</head>
<body>
	<div class="calculate-form no-scrollbar">
		<div class="calculate-top pd15">
			<div class="calculate-previous fl mh" onclick="toggleEtcDiv('calculateTax');"><i class="fa-solid fa-angle-left fa-lg"></i></div>
			<div class="calculate-title fl">세금계산기</div>
			<div class="calculate-cancel fl mh" onclick="cancelCalculateTax();"><b><i class="fa-solid fa-xmark fa-lg"></i></b></div>
		</div>
		<div class="calculate-center">
			<div class="calculate-img pd15">
				<img width=419 height=140 src="resources/images/advertisement/adv3.png">
			</div>
			<div class="calculate-text fs16 centerY">
				민규(남)가 만들어주는 세금계산기
			</div>
		</div>
		<div class="calculate-body no-scrollbar">
			<div class="calculate-form pd15">
				<table id="tax-area">
					<tr>
						<th height="50" style="font-size: 25px;">취득세 계산(매매)</th>
					</tr>
					<tr>
						<td>
							<input type="radio" name="realEstateType" value="house" id="realEstateType-house" class="realEstateType-radio"><label for="realEstateType-house">주택</label>
							<input type="radio" name="realEstateType" value="officetel" id="realEstateType-officetel" class="realEstateType-radio"><label for="realEstateType-officetel">오피스텔</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="radio" name="areaType" id="areaType-40" value="40"><label for="areaType-40">40㎡▾</label>
							<input type="radio" name="areaType" id="areaType-60" value="60"><label for="areaType-60">60㎡▾</label> 
							<input type="radio" name="areaType" id="areaType-85" value="85"><label for="areaType-85">85㎡▾</label> 
							<input type="radio" name="areaType" id="areaType-big" value="big"><label for="areaType-big">85㎡▴</label> 
						</td>
					</tr>
					<tr>
						<td id="own-area">
							<input type="radio" name="own" id="own-one" value="one"><label for="own-one">1주택</label> 
							<input type="radio" name="own" id="own-two" value="two"><label for="own-two">2주택</label> 
							<input type="radio" name="own" id="own-three" value="three"><label for="own-three">3주택</label> 
						</td>
					</tr>
					<tr>
						<td>
							<span class="tax-money">취득가액</span> <input type="number" name="amount" id="amount-value"> <span class="tax-money">만원</span> <br>
							<div align="right" style="color:#6e7177; padding-right: 60px;" id="amount-value-result" ></div>
						</td>
					</tr>
					<tr>
						<td>
							<button onclick="taxCalculate();" id="taxCalculateBtn" class="tax-btn-hover">취득세 계산</button>
						</td>
					</tr>
				</table>

				<hr>

				<div id="tax-result-area" style="display: none;">

				
				계산결과

				<table border="1" id="taxResult">
					<thead>
						<tr>
							<th>#</th>
							<th>적요</th>
							<th>값</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
					</table>
				</div>

				<script>
					function taxCalculate(){

						console.log($("input[name=realEstateType]:checked").val())
						console.log($("input[name=areaType]:checked").val())
						console.log($("input[name=own]:checked").val())
						console.log($("input[name=amount]").val())

						if($("input[name=realEstateType]:checked").val() != undefined &&
						   $("input[name=areaType]:checked").val() != undefined &&
						   $("input[name=own]:checked").val() != undefined &&
						   $("input[name=amount]").val() != ""){
							
						   

						$("#tax-result-area").css("display","block");

						$.ajax({
							url:"tax.et",
							data:{
								realEstateType:$("input[name=realEstateType]:checked").val(),
								areaType:$("input[name=areaType]:checked").val(),
								own:$("input[name=own]:checked").val(),
								amount:$("input[name=amount]").val()

							},
							success:function(data){
								console.log(data)
								let value = "";

								for(let i in data.data){

									value += "<tr>"
										   + "<td>" + i + "</td>"
										   + "<td>" + data.data[i]['적요'] + "</td>"
										   + "<td>" + data.data[i]['값'] + "</td>"
										   + "<td>" + data.data[i]['비고'] + "</td>"
										   + "</tr>"
								}

								$("#taxResult tbody").html(value);

							},
							error:function(){
								console.log("ajax 실패")
							}

						})
						}else{
							alert("선택사항을 전부 작성해주세요")
						}
					}

				$(function(){

					$(".realEstateType-radio").click(function(){

						
						console.log($("input[name=realEstateType]:checked").val())
						if($("input[name=realEstateType]:checked").val() == "officetel"){
							$("#own-area").css("display", "none");
						}else{
							$("#own-area").css("display", "block");
						}
						
					})

				
				$("#amount-value").keyup(function(){

					console.log($("#amount-value").val())

					var target = $("#amount-value").val()*10000;
					var unitWords    = ['', '만', '억', '조', '경'];
					var splitUnit    = 10000;
					var splitCount   = unitWords.length;
					var resultArray  = [];
					var resultString = '';

					if($("#amount-value").val() < 1000000000){
						
						for (var i = 0; i < splitCount; i++){
							var unitResult = (target % Math.pow(splitUnit, i + 1)) / Math.pow(splitUnit, i);
							unitResult = Math.floor(unitResult);
							if (unitResult > 0){
								resultArray[i] = unitResult;
							}
						}
						for (var i = 0; i < resultArray.length; i++){
							if(!resultArray[i]) continue;
							resultString = String(resultArray[i]) + unitWords[i] + resultString;
						}
						// 위에 deposit_money 라고 해두었던 span 있죠, 거기에 내용으로 string 처리 결과를 넣는 거에요
						$("#amount-value-result").html(resultString);
						$("#taxCalculateBtn").attr("disabled", false);
						$("#taxCalculateBtn").addClass("tax-btn-hover");
						 
					}else{
						$("#amount-value-result").html("숫자가 너무 큽니다!");
						$("#taxCalculateBtn").attr("disabled", true);
						$("#taxCalculateBtn").removeClass("tax-btn-hover");

					}
				})
				
			})


				</script>	



				<br><br><br><br><br>
				<button class="tax-explanation">참고사항</button>

				<div class="tax-explanation-modal">
					<img src="resources/images/etc/taxImage.png" alt="">
				</div>

				<img src="resources/images/etc/taxImage.png" style="width: 100%; height: 20%;" alt="">

				
				
			</div>
		</div>
	</div>
	<script src="resources/js/etc/calculateTax.js"></script>
</body>
</html>