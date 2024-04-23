/* ------------ 현재시간 ------------ */
document.addEventListener('DOMContentLoaded', function() {
    var currentTime = new Date();
    var year = currentTime.getFullYear();
    var month = (currentTime.getMonth() + 1).toString().padStart(2, '0'); // Adding leading zero if needed
    var day = currentTime.getDate().toString().padStart(2, '0'); // Adding leading zero if needed
    var hours = currentTime.getHours();
    var minutes = '00'; // Minute unit is set to 00

    // Apply the current date and time to HTML elements
    document.getElementById('currentTime').innerText = year + '.' + month + '.' + day + ' ' + hours + ':' + minutes + ' 기준';
});
/* ------------ 현재시간 ------------ */

function toggleHomeTownDiv(className){
    var divs = document.querySelectorAll('.homeTown-toggle > div');

    divs.forEach(function(div) {
        if (div.classList.contains(className)) {
            div.style.display = div.style.display === 'block' ? 'none' : 'block';
        } else {
            resetMemberUpdateForm();
            div.style.display = 'none';
        }
    });
}

function cancelHomeTownDiv() {
    var divs = document.querySelectorAll('.homeTown-toggle > div');

    divs.forEach(function(div) {
    	resetMemberUpdateForm();
        div.style.display = 'none';
    });
}

function openSearchApt() {
	toggleDiv('home');
	toggleHomeTownDiv('searchApt');
}

$(document).ready(function() {
	$.ajax({
		url: "selectBestTownPicture.cm",
		success: function(result){
			if(result.townNo > 0){
				$(".homeTown-town-pictures-img").html(`<img width=100% height=100% class="br5 mh" onclick="moveToCommunityFromHome(${result.townNo});" src="${result.townThumbnail}">`);
				$(".homeTown-town-title-link").html(`<i class="fa-solid fa-arrow-up-right-from-square mh" onclick="moveToCommunityFromHome(${result.townNo});"></i>`);
			}else {
				$(".homeTown-town-title-link").html('');
				$(".homeTown-town-pictures-img").css('border', '0.5px solid lightgray');
				$(".homeTown-town-pictures-img").html(`<div class="br5" style="text-align:center; padding-top: 70px;">인기 단지소식이 없습니다. 😓 <br> <div class="mh" style="text-align:center; margin-top: 10px;" onclick="moveToCommunityFromHome(0);">등록하기</div></div>`);
			}
		}, error: function(){
			console.log("인기 동네소식 사진 조회 실패");
		}
	});
})

function moveToCommunityFromHome(no) {
	if($("#homeTownLoginCheck").val() !== 'n'){ // 로그인한 경우
		toggleDiv('home');
		toggleDiv('community');
		toggleCommunity('town');
		changeTownDetail(no);
	}else { // 로그인하지 않은 경우
		openLoginForm();
	}
}

document.addEventListener("DOMContentLoaded", function() {
    const newsContent = document.querySelector(".homeTown-news-content");
    const newsList = newsContent.querySelector(".news-list");
    const prevBtn = document.querySelector(".news-prev-btn");
    const nextBtn = document.querySelector(".news-next-btn");

    if (prevBtn && nextBtn) {
        // 슬라이드 이벤트 처리
        let currentPosition = 0;

        function slide(direction) {
            const step = 85;
            if (direction === "prev") {
                currentPosition += step;
            } else {
                currentPosition -= step;
            }
            currentPosition = Math.max(Math.min(currentPosition, 0), -(newsList.scrollWidth - newsContent.offsetWidth));
            newsList.style.transform = `translateX(${currentPosition}px)`;
        }

        prevBtn.addEventListener("click", () => slide("prev"));
        nextBtn.addEventListener("click", () => slide("next"));
    } else {
        console.error("Previous or Next button not found.");
    }
});

function openAptNews(num) {
	switch(num){
		case 1 : window.open('https://news.naver.com/breakingnews/section/101/260', '_blank'); break;
		case 2 : window.open('https://m.realestate.daum.net/news', '_blank'); break;
		case 3 : window.open('https://www.google.com/search?q=%EB%B6%80%EB%8F%99%EC%82%B0&tbm=nws', '_blank'); break;
		case 4 : window.open('https://m.sedaily.com/RankAll/GB', '_blank'); break;
		case 5 : window.open('https://m.edaily.co.kr/', '_blank'); break;
		case 6 : window.open('https://biz.chosun.com/real_estate/', '_blank'); break;
		case 7 : window.open('https://www.hankyung.com/realestate', '_blank'); break;
		case 8 : window.open('https://m.moneys.co.kr/realestate', '_blank'); break;
		case 9 : window.open('https://m.mt.co.kr/renew/news.html?ca=estate', '_blank'); break;
	}
}