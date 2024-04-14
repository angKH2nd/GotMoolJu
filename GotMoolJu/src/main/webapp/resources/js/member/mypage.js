function toggleMypageDiv(className){
    var divs = document.querySelectorAll('.mypage-toggle > div');

    divs.forEach(function(div) {
        if (div.classList.contains(className)) {
            div.style.display = div.style.display === 'block' ? 'none' : 'block';
        } else {
            resetMemberUpdateForm();
            div.style.display = 'none';
        }
    });
}

function cancelMypageDiv() {
    var divs = document.querySelectorAll('.mypage-toggle > div');

    divs.forEach(function(div) {
    	resetMemberUpdateForm();
        div.style.display = 'none';
    });
}

function resetMemberUpdateForm() {
	/* ------------------- memberUpdateForm input 리셋 ------------------- */
    $("#update_postcode").val("");
    $("#update_address").val("");
    $("#update_detailAddress").val("");
    $("#update_extraAddress").val("");
    $("#validateUpdatePhone").val("");
	$("#validateUpdateEmail").val("");
    
    $('#updateNicknameWarning').remove();
    $('#updateEmailWarning').remove();
    $('#updatePhoneWarning').remove();
    $('#updateAddressDetailWarning').remove();
    
    $('#profilePicture img').attr('src', $('#originProfileImg').val());
    $("#updateNickname").val($("#originNickname").val());
    $("#updatePhone").val($("#originPhone").val());
    $("#updateEmail").val($("#originEmail").val());
    $("#updateAddress").val($("#originAddress").val());
    
    $("#updatePhoneSmsBtn").prop('disabled', 'true');
    $("#updateEmailSmsBtn").prop('disabled', 'true');
    $("#validateUpdatePhoneSmsBtn").prop('disabled', 'true');
	$("#validateUpdateEmailSmsBtn").prop('disabled', true);
    
    $(".can-update-form #validateUpdateSmsTr").hide();
    $(".can-update-form #validateUpdateEmailSmsTr").hide();
    /* ------------------- memberUpdateForm input 리셋 ------------------- */
}