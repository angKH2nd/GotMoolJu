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
	var baseUrl = '192.168.20.37:8222';
    var gotUrl = baseUrl + '/got';

    Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
        	title: '갓물주와 함께 내집마련을!',
        	description: '우리는 사람과 집을 연결하고, 더 나은 삶의 방식을 만듭니다.',
        	imageUrl: 'resources/images/got/got_logo_big.jpg',
        	link: {
	            mobileWebUrl: gotUrl,
	            webUrl: gotUrl,
        	},
        },
      	buttons: [
        {
          title: '웹으로 보기',
          link: {
              mobileWebUrl: gotUrl,
              webUrl: gotUrl,
          },
        },
      	],
        // 카카오톡 미설치 시 카카오톡 설치 경로이동
        installTalk: true,
    })
}


/* ----------------- SNS ----------------- */