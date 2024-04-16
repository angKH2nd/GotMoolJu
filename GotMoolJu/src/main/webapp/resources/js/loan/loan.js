$(document).ready(function() {
	$.ajax({
		url: "loanList.lo",
		success: function(data) {
			let itemArr = $(data).find("item");
			
			let value = "";
			itemArr.each(function(i, item){
				let loanAmt = parseInt($(item).find("loanAmt").text()).toLocaleString();
			
				value += `
						<div class="loan-list-bank bdlg br5">
							<div class="loan-list-bank-left fl pd5" style="width: 260px;">
								<div class="loan-list-bank-top">${$(item).find("bankNm").text()}</div>
								<div class="loan-list-bank-blank"></div>
								<div class="loan-list-bank-content">
									<div class="loan-list-bank-percentage">대출금리 : ${$(item).find("avgLoanRat").text()}</div>
									<div class="loan-list-bank-count">대출실행건수 : ${$(item).find("cnt").text()}</div>
									<div class="loan-list-bank-price">대출실행금액 : ${loanAmt} 원</div>
								</div>
							</div>
							<div class="loan-list-bank-right fl centerXY">로고</div>
						</div>
						`
			})
			makeCircleChart(itemArr);
			$(".loan-list").html(value);
		}, error: function() {
			swal("대출 조회 실패!", "관리자에게 문의해주세요", 'warning');
		}
	});
	
	function makeCircleChart(itemArr) {
		// 은행별 대출실행금액 데이터 배열 생성
        let bankLoanAmtData = [];
        itemArr.each(function(i, item) {
            let bankName = $(item).find("bankNm").text();
            let loanAmt = parseInt($(item).find("loanAmt").text());
            bankLoanAmtData.push({ label: bankName, value: loanAmt });
        });
        
        // Chart.js를 사용하여 원형 차트 생성
        let ctx = document.getElementById('circleChart').getContext('2d');
        let circleChart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: bankLoanAmtData.map(data => data.label),
                datasets: [{
                    label: '은행별 대출실행금액',
                    data: bankLoanAmtData.map(data => data.value),
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                legend: {
                    position: 'right'
                },
                tooltips: {
                    callbacks: {
                        label: function(tooltipItem, data) {
                            let label = data.labels[tooltipItem.index] || '';
                            let value = data.datasets[0].data[tooltipItem.index] || '';
                            return `${label}: ${value}원 (${((value / data.datasets[0].data.reduce((a, b) => a + b)) * 100).toFixed(2)}%)`;
                        }
                    }
                }
            }
        });

        // 차트의 각 조각 위에 % 표시
        circleChart.options.plugins = {
            datalabels: {
                formatter: (value, ctx) => {
                    let dataset = ctx.chart.data.datasets[0];
                    let percent = Math.round((value / dataset.data.reduce((a, b) => a + b)) * 100);
                    return percent + "%";
                },
                color: '#fff',
                anchor: 'end',
                align: 'start'
            }
        };
	}
})