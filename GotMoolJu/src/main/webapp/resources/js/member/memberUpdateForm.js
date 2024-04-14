/* ------------- 회원정보수정 유효성검사 시작 ------------- */
$(document).ready(function() {
	var isUpdateValid = {
		updateNickname: true,
		updateEmail: true,
		updatePhone: true,
		updateAddress: true,
		updateAddressNormal: true,
		updateAddressDetail: true,
	};
	
	$(".can-update-form #validateUpdateSmsTr").hide();
	$(".can-update-form #validateUpdateEmailSmsTr").hide();
	
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
            updateNicknameInput.closest('tr').after('<tr height=16px; id="updateNicknameWarning" class="uwm"><td colspan="3" class="validate">닉네임은 필수 입력사항입니다.</td ></tr>');
            isUpdateValid.updateNickname = false;
    	} else {
	    	if (!updateNicknameRegex.test(updateNickname.val())) {
	            updateNicknameInput.closest('tr').after('<tr height=16px; id="updateNicknameWarning" class="uwm"><td colspan="3" class="validate">닉네임은 한글, 영문, 숫자로 구성된 1자~15자여야 합니다.</td></tr>');
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
            $(updateEmail).closest('tr').after('<tr height=16px; id="updateEmailWarning" class="uwm"><td colspan="3" class="validate">이메일은 필수 입력사항입니다.</td ></tr>');
            $("#updateEmailSmsBtn").prop('disabled', true);
            isUpdateValid.updateEmail = false;
    	} else {
	    	if (!updateEmailRegex.test(updateEmail.val())) {
	            $(updateEmail).closest('tr').after('<tr height=16px; id="updateEmailWarning" class="uwm"><td colspan="3" class="validate">올바른 이메일을 입력해주세요.</td></tr>');
	        	$("#updateEmailSmsBtn").prop('disabled', true);
	        	isUpdateValid.updateEmail = false;
	        } else{
	        	if(updateEmail.val() === $("#originEmail").val()){
	        		$('#updateEmailWarning').remove();
	        		$("#updateEmailSmsBtn").prop('disabled', true);
	        		$(updateEmail).closest('tr').after('<tr height=16px; id="updateEmailWarning" class="uwm"><td colspan="3" class="validateComplete">인증된 메일입니다.</td></tr>');
		        	isUpdateValid.updateEmail = true;
		        	isUpdateComplete();
	        	}else {
	        		$("#updateEmailSmsBtn").prop('disabled', false);
	        		$(updateEmail).closest('tr').after('<tr height=16px; id="updateEmailWarning" class="uwm"><td colspan="3" class="validate">신규 메일 등록을 위해 인증해주세요.</td></tr>')
		        	isUpdateValid.updateEmail = false;
	        	}
	        }
        }
    }
    
    $("#updateEmailSmsBtn").click(function(){
    	if (!$(this).prop('disabled')) {
    		$.ajax({
		        type: "POST",
		        url: "sendUpdateEmailSms.me",
		        data: {
		        	updateName: $("#updateName").val(),
		        	updateEmail: $("#updateEmail").val()
		    	},
		        success: function(data) {
	            	swal('인증메일 발송 완료!', "발송된 인증번호를 입력해주세요.", 'success');
	            	$("#validateUpdateEmailOrigin").val(data);
	            	$(".can-update-form #validateUpdateEmailSmsTr").show();
	            	$(".can-update-form #updateEmailSmsBtn").prop('disabled', true);
		        }, 
		        error: function() {
		        	swal('인증메일 발송 실패!', "관리자에게 문의해주세요", 'warning');
		        }
		    });
    	}
    })
    
    $("#validateUpdateEmail").keyup(function(){
    	var input = $(this).val();
	    var button = $("#validateUpdateEmailSmsBtn");
	    
	    if (input.trim() === "") {
	        button.prop('disabled', true);
	    } else {
	        button.prop('disabled', false);
	    }
    });
    
    $("#validateUpdateEmailSmsBtn").click(function(){
    	if($("#validateUpdateEmail").val() === $("#validateUpdateEmailOrigin").val()){
			// 인증번호 일치할 경우
			swal('인증 성공!', "인증번호가 확인되었습니다.", 'success');
			$('#updateEmailWarning').remove();
    		$("#updateEmailSmsBtn").prop('disabled', true);
			$(updateEmail).closest('tr').after('<tr height=16px; id="updateEmailWarning" class="uwm"><td colspan="3" class="validateComplete">인증된 번호입니다.</td></tr>');
        	$("#validateUpdateEmail").val("");
        	$(".can-update-form #validateUpdateEmailSmsTr").hide();
        	isUpdateValid.updateEmail = true;
        	isUpdateComplete();
		}else {
			// 인증번호 일치하지 않을 경우
			swal('인증 실패!', "인증번호가 일치하지 않습니다. 확인해주세요.", 'warning');
			$("#validateUpdateEmail").focus();
		}
    });
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
	    $('#updatePhoneWarning').remove();
	    moveToUpdateValidatePhone($(this));
	});
	
	updatePhoneInput.focus(moveToUpdateValidatePhone).blur(moveToUpdateValidatePhone);
	
	function moveToUpdateValidatePhone() {
		$('#updatePhoneWarning').remove();
		updateValidatePhone(this);
	}
	
	function updateValidatePhone(updatePhone) {
    	if(updatePhone.value === '') {
            $(updatePhone).closest('tr').after('<tr height=16px; id="updatePhoneWarning" class="uwm"><td colspan="3" class="validate">휴대폰 번호는 필수 입력사항입니다.</td ></tr>');
            $("#updatePhoneSmsBtn").prop('disabled', true);
            isUpdateValid.updatePhone = false;
    	} else {
	    	if (!updatePhoneRegex.test(updatePhone.value)) {
	            $(updatePhone).closest('tr').after('<tr height=16px; id="updatePhoneWarning" class="uwm"><td colspan="3" class="validate">\'-\' 포함 올바른 번호를 입력해주세요.</td></tr>');
	        	$("#updatePhoneSmsBtn").prop('disabled', true);
	        	isUpdateValid.updatePhone = false;
	        } else{
	        	if(updatePhone.value === $("#originPhone").val()){
	        		$('#updatePhoneWarning').remove();
	        		$("#updatePhoneSmsBtn").prop('disabled', true);
	        		$(updatePhone).closest('tr').after('<tr height=16px; id="updatePhoneWarning" class="uwm"><td colspan="3" class="validateComplete">인증된 번호입니다.</td></tr>');
		        	isUpdateValid.updatePhone = true;
		        	isUpdateComplete();
	        	}else {
	        		$("#updatePhoneSmsBtn").prop('disabled', false);
	        		$(updatePhone).closest('tr').after('<tr height=16px; id="updatePhoneWarning" class="uwm"><td colspan="3" class="validate">신규 번호 등록을 위해 인증해주세요.</td></tr>')
		        	isUpdateValid.updatePhone = false;
	        	}
	        }
        }
    }
    
    $("#updatePhoneSmsBtn").click(function(){
    	if (!$(this).prop('disabled')) {
    		$.ajax({
		        type: "POST",
		        url: "sendUpdateSms.me",
		        data: {
		        	UpdatePhone: $("#updatePhone").val().replace(/-/g, '')
		    	},
		        success: function(data) {
		            if(data.result === "Y"){
		            	swal('인증번호 발송 완료!', "발송된 인증번호를 입력해주세요.", 'success');
		            	$(".can-update-form #validateUpdateSmsTr").show();
		            	$(".can-update-form #updatePhoneSmsBtn").prop('disabled', true);
		            	$("#validateUpdatePhoneOrigin").val(data.random);
		            }else {
		        		swal('인증번호 발송 실패!', "휴대폰번호를 확인해주세요.", 'warning');
		            }
		        }, 
		        error: function() {
		        	swal('인증번호 발송 실패!', "관리자에게 문의해주세요", 'warning');
		        }
		    });
    	}
    })
    
    $("#validateUpdatePhone").keyup(function(){
    	var input = $(this).val();
	    var button = $("#validateUpdatePhoneSmsBtn");
	    
	    if (input.trim() === "") {
	        button.prop('disabled', true);
	    } else {
	        button.prop('disabled', false);
	    }
    });
    
    $("#validateUpdatePhoneSmsBtn").click(function(){
    	if($("#validateUpdatePhone").val() === $("#validateUpdatePhoneOrigin").val()){
			// 인증번호 일치할 경우
			swal('인증 성공!', "인증번호가 확인되었습니다.", 'success');
			$('#updatePhoneWarning').remove();
    		$("#updatePhoneSmsBtn").prop('disabled', true);
			$(updatePhone).closest('tr').after('<tr height=16px; id="updatePhoneWarning" class="uwm"><td colspan="3" class="validateComplete">인증된 번호입니다.</td></tr>');
        	$("#validateUpdatePhone").val("");
        	$(".can-update-form #validateUpdateSmsTr").hide();
        	isUpdateValid.updatePhone = true;
        	isUpdateComplete();
		}else {
			// 인증번호 일치하지 않을 경우
			swal('인증 실패!', "인증번호가 일치하지 않습니다. 확인해주세요.", 'warning');
			$("#validateUpdatePhone").focus();
		}
    });
    
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
            updateAddressDetailInput.closest('tr').after('<tr height=16px; id="updateAddressDetailWarning" class="uwm"><td colspan="3" class="validate">상세주소는 필수 입력사항입니다.</td ></tr>');
            isUpdateValid.updateAddress = false;
            isUpdateValid.updateAddressDetail = false;
    	} else {
	    	if (!updateAddressDetailRegex.test(updateAddressDetail.val())) {
	            updateAddressDetailInput.closest('tr').after('<tr height=16px; id="updateAddressDetailWarning" class="uwm"><td colspan="3" class="validate">올바른 상세주소를 입력해주세요.</td></tr>');
	        	isUpdateValid.updateAddress = false;
	        	isUpdateValid.updateAddressDetail = false;
	        } else{
	        	$('#addressDetailWarning').remove();
	        	isUpdateValid.updateAddress = true;
	        	isUpdateValid.updateAddressDetail = true;
	        	updateValidateAddressNormal();
	        	isUpdateComplete();
	        }
        }
    }
    
    $('.member-update-form #update_postcode').on('input', function() {
        var postcodeValue = $(this).val();
        var detailAddressInput = $('.member-update-form #update_detailAddress');
        
        // Check if the postcode value is not empty
        if (postcodeValue.trim() !== '') {
            detailAddressInput.removeAttr('readonly');
            detailAddressInput.prop('required', true);
        } else {
            detailAddressInput.attr('readonly', true);
            detailAddressInput.removeAttr('required');
        }
    });
    
    $('.member-update-form #update_detailAddress').on('input', function() {
        var address = $('.member-update-form #update_address').val();
        var detailAddress = $('.member-update-form #update_detailAddress').val();
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
		var submitBtn = $("#update-submit-btn");

		if (allClear) {
			submitBtn.prop('disabled', false);
		} else {
			submitBtn.prop('disabled', true);
		}
    }
});
/* ------------- 회원정보수정 유효성검사 끝 ------------- */

