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
        	console.log(data);
            if(data.result === "Y"){
            	$(".id-area #validateSmsTr").show();
            	$(".id-area #sendIdSms").prop('disabled', true);
            	$("#validateIdPhoneOrigin").val(data.random);
            }else {
            	alert("인증번호 발송에 실패했습니다.");
            }
        }, 
        error: function() {
            console.log("통신실패");
        }
    });
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