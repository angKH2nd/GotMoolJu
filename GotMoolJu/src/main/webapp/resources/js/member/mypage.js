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

function openMyStar() {
	toggleDiv('member');
	toggleDiv('community');
	toggleCommunity('town');
}

function openCommunityEnrollForm() {
	openMyStar();
	changeTownArea();
}

$(document).ready(function() {
	if($(".mypage-name").html() !== ''){
		selectMemberMypageStar();
	}
})

function selectMemberMypageStar() {
	$.ajax({
		url: "selectMyBestTown.cm",
		success: function(data) {
			if(data.townNo !== undefined){
				$(".mypage-popular-center-title").html(data.townTitle);
				$(".mypage-popular-star-count").html(data.townStar);
				$(".mypage-popular-likes-count").html(data.townLikes);
				$(".mypage-popular-reply-count").html(data.townReplyCount);
				$(".mypage-popular-click-count").html(data.townClick);
			}else {
				var mypagePopularHtml = `<div class="mypage-popular-no-write centerXY">
											<div class="centerXY">작성한 커뮤니티 게시글이 없습니다.<br>커뮤니티에 글을 작성해보세요!<br><br></div>
											<div class="mh" style="color: #434d68;" onclick="openCommunityEnrollForm();"><i class="fa-solid fa-pencil"></i> 글 작성하기</div>
										</div>`;
				$(".mypage-star-popular-community").html(mypagePopularHtml);
			}
		}, error: function() {
			console.log('조회실패');
		}
	})
	
	$.ajax({
		url: "selectMyStarCount.cm",
		success: function(data) {
			if(data > 0){
				$(".mypage-star-count").html(data);
			}else {
				$(".mypage-star-count").html(0);
			}
		}, error: function() {
			console.log('조회실패');
		}
	})
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