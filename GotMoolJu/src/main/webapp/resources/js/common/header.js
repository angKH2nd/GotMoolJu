/* modal 전역 변수 */
var modalLogin = $('.modal-wrap');
var modalEnroll = $('.modal-enroll-wrap');
var modalBg = $('.modal-bg');

/* ------------- 로그인 시작 ------------- */
function openLogin() {
    $(modalLogin).show();
    openBg();
}

function closeLogin() {
    $(modalLogin).hide();
    closeBg();
}
/* ------------- 로그인 끝 ------------- */

/* ------------- 회원가입 시작 ------------- */
function openEnrollForm() {
	closeLogin();
	$(modalEnroll).show();
	openBg();
}

function closeEnrollForm() {
    $(modalEnroll).hide();
    closeBg();
}

function beforeEnroll() {
	closeEnrollForm();
	openLogin();
}

/* ------------- 회원가입 유효성검사 시작 ------------- */

$(document).ready(function() {
	var isValid = {
		userId: false,
		userPwd: false,
		userPwdCheck: false,
		userName: false,
		userNickname: false,
		userEmail: false,
		userGender: false,
		userPhone: false,
		userAddressNormal: false,
		userAddressDetail: false,
	};

	var userIdInput = $('input[name="userId"]');
	var userPwdInput = $('input[name="userPwd"]');
	var userPwdCheckInput = $('input[name="userPwdCheck"]');
	
	var userNameInput = $('input[name="userName"]');
	var userNicknameInput = $('input[name="userNickname"]');
	var userEmailInput = $('input[name="userEmail"]');
	var userPhoneInput = $('input[name="userPhone"]');

	var userAddressNormalInput = $('input[name="userAddressNormal"]');
	var userAddressDetailInput = $('input[name="userAddressDetail"]');

	/* 정규표현식 */
	var userIdRegex = /^[a-zA-Z\d]{4,10}$/;
	var userPwdRegex = /^[a-zA-Z\d]{4,12}$/;
	
	var userNameRegex = /^[가-힣]{3,}$/;
	var userNicknameRegex = /^[a-zA-Z\d가-힣-]+$/;
	var userEmailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	var userPhoneRegex = /^010-\d{4}-\d{4}$/;
	
	var userAddressDetailRegex = /^[a-zA-Z\d가-힣,()\s-]{1,40}$/;
	
	/* ------------- ID 시작 ------------- */
	userIdInput.focus(moveToValidateId).on('input', moveToValidateId).blur(moveToValidateId);
	
	function moveToValidateId() {
		$('#idWarning').remove();
		validateId($(this));
	}
	
    function validateId(userId) {
    	if(userId.val() === '') {
            userPwdCheckInput.closest('tr').after('<tr height=16px; id="idWarning"><td colspan="3" class="validate">ID는 필수 입력사항입니다.</td ></tr>');
            isValid.userId = false;
    	} else {
	    	if (!userIdRegex.test(userId.val())) {
	            userPwdCheckInput.closest('tr').after('<tr height=16px; id="idWarning"><td colspan="3" class="validate">ID는 영문, 숫자로 구성된 4자~10자여야 합니다.</td></tr>');
	        	isValid.userId = false;
	        } else{
	        	$('#idWarning').remove();
	        	isValid.userId = true;
	        	isComplete();
	        }
        }
    }
    /* ------------- ID 끝 ------------- */
    
    /* ------------- 비밀번호 시작 ------------- */
    userPwdInput.focus(moveToValidatePwd).on('input', moveToValidatePwd).blur(moveToValidatePwd);
	
	function moveToValidatePwd() {
		$('#pwdWarning').remove();
		validatePwd($(this));
	}
	
    function validatePwd(userPwd) {
    	if(userPwd.val() === '') {
            userPwdCheckInput.closest('tr').after('<tr height=16px; id="pwdWarning"><td colspan="3" class="validate">비밀번호는 필수 입력사항입니다.</td ></tr>');
            isValid.userPwd = false;
    	} else {
	    	if (!userPwdRegex.test(userPwd.val())) {
	            userPwdCheckInput.closest('tr').after('<tr height=16px; id="pwdWarning"><td colspan="3" class="validate">비밀번호는 영문, 숫자로 구성된 4자~12자여야 합니다.</td></tr>');
	        	isValid.userPwd = false;
	        } else{
	        	$('#pwdWarning').remove();
	        	isValid.userPwd = true;
	        	isComplete();
	        }
        }
    }
    /* ------------- 비밀번호 끝 ------------- */
    
    /* ------------- 비밀번호 확인 시작 ------------- */
    userPwdCheckInput.focus(moveToValidatePwdCheck).on('input', moveToValidatePwdCheck).blur(moveToValidatePwdCheck);
	
	function moveToValidatePwdCheck() {
		$('#pwdCheckWarning').remove();
		validatePwdCheck($(this));
	}
	
    function validatePwdCheck(userPwdCheck) {
    	if(userPwdCheck.val() === '') {
            userPwdCheckInput.closest('tr').after('<tr height=16px; id="pwdCheckWarning"><td colspan="3" class="validate">비밀번호확인은 필수 입력사항입니다.</td ></tr>');
            isValid.userPwdCheck = false;
    	} else {
	    	if (userPwdCheck.val() !== $('input[name="userPwd"]').eq(2).val()) {
	            userPwdCheckInput.closest('tr').after('<tr height=16px; id="pwdCheckWarning"><td colspan="3" class="validate">비밀번호가 일치하지 않습니다.</td></tr>');
	        	isValid.userPwdCheck = false;
	        } else{
	        	$('#pwdCheckWarning').remove();
	        	isValid.userPwdCheck = true;
	        	isComplete();
	        }
        }
    }
    /* ------------- 비밀번호 확인 끝 ------------- */
    
    /* ------------- 이름 시작 ------------- */
    userNameInput.focus(moveToValidateName).on('input', moveToValidateName).blur(moveToValidateName);
	
	function moveToValidateName() {
		$('#nameWarning').remove();
		validateName($(this));
	}
	
    function validateName(userName) {
    	if(userName.val() === '') {
            userPhoneInput.closest('tr').after('<tr height=16px; id="nameWarning"><td colspan="3" class="validate">이름은 필수 입력사항입니다.</td ></tr>');
            isValid.userName = false;
    	} else {
	    	if (!userNameRegex.test(userName.val())) {
	            userPhoneInput.closest('tr').after('<tr height=16px; id="nameWarning"><td colspan="3" class="validate">올바른 이름을 입력해주세요.</td></tr>');
	        	isValid.userName = false;
	        } else{
	        	$('#nameWarning').remove();
	        	isValid.userName = true;
	        	isComplete();
	        }
        }
    }
    /* ------------- 이름 끝 ------------- */
    
    /* ------------- 닉네임 시작 ------------- */
    userNicknameInput.focus(moveToValidateNickname).on('input', moveToValidateNickname).blur(moveToValidateNickname);
	
	function moveToValidateNickname() {
		$('#nicknameWarning').remove();
		validateNickname($(this));
	}
	
    function validateNickname(userNickname) {
    	if(userNickname.val() === '') {
            userPhoneInput.closest('tr').after('<tr height=16px; id="nicknameWarning"><td colspan="3" class="validate">닉네임은 필수 입력사항입니다.</td ></tr>');
            isValid.userNickname = false;
    	} else {
	    	if (!userNicknameRegex.test(userNickname.val())) {
	            userPhoneInput.closest('tr').after('<tr height=16px; id="nicknameWarning"><td colspan="3" class="validate">닉네임은 한글, 영문, 숫자로 구성된 1자~15자여야 합니다.</td></tr>');
	        	isValid.userNickname = false;
	        } else{
	        	$('#nicknameWarning').remove();
	        	isValid.userNickname = true;
	        	isComplete();
	        }
        }
    }
    /* ------------- 닉네임 끝 ------------- */
    
    /* ------------- 이메일 시작 ------------- */
    userEmailInput.focus(moveToValidateEmail).on('input', moveToValidateEmail).blur(moveToValidateEmail);
	
	function moveToValidateEmail() {
		$('#emailWarning').remove();
		validateEmail($(this));
	}
	
    function validateEmail(userEmail) {
    	if(userEmail.val() === '') {
            userPhoneInput.closest('tr').after('<tr height=16px; id="emailWarning"><td colspan="3" class="validate">이메일은 필수 입력사항입니다.</td ></tr>');
            isValid.userEmail = false;
    	} else {
	    	if (!userEmailRegex.test(userEmail.val())) {
	            userPhoneInput.closest('tr').after('<tr height=16px; id="emailWarning"><td colspan="3" class="validate">올바른 이메일을 입력해주세요.</td></tr>');
	        	isValid.userEmail = false;
	        } else{
	        	$('#emailWarning').remove();
	        	isValid.userEmail = true;
	        	isComplete();
	        }
        }
    }
    /* ------------- 이메일 끝 ------------- */
    
    /* ------------- 성별 시작 ------------- */
    var genderRadios = $('input[name="userGender"]');

	// 라디오 버튼에 변경 이벤트 리스너 추가
	genderRadios.change(function() {
	    // 선택된 라디오 버튼의 값을 가져옴
	    var selectedValue = $('input[name="userGender"]:checked').val();
	
	    // 선택된 값이 존재하는 경우 userGender를 true로 설정
	    if (selectedValue === 'M' || selectedValue === 'F') {
	        isValid.userGender = true;
	    } else {
	        isValid.userGender = false;
	    }
	    isComplete();
	});
    /* ------------- 성별 끝 ------------- */
    
    /* ------------- 휴대폰 시작 ------------- */
    userPhoneInput.on('input', function(event) {
	    var phoneNumber = $(this).val();
	    
	    // 숫자 이외의 문자를 제거
	    phoneNumber = phoneNumber.replace(/[^\d]/g, '');
	
	    // 입력된 값의 길이에 따라 하이픈을 추가
	    if (phoneNumber.length >= 3 && phoneNumber.length < 7) {
	        phoneNumber = phoneNumber.replace(/(\d{3})(\d{0,4})/, '$1-$2');
	    } else if (phoneNumber.length >= 7) {
	        phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d{0,4})/, '$1-$2-$3');
	    }
	
	    // 포맷팅된 휴대폰 번호로 입력 필드 값을 업데이트
	    $(this).val(phoneNumber);
	    $('#phoneWarning').remove();
	    validatePhone($(this));
	});
	
	userPhoneInput.focus(moveToValidatePhone).blur(moveToValidatePhone);
	
	function moveToValidatePhone() {
		$('#phoneWarning').remove();
		validatePhone($(this));
	}
	
	function validatePhone(userPhone) {
    	if(userPhone.val() === '') {
            userPhone.closest('tr').after('<tr height=16px; id="phoneWarning"><td colspan="3" class="validate">휴대폰 번호는 필수 입력사항입니다.</td ></tr>');
            isValid.userPhone = false;
    	} else {
	    	if (!userPhoneRegex.test(userPhone.val())) {
	            userPhone.closest('tr').after('<tr height=16px; id="phoneWarning"><td colspan="3" class="validate">\'-\' 포함 올바른 번호를 입력해주세요.</td></tr>');
	        	isValid.userPhone = false;
	        } else{
	        	$('#phoneWarning').remove();
	        	isValid.userPhone = true;
	        	isComplete();
	        }
        }
    }
    /* ------------- 휴대폰 끝 ------------- */
    
    /* ------------- 일반주소 시작 ------------- */
	function validateAddressNormal() {
		if (userAddressNormalInput.val() !== '') {
		    isValid.userAddressNormal = true;
		    isComplete();
		}
	}
	/* ------------- 일반주소 끝 ------------- */
    
    /* ------------- 상세주소 시작 ------------- */
    userAddressDetailInput.focus(moveToValidateAddressDetail).on('input', moveToValidateAddressDetail).blur(moveToValidateAddressDetail);
	
	function moveToValidateAddressDetail() {
		$('#addressDetailWarning').remove();
		validateAddressDetail($(this));
	}
	
    function validateAddressDetail(userAddressDetail) {
    	if(userAddressDetail.val() === '') {
            userAddressDetailInput.closest('tr').after('<tr height=16px; id="addressDetailWarning"><td colspan="3" class="validate">상세주소는 필수 입력사항입니다.</td ></tr>');
            isValid.userAddressDetail = false;
    	} else {
	    	if (!userAddressDetailRegex.test(userAddressDetail.val())) {
	            userAddressDetailInput.closest('tr').after('<tr height=16px; id="addressDetailWarning"><td colspan="3" class="validate">올바른 상세주소를 입력해주세요.</td></tr>');
	        	isValid.userAddressDetail = false;
	        } else{
	        	$('#addressDetailWarning').remove();
	        	isValid.userAddressDetail = true;
	        	validateAddressNormal();
	        	isComplete();
	        }
        }
    }
    /* ------------- 상세주소 끝 ------------- */
    
    var inputFields = document.querySelectorAll('input[name="userId"], input[name="userPwd"], input[name="userPwdCheck"], input[name="userName"], input[name="userNickname"], input[name="userEmail"], input[name="userPhone"], input[name="userAddressPost"], input[name="userAddressNormal"], input[name="userAddressDetail"], input[name="userAddressExtra"], input[name="gender"]');

	// 각 입력 필드에 대해 input 이벤트를 추가
	inputFields.forEach(function(inputField) {
	    inputField.addEventListener('input', function() {
	        isComplete();
	    });
	});
    
    function isComplete() {
    	var allClear = Object.values(isValid).every(Boolean);
		var submitBtn = $("#enroll-submit-btn");

		if (allClear) {
			submitBtn.prop('disabled', false);
			submitBtn.css('color', 'black');
		} else {
			submitBtn.prop('disabled', true);
			submitBtn.css('color', 'lightgray');
		}
    }
});
/* ------------- 회원가입 유효성검사 끝 ------------- */

/* ------------- 회원가입 끝 ------------- */

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

/* ------------- 도로명주소 api 시작 ------------- */
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; 		// 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져오기
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { 							 // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
/* ------------- 도로명주소 api 끝 ------------- */