$(document).ready(function() {
	$('input[type="number"]').keyup(function() {
        // 입력된 값의 길이가 최대 길이보다 큰지 확인
        if ($(this).val().length > $(this).attr('maxlength')) {
            // 입력된 값이 최대 길이를 초과하면 최대 길이까지 자르기
            $(this).val($(this).val().slice(0, $(this).attr('maxlength')));
        }
    });

    // 페이지 로드 시 validateSmsTr 숨기기
    $(".id-area #validateSmsTr").hide();
    $(".pwd-area #validateSmsTr").hide();

    var searchIdValid = {
        searchIdName: false,
        searchIdPhone: false,
    };
    
    var searchPwdValid = {
        searchPwdId: false,
        searchPwdPhone: false,
    };

    var searchIdNameRegex = /^[가-힣]{3,}$/;
    var searchIdPwdPhoneRegex = /^010\d{8}$/;
    
    var searchPwdIdRegex = /^[a-zA-Z\d]{4,10}$/;

    $(".id-area #searchIdName").keyup(function(){
        if (!searchIdNameRegex.test($(this).val())) {
            searchIdValid.searchIdName = false;
        } else {
            searchIdValid.searchIdName = true;
        }
        idClear();
    });

    $(".id-area #searchIdPhone").keyup(function(){
        if (!searchIdPwdPhoneRegex.test($(this).val())) {
            searchIdValid.searchIdPhone = false;
        } else {
            searchIdValid.searchIdPhone = true;
        }
        idClear();
    });

    function idClear() {
        var allClear = Object.values(searchIdValid).every(Boolean);
        var sendSmsBtn = $(".id-area #sendIdSms");

        if (allClear) {
            sendSmsBtn.prop('disabled', false);
            sendSmsBtn.css('backgroundColor', '#002250');
        } else {
            sendSmsBtn.prop('disabled', true);
            sendSmsBtn.css('backgroundColor', 'gray');
        }
    }
    
    $(".pwd-area #searchPwdId").keyup(function(){
        if (!searchPwdIdRegex.test($(this).val())) {
            searchPwdValid.searchPwdId = false;
        } else {
            searchPwdValid.searchPwdId = true;
        }
        pwdClear();
    });

    $(".pwd-area #searchPwdPhone").keyup(function(){
        if (!searchIdPwdPhoneRegex.test($(this).val())) {
            searchPwdValid.searchPwdPhone = false;
        } else {
            searchPwdValid.searchPwdPhone = true;
        }
        pwdClear();
    });

    function pwdClear() {
        var allClear = Object.values(searchPwdValid).every(Boolean);
        var sendSmsBtn = $(".pwd-area #sendPwdSms");

        if (allClear) {
            sendSmsBtn.prop('disabled', false);
            sendSmsBtn.css('backgroundColor', '#002250');
        } else {
            sendSmsBtn.prop('disabled', true);
            sendSmsBtn.css('backgroundColor', 'gray');
        }
    }
});

function sendIdSms() {
    $.ajax({
        type: "POST",
        url: "sendIdSms",
        data: {
        	searchIdName: $("#searchIdName").val(),
        	searchIdPhone: $("#searchIdPhone").val()
    	},
        success: function(data) {
            if(data.result === "Y"){
            	swal('인증번호 발송 완료!', "발송된 인증번호를 입력해주세요.", 'success');
            	$(".id-area #validateSmsTr").show();
            	$(".id-area #sendIdSms").prop('disabled', true);
            	$("#validateIdPhoneOrigin").val(data.random);
            }else {
            	alert("인증번호 발송에 실패했습니다.");
        		swal('인증번호 발송 실패!', "이름과 휴대폰번호를 확인해주세요.", 'warning');
            }
        }, 
        error: function() {
        	swal('인증번호 발송 실패!', "관리자에게 문의해주세요", 'warning');
        }
    });
}

function checkIdSmsInput() {
	var input = $("#validateIdPhone").val();
    var button = $("#validateIdPhoneBtn");
    
    if (input.trim() === "") {
        button.disabled = true;
        button.css('backgroundColor', 'gray');
    } else {
        button.disabled = false;
        button.css('backgroundColor', '#002250');
    }
}

function validateIdSms() {
	if($("#validateIdPhoneOrigin").val() === $("#validateIdPhone").val()){
		// 인증번호 일치할 경우
		swal('인증 성공!', "인증번호가 확인되었습니다. 아이디 찾기를 진행해주세요.", 'success');
		console.log("일치함");
		$("#searchIdBtn").prop('disabled', false);
		$("#searchIdBtn").css('backgroundColor', '#002250');
		$("#sendIdSms").prop('disabled', true);
		$("#validateIdPhoneBtn").prop('disabled', true);
	}else {
		// 인증번호 일치하지 않을 경우
		swal('인증 실패!', "인증번호가 일치하지 않습니다. 확인해주세요.", 'warning');
		console.log("일치하지않음");
		$("#searchIdBtn").prop('disabled', true);
		$("#searchIdBtn").css('backgroundColor', 'gray');
	}
}

function openIdForm() {
    // id-area를 보이도록 설정
    document.querySelector('.id-area').style.display = 'block';
    // pwd-area를 숨김
    document.querySelector('.pwd-area').style.display = 'none';

    // id 버튼 스타일 변경
    document.querySelector('.id-select-btn button').style.color = '#0f0b26';
    document.querySelector('.id-select-btn button').style.borderBottom = '2px solid #0f0b26';

    // pwd 버튼 스타일 초기화
    document.querySelector('.pwd-select-btn button').style.color = 'gray';
    document.querySelector('.pwd-select-btn button').style.borderBottom = '1px solid gray';
}

function openPwdForm() {
    // pwd-area를 보이도록 설정
    document.querySelector('.pwd-area').style.display = 'block';
    // id-area를 숨김
    document.querySelector('.id-area').style.display = 'none';

    // pwd 버튼 스타일 변경
    document.querySelector('.pwd-select-btn button').style.color = '#0f0b26';
    document.querySelector('.pwd-select-btn button').style.borderBottom = '2px solid #0f0b26';

    // id 버튼 스타일 초기화
    document.querySelector('.id-select-btn button').style.color = 'gray';
    document.querySelector('.id-select-btn button').style.borderBottom = '1px solid gray';
}