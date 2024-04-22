<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>
</head>
<body>
    <div id="header_1_right"> 
    	<canvas id="myRank1"></canvas>
    </div>
    <br>
    <br>
    <br>
    <div id="header_2_right">
    	<canvas id="myRank2" width="370" height="370"></canvas>
    </div>

	<script>
		$.ajax({
			url:"rank.do",
			success:function(data){
				
				let aptNames = [];
				let price = [];

				for(let i=0; i<data.length; i++){
					aptNames.push(data[i].aptName)
					price.push(data[i].aptPrice)
					
				}

				const ctx = document.getElementById('myRank1');
				
				Chart.defaults.font.size = 11;
				new Chart(ctx, {
					type: 'bar',
					data: {
					labels: [aptNames[0], aptNames[2], aptNames[3], aptNames[4], aptNames[5]],
					datasets: [{
						label: '서울시 아파트 가격 top5(억)',
						data: [price[0], price[2], price[3], price[4], price[5]],
						borderWidth: 1,
						
					}]
					},
					options: {
						indexAxis: 'y',
						scales: {
							y: {
							beginAtZero: true
							}
							
						},
						plugins: {
							legend: {
								labels: {
									// This more specific font property overrides the global property
									font: {
										size: 16
									}
								}
							}
						}
					}
				});
				
				
			},
			error:function(){
				console.log("차트 통신 실패");
			}
			
		})	
	
		$.ajax({
			url:"rank2.do",
			success:function(result){
				
				let avgPrice = [];
				let aptAddr = [];

				for(let i=0; i<result.length; i++){
					avgPrice.push(result[i].aptPrice)
					aptAddr.push(result[i].aptAddress)
				}

				console.log(aptAddr)

				Chart.defaults.font.size = 9;
				const ctx2 = document.getElementById('myRank2');

				new Chart(ctx2, {
					type: 'bar',
					data: {
					labels: aptAddr,
					datasets: [{
						label: "서울시 '구'별 아파트 평균 가격 top10 (억)",
						data: avgPrice,
						borderWidth: 1,
						backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    	borderColor: 'rgba(255, 99, 132, 1)',
						
					}]
					},
					options: {
						indexAxis: 'y',
						scales: {
							y: {
							beginAtZero: true
							}
							
						},
						plugins: {
							legend: {
								labels: {
									// This more specific font property overrides the global property
									font: {
										size: 16
									}
								}
							}
						}
					}
				});
			},
			error:function(){
				console.log("차트2 통신 실패")
			}
		})
		
		
	</script>
   
</body>
</html>