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

/* ------------- 회원탈퇴 시작 ------------- */
function openDeleteMemberForm() {
	openBg();
	$('.modal-delete-wrap').show();
}

function closeDeleteMemberForm() {
	$("#deletePwd").val("");
	$("#deletePwdCheck").val("");
	closeBg();
	$('.modal-delete-wrap').hide();
}
/* ------------- 회원탈퇴 끝 ------------- */

/* ------------- 도로명주소 api 시작 ------------- */
function updateMemberAddress() {
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
                document.getElementById("update_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("update_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다
            document.getElementById('update_postcode').value = data.zonecode;
            document.getElementById("update_address").value = addr;
            // 커서를 상세주소 필드로 이동
            document.getElementById("update_detailAddress").focus();
        }
    }).open();
}
/* ------------- 도로명주소 api 끝 ------------- */