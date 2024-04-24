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

var sendKakao = function() {
    // 메시지 공유 함수
    Kakao.Link.sendDefault({
    objectType: 'feed',
    content: {
      title: '제목을 여기에 씁니다.',
      description: '내용을 여기에 씁니다',
      imageUrl:
        'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FeB1Yj7%2Fbtrn8HKdp01%2FlZMtAuvo986os4dCkVoAOk%2Fimg.png',
      imageWidth: 1200,
      imageHeight: 630,
      link: {
        mobileWebUrl: 'https://developers.kakao.com',
        androidExecutionParams: 'test',
      },
    },
    itemContent: {
      profileText: '송송',
      profileImageUrl:
        'https://tistory1.daumcdn.net/tistory/373748/attach/af0ef0205e234b4f9f09d7bce27dd237',
    },
    buttons: [
      {
        title: '블로그 둘러보기',
        link: {
          mobileWebUrl: 'https://songsong.dev',
          webUrl: 'https://songsong.dev',
        },
      },
    ],
  });
};

/* ----------------- SNS ----------------- */