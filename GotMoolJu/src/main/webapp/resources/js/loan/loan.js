$(document).ready(function() {
	$.ajax({
		url: "loanList.lo",
		success: function(data) {
			let itemArr = $(data).find("item");
			
			let value = "";
			itemArr.each(function(i, item){
				let loanAmt = parseInt($(item).find("loanAmt").text()).toLocaleString();
				let bankName = $(item).find("bankNm").text();
				let bankImg = "";
				
				switch(bankName){
					case '부산은행' : bankImg = 'bank_bnk.jpg'; break;
					case '대구은행' : bankImg = 'bank_daegu.jpg'; break;
					case '케이뱅크' : bankImg = 'bank_k.jpg'; break;
					case '토스뱅크' : bankImg = 'bank_toss.png'; break;
					case '카카오뱅크' : bankImg = 'bank_kakao.png'; break;
					case '하나은행' : bankImg = 'bank_hana.png'; break;
					case '농협은행' : bankImg = 'bank_nh.png'; break;
					case '국민은행' : bankImg = 'bank_kb.png'; break;
					case '기업은행' : bankImg = 'bank_ibk.png'; break;
					case '수협중앙회' : bankImg = 'bank_sh.png'; break;
					case '신한은행' : bankImg = 'bank_shinhan.png'; break;
					case '우리은행' : bankImg = 'bank_we.png'; break;
					case '경남은행' : bankImg = 'bank_bnk.jpg'; break;
					case '전북은행' : bankImg = 'bank_jb.png'; break;
					case '광주은행' : bankImg = 'bank_kwangju.png'; break;
				}
			
				value += `
						<div class="loan-list-bank bdlg br5 mh" data-bank-name="${bankName}">
							<div class="loan-list-bank-left fl pd5" style="width: 260px;">
								<div class="loan-list-bank-top"><i class="fa-solid fa-piggy-bank"></i> ${$(item).find("bankNm").text()}</div>
								<div class="loan-list-bank-blank"></div>
								<div class="loan-list-bank-content">
									<div class="loan-list-bank-percentage">대출금리 : ${$(item).find("avgLoanRat").text()}</div>
									<div class="loan-list-bank-count">대출실행건수 : ${$(item).find("cnt").text()}</div>
									<div class="loan-list-bank-price">대출실행금액 : ${loanAmt} 원</div>
								</div>
							</div>
							<div class="loan-list-bank-right fl centerXY"><img class="hoverZ" width=50 height=50 src="resources/images/loan/${bankImg}"></div>
						</div>
						`
			})
			makeCircleChart(itemArr);
			$(".loan-list").html(value);
		}, error: function() {
			swal("대출 조회 실패!", "관리자에게 문의해주세요", 'warning');
		}
	});
	
	$(".loan-list").on("click", ".loan-list-bank", function() {
        let bankName = $(this).data("bank-name");
        openBank(bankName);
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
                    label: '대출실행금액',
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

function openBank(bankName) {
    switch(bankName){
        case '대구은행': window.open('https://www.dgb.co.kr/dgb_ebz_main.jsp', '_blank'); break;
        case '부산은행': window.open('https://www.busanbank.co.kr/ib20/mnu/BHP00001', '_blank'); break;
        case '케이뱅크': window.open('https://www.kbanknow.com/ib20/mnu/CMMLGI010000?NEXT_PAGE=PBKTRN080000&NEXT_PARAMETER=PC_ASSN_AMT_SRVC%3DY%26OVERSEAS_IP_INTERCEPTION%3DY&ib20_redirect_org_mnu=PBKTRN080000', '_blank'); break;
        case '토스뱅크': window.open('https://www.tossbank.com/', '_blank'); break;
        case '카카오뱅크': window.open('https://m.kakaobank.com/', '_blank'); break;
        case '하나은행': window.open('https://www.hanabank.com/', '_blank'); break;
        case '농협은행': window.open('https://www.nhbank.com/nhmn/KO_NHMN_01.do', '_blank'); break;
        case '국민은행': window.open('https://www.kbstar.com/', '_blank'); break;
        case '기업은행': window.open('https://www.ibk.co.kr/', '_blank'); break;
        case '수협중앙회': window.open('https://www.suhyup.co.kr/suhyup/index.do', '_blank'); break;
        case '신한은행': window.open('https://www.shinhan.com/index.jsp', '_blank'); break;
        case '우리은행': window.open('https://www.wooribank.com/', '_blank'); break;
        case '경남은행': window.open('https://www.knbank.co.kr/ib20/mnu/BHP000000000001', '_blank'); break;
        case '전북은행': window.open('https://www.jbbank.co.kr/', '_blank'); break;
        case '광주은행': window.open('https://pib.kjbank.com/ib20/mnu/BPB0000000001', '_blank'); break;
    }
}