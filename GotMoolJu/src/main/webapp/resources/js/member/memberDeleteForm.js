$(document).ready(function() {
    var deletePwdValid = {
        deletePwd: false,
        deletePwdCheck: false,
    };

    var deletePwdRegex = /^[a-zA-Z\d]{4,12}$/;

    $('input[name="deletePwd"]').keyup(function(){
    	$('#deletePwdWarning').remove();
        if (!deletePwdRegex.test($(this).val())) {
        	$(this).closest('tr').after('<tr height=16px; id="deletePwdWarning"><td colspan="3" class="validate">비밀번호는 영문, 숫자로 구성된 4자~12자여야 합니다.</td></tr>');
            deletePwdValid.deletePwd = false;
        } else {
        	$('#newPwdWarning').remove();
            deletePwdValid.deletePwd = true;
        }
        deletePwdClear();
    });

    $('input[name="deletePwdCheck"]').keyup(function(){
    	$('#deletePwdCheckWarning').remove();
        if ($('input[name="deletePwd"]').val() !== $(this).val()) {
        	$(this).closest('tr').after('<tr height=16px; id="deletePwdCheckWarning"><td colspan="3" class="validate">비밀번호가 일치하지 않습니다.</td></tr>');
            deletePwdValid.deletePwdCheck = false;
        } else {
        	$('#newPwdWarning').remove();
            deletePwdValid.deletePwdCheck = true;
        }
        deletePwdClear();
    });

    function deletePwdClear() {
        var allClear = Object.values(deletePwdValid).every(Boolean);
        var deletePwdBtn = $(".delete-area #deletePwdBtn");

        if (allClear) {
            deletePwdBtn.prop('disabled', false);
            deletePwdBtn.css('backgroundColor', '#002250').css('color', 'white');
        } else {
            deletePwdBtn.prop('disabled', true);
            deletePwdBtn.css('backgroundColor', '#fafafa').css('color', 'black');
        }
    }
});

function deleteMember() {
  	  $.ajax({
     	 url: "delete.me",
      	 data: {
      		deletePwd: $("#deletePwd").val()
      	 },
      	 success: function (result) {
      	 	 console.log(result);
      	 	 if(result > 0) {
      	 	 	 location.href = "home.got";
      	 	 }
      	 }, error: function () {
      	     swal('회원탈퇴 실패!', "잠시 후 다시 시도해주세요. 문제가 계속될 경우 관리자에게 문의 부탁드립니다.", 'warning');
         }
      })
}