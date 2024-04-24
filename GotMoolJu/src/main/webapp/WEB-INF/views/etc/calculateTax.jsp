<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
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
				<table>
					<tr>
						<th>취득세 계산(매매)</th>
					</tr>
					<tr>
						<td>
							<input type="radio" name="realEstateType" value="house"> 주택
							<input type="radio" name="realEstateType" value="officetel"> 오피스텔
						</td>
					</tr>
					<tr>
						<td>
							<input type="radio" name="areaType" value="40"> 40㎡▾
							<input type="radio" name="areaType" value="60"> 60㎡▾
							<input type="radio" name="areaType" value="85"> 85㎡▾
							<input type="radio" name="areaType" value="big"> 85㎡▴
						</td>
					</tr>
					<tr>
						<td>
							<input type="radio" name="own" value="one"> 1주택
							<input type="radio" name="own" value="two"> 2주택
							<input type="radio" name="own" value="three"> 3주택
						</td>
					</tr>
					<tr>
						<td>
							취득가액 <input type="number" name="amount"> 만원
						</td>
					</tr>
					<tr>
						<td>
							<button onclick="taxCalculate();">취득세 계산</button>
						</td>
					</tr>
				</table>

				<hr>

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
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>

					</tbody>
					</table>

				<script>
					function taxCalculate(){

						console.log($("input[name=own]:checked").val())

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







					}






				</script>	



				<br><br><br><br><br>
				<img src="resources/images/etc/taxImage.png" style="width: 100%; height: 20%;" alt="">
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</div>
	</div>
	<script src="resources/js/etc/calculateTax.js"></script>
</body>
</html>