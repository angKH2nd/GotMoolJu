/* modal 전역 변수 */
var modalLogin = $('.modal-wrap');
var modalEnroll = $('.modal-enroll-wrap');
var modalSearchIdPwd = $('.modal-searchIdPwd-wrap');
var modalSearchNewPwd = $('.modal-searchNewPwd-wrap');
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
	$("#searchIdName").val("");
	$("#searchPwdName").val("");
	$("#searchIdPhone").val("");
	$("#searchPwdPhone").val("");
	$("#validateIdPhone").val("");
	$("#validatePwdPhone").val("");
    $(modalSearchIdPwd).hide();
    $(".id-area #validateSmsTr").hide();
    $(".pwd-area #validateSmsTr").hide();
    closeBg();
}

function beforeSearchIdPwdForm() {
	closeSearchIdPwdForm();
	openLoginForm();
}

function openNewPwdForm() {
	closeSearchIdPwdForm();
	$(modalSearchNewPwd).show();
	openBg();
}

function closeNewPwdForm() {
	$("#searchNewPwd").val("");
	$("#searchNewPwdCheck").val("");
	$(modalSearchNewPwd).hide();
	closeBg();
}

function beforeNewPwdForm() {
	closeNewPwdForm();
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
	$(modalSearchIdPwd).hide();
	$(modalSearchNewPwd).hide();
	$(".id-area #validateSmsTr").hide();
    $(".pwd-area #validateSmsTr").hide();
	$("#searchIdName").val("");
	$("#searchIdPhone").val("");
	$("#searchPwdId").val("");
	$("#searchPwdPhone").val("");
	$("#validateIdPhone").val("");
	$("#validatePwdPhone").val("");
	$("#sendIdSms").prop('disabled', true);
	$("#sendPwdSms").prop('disabled', true);
	$("#searchIdBtn").prop('disabled', true);
	$("#searchPwdBtn").prop('disabled', true);
	$("#searchIdBtn").css('backgroundColor', '#fafafa').css('color', '#b4b4b4');
	$("#searchPwdBtn").css('backgroundColor', '#fafafa').css('color', '#b4b4b4');
	$("#sendIdSms").css('backgroundColor', '#808080').css('color', 'white');
	$("#sendPwdSms").css('backgroundColor', '#808080').css('color', 'white');
	$("#validateIdPhoneBtn").css('backgroundColor', '#808080').css('color', 'white');
	$("#validatePwdPhoneBtn").css('backgroundColor', '#808080').css('color', 'white');
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