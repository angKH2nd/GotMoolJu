function toggleEtcDiv(className){
    var divs = document.querySelectorAll('.etc-toggle > div');

    divs.forEach(function(div) {
        if (div.classList.contains(className)) {
            div.style.display = div.style.display === 'block' ? 'none' : 'block';
        } else {
            resetInsertImprovementIdeation();
            div.style.display = 'none';
        }
    });
}

function cancelEtcDiv() {
    var divs = document.querySelectorAll('.etc-toggle > div');

    divs.forEach(function(div) {
    	resetInsertImprovementIdeation();
        div.style.display = 'none';
    });
}

function resetInsertImprovementIdeation() {
	/* ------------------- insertImprovementIdeation input 리셋 ------------------- */
	$("#loadCount").val(5);
	if($("#isLogin").val() !== 'blank'){
		loadComments(0, $("#loadCount").val());
	}
	$(".improvement-input-content textarea").val('');
	$("#improvement-input-count-span").html(0);
    $("#isSecret").val('S');
    $('.improvement-input-secret i').removeClass('fa-lock').addClass('fa-lock-open');
    /* ------------------- insertImprovementIdeation input 리셋 ------------------- */
}

function openMemberUpdateForm() {
	cancelDiv();
	toggleDiv('member');
	toggleMypageDiv('updateMemberForm');
}

function openHelpCenter() {
	cancelDiv();
	toggleDiv('helpCenter');
}

function openMemberDeleteForm() {
	cancelDiv();
	toggleDiv('member');
	toggleMypageDiv('updateMemberForm');
	openDeleteMemberForm();
}

function openRank() {
	cancelDiv();
	toggleDiv('rank');
}

function openCommunityHot() {
	cancelDiv();
	toggleDiv('community');
	toggleCommunity('communityHot');
}

/* ----------------- SNS ----------------- */
function openGithub() {
	window.open('https://github.com/angKH2nd/GotMoolJu', '_blank');
}

function openNotion() {
	window.open('https://nebula-eater-0cb.notion.site/Got-406e99dadbe442eabc0daab8e60b80f1?pvs=4', '_blank');
}

function openYoutube() {
	window.open('https://www.youtube.com/channel/UCSJ0A8tVouCZWrxBaYOXDXA', '_blank');
}

function openGot() {
	location.href = 'index.jsp';
}

if(!Kakao.isInitialized()) { // init 체크
	Kakao.init('4c522fb47a87ee4e17b005d7a33f1f99');
}

function kakaoShare() {
	Kakao.Link.sendCustom({
	    templateId: 107255,
	})
}
/* ----------------- SNS ----------------- */