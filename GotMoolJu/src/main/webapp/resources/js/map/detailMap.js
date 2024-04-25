let aptSlideIndex = 1;
let slideInterval;

function plusSlides(n) {
    clearInterval(slideInterval);
    showAptSlides(aptSlideIndex += n);
}

function showAptSlides(n) {
    const aptSlides = document.getElementsByClassName("aptSlide");
    if (n > aptSlides.length) { aptSlideIndex = 1; }
    if (n < 1) { aptSlideIndex = aptSlides.length; }
    for (let i = 0; i < aptSlides.length; i++) {
        aptSlides[i].style.display = "none";
    }
    aptSlides[aptSlideIndex - 1].style.display = "block";
    
    const aptPrev = document.querySelector(".aptPrev");
    const aptNext = document.querySelector(".aptNext");

    if (aptSlides.length <= 1) {
        aptPrev.style.display = "none";
        aptNext.style.display = "none";
    } else {
        aptPrev.style.display = "block";
        aptNext.style.display = "block";
    }
    
    if (aptSlides.length > 1) {
        clearInterval(slideInterval);
        slideInterval = setInterval(function() {
            plusSlides(1);
        }, 5000);
    } else {
        clearInterval(slideInterval);
    }
}

function toggleAptDetailDiv(className, no){
    var divs = document.querySelectorAll('.apt-detail-toggle > div');

    divs.forEach(function(div) {
        if (div.classList.contains(className)) {
            div.style.display = div.style.display === 'block' ? 'none' : 'block';
        } else {
            resetInsertImprovementIdeation();
            div.style.display = 'none';
        }
    });
    
    $.ajax({
        url: "selectAptDetail.ma",
        data: {
            aptNo : no
        },
        success: function(data){
            $(".apt-detail-form-top-title").html(data.aptAddress);
            
            let aptImgs = "";
            if(data.aptImgUrl !== undefined){
                aptImgs += `<div class="aptSlide">
                                <img src="${data.aptImgUrl}">
                            </div>`;
            }
            if(data.aptImgUrls1 !== undefined){
                aptImgs += `<div class="aptSlide">
                                <img src="${data.aptImgUrls1}">
                            </div>`;
            }
            if(data.aptImgUrls2 !== undefined){
                aptImgs += `<div class="aptSlide">
                                <img src="${data.aptImgUrls2}">
                            </div>`;
            }
            if(data.aptImgUrls3 !== undefined){
                aptImgs += `<div class="aptSlide">
                                <img src="${data.aptImgUrls3}">
                            </div>`;
            }
            if(data.aptImgUrls4 !== undefined){
                aptImgs += `<div class="aptSlide">
                                <img src="${data.aptImgUrls4}">
                            </div>`;
            }
            if(data.aptImgUrls5 !== undefined){
                aptImgs += `<div class="aptSlide">
                                <img src="${data.aptImgUrls5}">
                            </div>`;
            }
            
            $(".apt-slideshow-container").html(aptImgs);
            
            $(".apt-detail-head").html(data.aptName);
            $(".apt-detail-introduce-content").html(data.aptIntroduce);
            $(".apt-detail-info-icon1-text").html(data.aptSellingType);
            $(".apt-detail-info-icon2-text").html(data.aptPrice);
            $(".apt-detail-info-icon3-text").html(data.aptDesc1);
            
            let aptThings = "";
            if(data.AptTags1 !== undefined){
                aptThings += `<div class="apt-detail-info-things1 bdlg br5 centerY pd5 fl">${data.AptTags1}</div>`;
            }
            if(data.AptTags2 !== undefined){
                aptThings += `<div class="apt-detail-info-things2 bdlg br5 centerY pd5 fl">${data.AptTags2}</div>`;
            }
            if(data.AptTags3 !== undefined){
                aptThings += `<div class="apt-detail-info-things3 bdlg br5 centerY pd5 fl">${data.AptTags3}</div>`;
            }
            
            $(".apt-detail-info-things-right").html(aptThings);
            
            $(".apt-detail-info1").html(data.aptNo);
            $(".apt-detail-info2").html(data.aptName);
            $(".apt-detail-info3").html(data.aptRoomSize + "㎡");
            $(".apt-detail-info4").html(data.aptProvisionSize + "㎡");
            $(".apt-detail-info5").html(data.AptBeds + "개/" + data.AptBath + "개");
            $(".apt-detail-info6").html(data.AptEntranceType);
            $(".apt-detail-memo-content").html(data.aptMemo);
            
            showAptSlides(aptSlideIndex);
            
            saveRecentPropertyToCookie(data);
            
            showRecentProperties();
            
            test(no);
        },
        error : function(){
            swal("부동산 조회 실패!", "관리자에게 문의해주세요", 'warning');
        }
    });
}


