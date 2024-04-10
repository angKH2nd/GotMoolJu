/* ------------- 회원정보수정 유효성검사 시작 ------------- */
$(document).ready(function() {
	var isUpdateValid = {
		updateNickname: false,
		updateEmail: false,
		updatePhone: false,
		updateAddressNormal: false,
		updateAddressDetail: false,
	};

	var updateNicknameInput = $('input[name="updateNickname"]');
	var updateEmailInput = $('input[name="updateEmail"]');
	var updatePhoneInput = $('input[name="updatePhone"]');

	var updateAddressNormalInput = $('input[name="updateAddressNormal"]');
	var updateAddressDetailInput = $('input[name="updateAddressDetail"]');

	/* 정규표현식 */
	var updateNicknameRegex = /^[a-zA-Z\d가-힣-]+$/;
	var updateEmailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	var updatePhoneRegex = /^010-\d{4}-\d{4}$/;
	
	var updateAddressDetailRegex = /^[a-zA-Z\d가-힣,()\s-]{1,40}$/;
	
    /* ------------- 닉네임 시작 ------------- */
    updateNicknameInput.focus(moveToUpdateValidateNickname).on('input', moveToUpdateValidateNickname).blur(moveToUpdateValidateNickname);
	
	function moveToUpdateValidateNickname() {
		$('#updateNicknameWarning').remove();
		updateValidateNickname($(this));
	}
	
    function updateValidateNickname(updateNickname) {
    	if(updateNickname.val() === '') {
            updateNicknameInput.closest('tr').after('<tr height=16px; id="updateNicknameWarning"><td colspan="3" class="validate">닉네임은 필수 입력사항입니다.</td ></tr>');
            isUpdateValid.updateNickname = false;
    	} else {
	    	if (!updateNicknameRegex.test(updateNickname.val())) {
	            updateNicknameInput.closest('tr').after('<tr height=16px; id="updateNicknameWarning"><td colspan="3" class="validate">닉네임은 한글, 영문, 숫자로 구성된 1자~15자여야 합니다.</td></tr>');
	        	isUpdateValid.updateNickname = false;
	        } else{
	        	$('#nicknameWarning').remove();
	        	isUpdateValid.updateNickname = true;
	        	isUpdateComplete();
	        }
        }
    }
    /* ------------- 닉네임 끝 ------------- */
    
    /* ------------- 이메일 시작 ------------- */
    updateEmailInput.focus(moveToUpdateValidateEmail).on('input', moveToUpdateValidateEmail).blur(moveToUpdateValidateEmail);
	
	function moveToUpdateValidateEmail() {
		$('#updateEmailWarning').remove();
		updateValidateEmail($(this));
	}
	
    function updateValidateEmail(updateEmail) {
    	if(updateEmail.val() === '') {
            updateEmailInput.closest('tr').after('<tr height=16px; id="updateEmailWarning"><td colspan="3" class="validate">이메일은 필수 입력사항입니다.</td ></tr>');
            isUpdateValid.updateEmail = false;
    	} else {
	    	if (!updateEmailRegex.test(updateEmail.val())) {
	            updateEmailInput.closest('tr').after('<tr height=16px; id="updateEmailWarning"><td colspan="3" class="validate">올바른 이메일을 입력해주세요.</td></tr>');
	        	isUpdateValid.updateEmail = false;
	        } else{
	        	$('#emailWarning').remove();
	        	isUpdateValid.updateEmail = true;
	        	isUpdateComplete();
	        }
        }
    }
    /* ------------- 이메일 끝 ------------- */
    
    /* ------------- 휴대폰 시작 ------------- */
    updatePhoneInput.on('input', function(event) {
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
	    moveToUpdateValidatePhone($(this));
	});
	
	updatePhoneInput.focus(moveToUpdateValidatePhone).blur(moveToUpdateValidatePhone);
	
	function moveToUpdateValidatePhone() {
		$('#updatePhoneWarning').remove();
		updateValidatePhone($(this));
	}
	
	function updateValidatePhone(updatePhone) {
    	if(updatePhone.val() === '') {
            updatePhone.closest('tr').after('<tr height=16px; id="updatePhoneWarning"><td colspan="3" class="validate">휴대폰 번호는 필수 입력사항입니다.</td ></tr>');
            isUpdateValid.updatePhone = false;
    	} else {
	    	if (!updatePhoneRegex.test(updatePhone.val())) {
	            updatePhone.closest('tr').after('<tr height=16px; id="updatePhoneWarning"><td colspan="3" class="validate">\'-\' 포함 올바른 번호를 입력해주세요.</td></tr>');
	        	isUpdateValid.updatePhone = false;
	        } else{
	        	$('#phoneWarning').remove();
	        	isUpdateValid.updatePhone = true;
	        	isUpdateComplete();
	        }
        }
    }
    /* ------------- 휴대폰 끝 ------------- */
    
    /* ------------- 일반주소 시작 ------------- */
	function updateValidateAddressNormal() {
		if (updateAddressNormalInput.val() !== '') {
		    isUpdateValid.updateAddressNormal = true;
		    isUpdateComplete();
		}
	}
	/* ------------- 일반주소 끝 ------------- */
    
    /* ------------- 상세주소 시작 ------------- */
    updateAddressDetailInput.focus(moveToUpdateValidateAddressDetail).on('input', moveToUpdateValidateAddressDetail).blur(moveToUpdateValidateAddressDetail);
	
	function moveToUpdateValidateAddressDetail() {
		$('#updateAddressDetailWarning').remove();
		updateValidateAddressDetail($(this));
	}
	
    function updateValidateAddressDetail(updateAddressDetail) {
    	if(updateAddressDetail.val() === '') {
            updateAddressDetailInput.closest('tr').after('<tr height=16px; id="updateAddressDetailWarning"><td colspan="3" class="validate">상세주소는 필수 입력사항입니다.</td ></tr>');
            isUpdateValid.updateAddressDetail = false;
    	} else {
	    	if (!updateAddressDetailRegex.test(updateAddressDetail.val())) {
	            updateAddressDetailInput.closest('tr').after('<tr height=16px; id="updateAddressDetailWarning"><td colspan="3" class="validate">올바른 상세주소를 입력해주세요.</td></tr>');
	        	isUpdateValid.updateAddressDetail = false;
	        } else{
	        	$('#addressDetailWarning').remove();
	        	isUpdateValid.updateAddressDetail = true;
	        	updateValidateAddressNormal();
	        	isUpdateComplete();
	        }
        }
    }
    
    $('.member-update-form #sample6_postcode').on('input', function() {
        var postcodeValue = $(this).val();
        var detailAddressInput = $('.member-update-form #sample6_detailAddress');
        
        // Check if the postcode value is not empty
        if (postcodeValue.trim() !== '') {
            detailAddressInput.removeAttr('readonly');
            detailAddressInput.prop('required', true);
        } else {
            detailAddressInput.attr('readonly', true);
            detailAddressInput.removeAttr('required');
        }
    });
    
    $('.member-update-form #sample6_address, .member-update-form #sample6_detailAddress').on('input', function() {
        var address = $('.member-update-form #sample6_address').val();
        var detailAddress = $('.member-update-form #sample6_detailAddress').val();
        var fullAddress = address + ' ' + detailAddress;
        $('.member-update-form #updateAddress').val(fullAddress);
    });
    
    /* ------------- 상세주소 끝 ------------- */
    
    var inputFields = document.querySelectorAll('input[name="updateNickname"], input[name="updateEmail"], input[name="updatePhone"], input[name="updateAddressPost"], input[name="updateAddressNormal"], input[name="updateAddressDetail"], input[name="updateAddressExtra"]');

	// 각 입력 필드에 대해 input 이벤트를 추가
	inputFields.forEach(function(inputField) {
	    inputField.addEventListener('input', function() {
	        isUpdateComplete();
	    });
	});
    
    function isUpdateComplete() {
    	var allClear = Object.values(isUpdateValid).every(Boolean);
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
/* ------------- 회원정보수정 유효성검사 끝 ------------- */