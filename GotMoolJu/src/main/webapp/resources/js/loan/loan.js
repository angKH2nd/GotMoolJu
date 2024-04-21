$(document).ready(function() {
    // Chart.js를 로드하고 차트를 생성하는 함수 정의
    function loadChartJS(callback) {
        // Chart.js 스크립트 동적으로 로드
        let script = document.createElement("script");
        script.src = "https://cdn.jsdelivr.net/npm/chart.js";
        script.onload = callback; // Chart.js가 로드된 후 콜백 함수 실행
        document.head.appendChild(script);
    }

    // 콜백 함수를 사용하여 loadChartJS 함수 호출하여 차트 생성
    loadChartJS(function() {
        $.ajax({
            url: "loanList.lo",
            success: function(data) {
                let itemArr = $(data).find("item").toArray();

                let value = "";
                itemArr.forEach(function(item){
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
                            `;
                })
                makeBarChart(itemArr);
                makeHorizontalBarChart(itemArr);
                $(".loan-list").html(value);
            },
            error: function() {
                swal("대출 조회 실패!", "관리자에게 문의해주세요", 'warning');
            }
        });
    });

    $(".loan-list").on("click", ".loan-list-bank", function() {
        let bankName = $(this).data("bank-name");
        openBank(bankName);
    });

    // 대출금리를 기준으로 정렬하는 함수
    function sortByLoanRate(itemArr) {
        itemArr.sort(function(a, b) {
            let loanRateA = parseFloat($(a).find("avgLoanRat").text());
            let loanRateB = parseFloat($(b).find("avgLoanRat").text());
            return loanRateA - loanRateB;
        });
    }

    // Chart.js를 사용하여 가로 막대 차트 생성하는 함수
    function makeHorizontalBarChart(itemArr) {
        // 대출금리를 기준으로 정렬
        sortByLoanRate(itemArr);

        // 은행명과 대출금리 데이터 배열 생성
        let bankNames = itemArr.map(function(item) {
            return $(item).find("bankNm").text();
        });
        let loanRates = itemArr.map(function(item) {
            return parseFloat($(item).find("avgLoanRat").text());
        });

        // Chart.js를 사용하여 가로 막대 차트 생성
        let ctx = document.getElementById('loanChart').getContext('2d');
        ctx.canvas.width = 500;
        let barChart = new Chart(ctx, {
            type: 'bar', // 수평 막대 차트 타입으로 변경
            data: {
                labels: bankNames,
                datasets: [{
                    label: '대출금리',
                    data: loanRates,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                indexAxis: 'y', // y축을 기준으로 바 차트를 그리기
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    x: {
                        beginAtZero: true // x축의 최소값을 0으로 설정
                    }
                }
            }
        });
    }

    // Chart.js를 사용하여 막대 차트 생성하는 함수
	function makeBarChart(itemArr) {
	    // 은행별 대출실행금액 데이터 배열 생성
	    let bankNames = [];
	    let bankLoanAmts = [];
	    itemArr.forEach(function(item) {
	        let bankName = $(item).find("bankNm").text();
	        let loanAmt = parseInt($(item).find("loanAmt").text());
	        bankNames.push(bankName);
	        bankLoanAmts.push(loanAmt);
	    });
	
	    // 대출실행금액을 내림차순으로 정렬
	    let sortedData = itemArr.sort((a, b) => {
	        let loanAmtA = parseInt($(a).find("loanAmt").text());
	        let loanAmtB = parseInt($(b).find("loanAmt").text());
	        return loanAmtB - loanAmtA;
	    });
	
	    // 상위 10개의 데이터만 선택
	    let top10Data = sortedData.slice(0, 10);
	
	    // 선택된 데이터로 다시 배열 생성
	    let top10BankNames = [];
	    let top10BankLoanAmts = [];
	    top10Data.forEach(function(item) {
	        let bankName = $(item).find("bankNm").text();
	        let loanAmt = parseInt($(item).find("loanAmt").text());
	        top10BankNames.push(bankName);
	        top10BankLoanAmts.push(loanAmt);
	    });
	
	    // y축에 대한 스케일 옵션 정의
	    let yAxesOptions = {
	        ticks: {
	            beginAtZero: true
	        }
	    };
	
	    // Chart.js를 사용하여 막대 차트 생성
	    let ctx = document.getElementById('barChart').getContext('2d');
	    let barChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: top10BankNames,
	            datasets: [{
	                label: '대출실행금액',
	                data: top10BankLoanAmts,
	                backgroundColor: 'rgba(54, 162, 235, 0.2)',
	                borderColor: 'rgba(54, 162, 235, 1)',
	                borderWidth: 1
	            }]
	        },
	        options: {
	            responsive: true,
	            legend: {
	                display: false
	            },
	            scales: {
	                y: yAxesOptions // 'yAxes' 대신 'y' 사용
	            }
	        }
	    });
	}

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
});