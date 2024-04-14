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
	$(".enroll-body #validateEnrollEmailTr").hide();
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
	$("#searchNewPwdUserId").val($("#searchPwdId").val());
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
	$(".modal-delete-wrap").hide();
	$(".modal-update-pwd-wrap").hide();
	$(".id-area #validateSmsTr").hide();
    $(".pwd-area #validateSmsTr").hide();
    $(".enroll-body #validateEnrollEmailTr").hide();
    $(".enroll-body #validateEnrollPhoneTr").hide();
    
	$("#userId").val("");
	$("#userPwd").val("");
	$("#userPwdCheck").val("");
	$("#userName").val("");
	$("#userNickname").val("");
	$("#userEmail").val("");
	$("#validateEnrollEmail").val("");
	$("#validateEnrollPhone").val("");
	$('input[name="userGender"]').prop('checked', false);
	$('input[name="userPhone"]').val("");
	$("#enroll_postcode").val("");
	$("#enroll_address").val("");
	$("#enroll_detailAddress").val("");
	$("#enroll_extraAddress").val("");
	$("#validateEnrollEmail").val("");
	$("#validateEnrollPhone").val("");
	$("#searchIdName").val("");
	$("#searchIdPhone").val("");
	$("#searchPwdId").val("");
	$("#searchPwdPhone").val("");
	$("#searchNewPwd").val("");
	$("#searchNewPwdCheck").val("");
	$("#validateIdPhone").val("");
	$("#validatePwdPhone").val("");
	$("#deletePwd").val("");
	$("#deletePwdCheck").val("");
	$("#updatePwd").val("");
	$("#updatePwdCheck").val("");
	
	$("#enroll-submit-btn").prop('disabled', true);
	$("#sendIdSms").prop('disabled', true);
	$("#sendPwdSms").prop('disabled', true);
	$("#searchIdBtn").prop('disabled', true);
	$("#searchPwdBtn").prop('disabled', true);
	$("#deletePwdBtn").prop('disabled', true);
	$("#updatePwdBtn").prop('disabled', true);
	$("#enroll-send-email-btn").prop('disabled', true);
	$("#enroll-send-email-btn").text("인증하기");
	$("#enroll-send-phone-btn").prop('disabled', true);
	$("#enroll-send-phone-btn").text("인증하기");
	$("#validateEnrollEmailBtn").prop('disabled', true);
	$("#validateEnrollPhoneBtn").prop('disabled', true);
	
	$("#enroll-submit-btn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
	$("#searchIdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
	$("#sendIdSms").css('backgroundColor', '#808080').css('color', 'white');
	$("#validateIdPhoneBtn").css('backgroundColor', '#808080').css('color', 'white');
	$("#searchPwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
	$("#sendPwdSms").css('backgroundColor', '#808080').css('color', 'white');
	$("#validatePwdPhoneBtn").css('backgroundColor', '#808080').css('color', 'white');
	$("#searchNewPwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
	$("#deletePwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
	$("#updatePwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
	
	$('.wm').remove();
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