function updateAddress() {
	var address = $('.member-update-form #update_address').val();
    var detailAddress = $('.member-update-form #update_detailAddress').val();
    var fullAddress = address + ' ' + detailAddress;
    $('.member-update-form #updateAddress').val(fullAddress);
    $("#update_detailAddress").removeAttr('readonly');
    $("#update-submit-btn").prop('disabled', true);
}

/* ------------- 프사 변경 시작 ------------- */
// 프로필 사진 변경 버튼을 클릭하면 파일 선택 창이 나타남
document.getElementById('profilePicture').addEventListener('click', function() {
    document.getElementById('updateProfileImg').click();
});

// 파일 선택이 완료되면 해당 이미지를 프로필 사진으로 변경
document.getElementById('updateProfileImg').addEventListener('change', function(event) {
    var file = event.target.files[0]; // 선택한 파일 가져오기
    
    // 파일이 선택되었는지 확인
    if (file) {
        var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체 생성

        // 파일 읽기가 완료되면 실행되는 콜백 함수
        reader.onload = function() {
            // 읽어들인 이미지를 프로필 사진으로 설정
            document.getElementById('profilePicture').querySelector('img').src = reader.result;
        };

        // 선택한 파일을 읽어들임
        reader.readAsDataURL(file);
    }
});
/* ------------- 프사 변경 끝 ------------- */
function updateMember() {
    // FormData 객체 생성
    var formData = new FormData();

    // 프로필 이미지 파일을 선택한 경우에만 FormData에 추가
    if (document.getElementById('updateProfileImg').files.length > 0) {
        var profileImgFile = document.getElementById('updateProfileImg').files[0];
        formData.append('profileImg', profileImgFile);
    }

    // 기타 회원 정보 데이터를 FormData에 추가
    formData.append('updateNickname', $('#updateNickname').val());
    formData.append('updatePhone', $('#updatePhone').val());
    formData.append('updateEmail', $('#updateEmail').val());
    formData.append('updateAddress', $('#updateAddress').val());

	if (document.getElementById('updateProfileImg').files.length > 0) {
	    $.ajax({
	        url: "updateFile.me",
	        type: 'POST',
	        data: formData,
	        processData: false, // processData를 false로 설정하여 FormData를 변환하지 않도록
	        contentType: false, // contentType을 false로 설정하여 기본 contentType을 사용하지 않도록
	        success: function(result) {
	        	if(result > 0) {
	        		swal('회원정보변경 성공!', '성공적으로 변경되었습니다.', 'success');
	        		location.href = "home.got";
	        	}else {
	        		swal('회원정보변경 실패!', '관리자에게 문의해주세요', 'warning');
	        	}
	        },
	        error: function() {
	            swal('회원정보변경 실패!', '관리자에게 문의해주세요', 'warning');
	        }
	    });
	}else {
		$.ajax({
	        url: "update.me",
	        type: 'POST',
	        data: formData,
	        processData: false, // processData를 false로 설정하여 FormData를 변환하지 않도록
	        contentType: false, // contentType을 false로 설정하여 기본 contentType을 사용하지 않도록
	        success: function(result) {
	        	if(result > 0) {
	        		swal('회원정보변경 성공!', '성공적으로 변경되었습니다.', 'success');
	        		location.href = "home.got";
	        	}else {
	        		swal('회원정보변경 실패!', '관리자에게 문의해주세요', 'warning');
	        	}
	        },
	        error: function() {
	            swal('회원정보변경 실패!', '관리자에게 문의해주세요', 'warning');
	        }
	    });
	}
}

/* ------------- 회원탈퇴 시작 ------------- */
function openDeleteMemberForm() {
	openBg();
	$('.modal-delete-wrap').show();
}

function closeDeleteMemberForm() {
	$("#deletePwd").val("");
	$("#deletePwdCheck").val("");
	$("#deletePwdBtn").prop('disabled', 'true');
	$("#deletePwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
	closeBg();
	$('.modal-delete-wrap').hide();
}
/* ------------- 회원탈퇴 끝 ------------- */

/* ------------- 비밀번호변경 시작 ------------- */
function openUpdatePwdForm() {
	openBg();
	$('.modal-update-pwd-wrap').show();
}

function closeUpdatePwdForm() {
	$("#updatePwd").val("");
	$("#updatePwdCheck").val("");
	$("#updatePwdBtn").prop('disabled', 'true');
	$("#updatePwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
	closeBg();
	$('.modal-update-pwd-wrap').hide();
}
/* ------------- 비밀번호변경 끝 ------------- */

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
            
            updateAddress();
            
            // 커서를 상세주소 필드로 이동
            document.getElementById("update_detailAddress").focus();
        }
    }).open();
}
/* ------------- 도로명주소 api 끝 ------------- */