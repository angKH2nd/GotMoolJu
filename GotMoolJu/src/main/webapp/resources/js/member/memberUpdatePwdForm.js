$(document).ready(function() {
    var updatePwdValid = {
        updatePwd: false,
        updatePwdCheck: false,
    };

    var updatePwdRegex = /^[a-zA-Z\d]{4,12}$/;

    $('input[name="updatePwd"]').keyup(function(){
    	$('#updatePwdWarning').remove();
        if (!updatePwdRegex.test($(this).val())) {
        	$(this).closest('tr').after('<tr height=16px; id="updatePwdWarning" class="wm"><td colspan="3" class="validate">비밀번호는 영문, 숫자로 구성된 4자~12자여야 합니다.</td></tr>');
            updatePwdValid.updatePwd = false;
        } else {
        	$('#updatePwdWarning').remove();
            updatePwdValid.updatePwd = true;
        }
        updatePwdClear();
    });

    $('input[name="updatePwdCheck"]').keyup(function(){
    	$('#updatePwdCheckWarning').remove();
        if ($('input[name="updatePwd"]').val() !== $(this).val()) {
        	$(this).closest('tr').after('<tr height=16px; id="updatePwdCheckWarning" class="wm"><td colspan="3" class="validate">비밀번호는 영문, 숫자로 구성된 4자~12자여야 합니다.</td></tr>');
            updatePwdValid.updatePwdCheck = false;
        } else {
        	$('#updatePwdWarning').remove();
            updatePwdValid.updatePwdCheck = true;
        }
        updatePwdClear();
    });
    
    function updatePwdClear() {
        var allClear = Object.values(updatePwdValid).every(Boolean);
        var updatePwdBtn = $(".update-pwd-area #updatePwdBtn");

        if (allClear) {
            updatePwdBtn.prop('disabled', false);
            updatePwdBtn.css('backgroundColor', '#002250').css('color', 'white');
        } else {
            updatePwdBtn.prop('disabled', true);
            updatePwdBtn.css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
        }
    }
});

function updatePwd() {
	$.ajax({
		url: "updatePwd.me",
		data: {
        	updatePwd: $("#updatePwd").val()
    	},
    	success: function(result){
    		if(result > 0) {
    			swal('비밀번호 변경 성공!', "성공적으로 비밀번호가 변경되었습니다. 다시 로그인 해주세요.", 'success');
    			closeUpdatePwdForm();
    			$(".update-pwd-area #updatePwdBtn").prop('disabled', true);
    			$(".update-pwd-area #updatePwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
    			setTimeout(function() {
                    location.href = "home.got";
                }, 3000);
    		} else {
    			swal('비밀번호 변경 실패!', "존재하지 않거나, 탈퇴한 회원입니다.", 'warning');
    			closeUpdatePwdForm();
    			$(".update-pwd-area #searchUpdatePwdBtn").prop('disabled', true);
    			$(".update-pwd-area #searchUpdatePwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
    		}
    	}, error: function(){
    		swal('비밀번호 변경 실패!', "잠시 후 다시 시도해주세요. 문제가 계속될 경우 관리자에게 문의 부탁드립니다.", 'warning');
    	}
	})
}