function test(no){

	let icon = document.getElementById('heartIcon');

    $.ajax({
        url:"selectLike.me",
        data:{
            userNo : $("#userNo").val(),
            aptNo: no
        },
        success:function(result){
            if(result > 0){
                // 꽉찬 하트로 바꿔주고, 빨강
                icon.classList.remove('fa-regular');
                icon.classList.add('fa-solid');
                $("#heartIcon").css("color", "#ea0b2c");

                // icon.classList.toggle('fa-regular');
                // icon.classList.toggle('fa-solid');
                // $("#heartIcon").css("color", "#ea0b2c");                
            }else{ 
                // 원본 유지 빈 하트
                icon.classList.remove('fa-solid');
                icon.classList.add('fa-regular');
                $("#heartIcon").css("color", "");
            }
        },
        error:function(){
            console.log("좋아요 조회 통신 실패");
        }
    })
}

function saveRecentPropertyToCookie(propertyData) {
    // 필요한 데이터만 추출
    const recentProperty = {
        aptNo: propertyData.aptNo,
        aptImgUrl: propertyData.aptImgUrl
    };

    // 쿠키에서 최근 본 부동산 목록 가져오기
    let recentProperties = JSON.parse(getCookie("recentProperties")) || [];

    // 현재 부동산 데이터를 목록에 추가
    recentProperties.unshift(recentProperty);

    // 최근 본 부동산 목록을 일정 개수로 제한
    recentProperties = recentProperties.slice(0, 5);

    // 갱신된 목록을 쿠키에 저장
    setCookie("recentProperties", JSON.stringify(recentProperties), 30); // 30일 만료
}

// 쿠키 값을 가져오는 함수
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) {
        return parts.pop().split(';').shift();
    } else {
        return null; // 쿠키가 없으면 null 반환
    }
}
// 쿠키 값을 설정하는 함수
function setCookie(name, value, days) {
    const date = new Date();
    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    const expires = "expires=" + date.toUTCString();
    document.cookie = name + "=" + value + ";" + expires + ";path=/";
}

function cancelAptDetailDiv() {
    var divs = document.querySelectorAll('.apt-detail-toggle > div');

    divs.forEach(function(div) {
        resetInsertImprovementIdeation();
        div.style.display = 'none';
    });
}

function showRecentProperties() {
    const listContainer = document.querySelector('.recent-list-container');
    listContainer.innerHTML = ''; // 목록 초기화

    // 최근 본 부동산 목록을 쿠키에서 가져와서 표시
    const recentProperties = JSON.parse(getCookie("recentProperties")) || [];
    
    if (recentProperties.length === 0) {
        // 최근 본 부동산이 없는 경우 메시지 추가
        const message = document.createElement('p');
        message.style.padding = '0 15px';
        message.textContent = "최근 본 부동산이 없습니다.";
        listContainer.appendChild(message);
    } else {
        // 최근 본 부동산이 있는 경우 목록 표시
        recentProperties.forEach((property, index) => {
		    const listItem = document.createElement('li');
		    listItem.classList.add('recent-list', 'br5', 'mh', 'hoverZ');
		
		    const image = document.createElement('img'); // 이미지 요소 생성
		    image.src = property.aptImgUrl; // 이미지 소스 설정
		    image.id = property.aptNo; // 이미지 no 설정
		    image.width = 75;
		    image.height = 75;
		
			// onclick 추가
			image.setAttribute('onclick', 'openAptDetailByRecent("' + property.aptNo + '")');
		
		    // 인덱스별 스타일 지정
		    if ( index === 1 || index === 3) {
		        image.style.margin = '0 10px';
		    } else if ( index === 0 ) {
		    	image.style.marginLeft = '15px';
		    } else {
		        image.style.marginRight = '0';
		    }
		
		    image.style.borderRadius = '10px';
		    listItem.appendChild(image); // 이미지 추가
		
		    listContainer.appendChild(listItem); // 최종 리스트 아이템을 목록 컨테이너에 추가
		});
    }
}

function openAptDetailByRecent(no) {
	toggleDiv('member');
	
	toggleAptDetailDiv('aptDetailForm', no);
}