$(document).ready(function() {
    var searchNewPwdValid = {
        searchNewPwd: false,
        searchNewPwdCheck: false,
    };

    var searchNewPwdRegex = /^[a-zA-Z\d]{4,12}$/;

    $(".new-pwd-area #searchNewPwd").keyup(function(){
        if (!searchNewPwdRegex.test($(this).val())) {
            searchNewPwdValid.searchNewPwd = false;
        } else {
            searchNewPwdValid.searchNewPwd = true;
        }
        searchNewPwdClear();
    });

    $(".new-pwd-area #searchNewPwdCheck").keyup(function(){
        if ($(".new-pwd-area #searchNewPwd").val() !== $(this).val()) {
            searchNewPwdValid.searchNewPwdCheck = false;
        } else {
            searchNewPwdValid.searchNewPwdCheck = true;
        }
        searchNewPwdClear();
    });

    function searchNewPwdClear() {
        var allClear = Object.values(searchNewPwdValid).every(Boolean);
        var searchNewPwdBtn = $(".new-pwd-area #searchNewPwdBtn");

        if (allClear) {
            searchNewPwdBtn.prop('disabled', false);
            searchNewPwdBtn.css('backgroundColor', '#002250');
        } else {
            searchNewPwdBtn.prop('disabled', true);
            searchNewPwdBtn.css('backgroundColor', 'gray');
        }
    }
});
