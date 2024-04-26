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
    
    if(className === 'memberDibsList'){
    	selectDibsList();
    }
}

function selectDibsList(){

	let dibsList = "";
	$.ajax({
		url:"selectDibsList.ma",
		success:function(data){

			for(let i=0; i<data.length; i++){
				dibsList += `
						    <div class='detailMap-apt' onclick="toggleAptDetailDiv('aptDetailForm', ${data[i].dibsAptNo});">
						        <div class='detailMap-apt-img centerXY hoverZ'>
						            <img src='${data[i].aptImgUrl}'>
						        </div>
						        <div class='detailMap-apt-content'>
						            <div><i class="fa-brands fa-bandcamp"></i> 매물번호 <span style="color: blue;">${data[i].dibsAptNo}</span></div>
						            <ul>
						                <li><i class="fa-solid fa-sack-dollar"></i> ${data[i].aptSellingType}${data[i].aptPrice}</li>
						                <li><i class="fa-solid fa-building"></i> &nbsp;${data[i].aptName}</li>
						                <li><i class="fa-solid fa-tag"></i> <span style="color: gray;">${data[i].aptDesc}</span></li>
						            </ul>
						        </div>
						    </div>
						   `;
			}


			$(".member-dibs-form-content").html(dibsList);

		},
		error:function(){

		}
	})
}

function openCalFromMem() {
	toggleDiv('etc');
	toggleEtcDiv('calculateTax');
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

	$.ajax({
		url:"countLike.me",
		data:{
			userNo:$("#userNo").val()
		},
		success:function(result){
			if(result > 0){
				$(".mypage-dibs-count").html(result);
			}else{
				$(".mypage-dibs-count").html(0);
			}
			
		},
		error:function(){
			console.log("좋아요 카운트 오류")
		}
	})

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
