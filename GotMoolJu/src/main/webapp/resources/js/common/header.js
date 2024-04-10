/* modal 전역 변수 */
var modalLogin = $('.modal-wrap');
var modalEnroll = $('.modal-enroll-wrap');
var modalSearchIdPwd = $('.modal-searchIdPwd-wrap');
var modalBg = $('.modal-bg');

function openEnrollForm() {
	closeLoginForm();
	$(modalEnroll).show();
	openBg();
}

function closeEnrollForm() {
    $(modalEnroll).hide();
    closeBg();
}

function beforeEnrollForm() {
	closeEnrollForm();
	openLoginForm();
}

function openSearchIdPwdForm() {
	closeLoginForm();
	$(modalSearchIdPwd).show();
	openBg();
}

function closeSearchIdPwdForm() {
    $(modalSearchIdPwd).hide();
    closeBg();
}

function beforeSearchIdPwdForm() {
	closeSearchIdPwdForm();
	openLoginForm();
}

/* 헤더 > 찜 or 헤더 > 알림 클릭 */
function openDibs() {
	var memberDiv = document.querySelector('.member');
    if (memberDiv && memberDiv.style.display !== 'block') {
        toggleDiv('member');
    }
	toggleMypageDiv('memberDibsList');
}

function openNotice() {
	var memberDiv = document.querySelector('.member');
    if (memberDiv && memberDiv.style.display !== 'block') {
        toggleDiv('member');
    }
	toggleMypageDiv('memberNoticeList');
}

/* 헤더 > 찜 or 헤더 > 알림 클릭 */

/* 공용 모달 배경 열기 */
function openBg() {
	$(modalBg).show();
}
/* 공용 모달 배경 열기 */

/* 공용 모달 배경 닫기 */
function closeBg() {
	$(modalLogin).hide();
	$(modalEnroll).hide();
	$(modalBg).hide();
}
/* 공용 모달 배경 닫기 */

/* ------------- 헤더 검색어 순환 시작 ------------- */
$(function() {
    var ticker = function() {
        $('#ticker li:first').animate({marginTop: '-20px', opacity: 0}, 400, function() {
            $(this).detach().appendTo('ul#ticker').removeAttr('style').css('opacity', 1);
        });
    };
    
    var tickerInterval = setInterval(ticker, 3000);

    $('#ticker li').hover(function() {
        clearInterval(tickerInterval);
    }, function() {
        tickerInterval = setInterval(ticker, 3000);
    });
});
/* ------------- 헤더 검색어 순환 끝 ------------- */