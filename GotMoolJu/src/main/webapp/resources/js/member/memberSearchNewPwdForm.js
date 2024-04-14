$(document).ready(function() {
    var searchNewPwdValid = {
        searchNewPwd: false,
        searchNewPwdCheck: false,
    };

    var searchNewPwdRegex = /^[a-zA-Z\d]{4,12}$/;

    $('input[name="searchNewPwd"]').keyup(function(){
    	$('#newPwdWarning').remove();
        if (!searchNewPwdRegex.test($(this).val())) {
        	$(this).closest('tr').after('<tr height=16px; id="newPwdWarning" class="wm"><td colspan="3" class="validate">비밀번호는 영문, 숫자로 구성된 4자~12자여야 합니다.</td></tr>');
            searchNewPwdValid.searchNewPwd = false;
        } else {
        	$('#newPwdWarning').remove();
            searchNewPwdValid.searchNewPwd = true;
        }
        searchNewPwdClear();
    });

    $('input[name="searchNewPwdCheck"]').keyup(function(){
    	$('#newPwdCheckWarning').remove();
        if ($('input[name="searchNewPwd"]').val() !== $(this).val()) {
        	$(this).closest('tr').after('<tr height=16px; id="newPwdCheckWarning" class="wm"><td colspan="3" class="validate">비밀번호는 영문, 숫자로 구성된 4자~12자여야 합니다.</td></tr>');
            searchNewPwdValid.searchNewPwdCheck = false;
        } else {
        	$('#newPwdWarning').remove();
            searchNewPwdValid.searchNewPwdCheck = true;
        }
        searchNewPwdClear();
    });

    function searchNewPwdClear() {
        var allClear = Object.values(searchNewPwdValid).every(Boolean);
        var searchNewPwdBtn = $(".new-pwd-area #searchNewPwdBtn");

        if (allClear) {
            searchNewPwdBtn.prop('disabled', false);
            searchNewPwdBtn.css('backgroundColor', '#002250').css('color', 'white');
        } else {
            searchNewPwdBtn.prop('disabled', true);
            searchNewPwdBtn.css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
        }
    }
});

function searchNewPwd() {
	$.ajax({
		url: "searchNewPwd.me",
		data: {
        	searchNewPwd: $("#searchNewPwd").val(),
        	searchNewPwdUserId: $("#searchNewPwdUserId").val()
    	},
    	success: function(result){
    		if(result > 0) {
    			swal('비밀번호 변경 성공!', "성공적으로 비밀번호가 변경되었습니다.", 'success');
    			openLoginForm();
    		} else {
    			swal('비밀번호 변경 실패!', "존재하지 않거나, 탈퇴한 회원입니다.", 'warning');
    		}
			closeNewPwdForm();
			$(".new-pwd-area #searchNewPwdBtn").prop('disabled', true);
			$(".new-pwd-area #searchNewPwdBtn").css('backgroundColor', 'white').css('color', 'lightgray').css('border', 'none');
    	}, error: function(){
    		swal('비밀번호 변경 실패!', "잠시 후 다시 시도해주세요. 문제가 계속될 경우 관리자에게 문의 부탁드립니다.", 'warning');
    	}
	})
}