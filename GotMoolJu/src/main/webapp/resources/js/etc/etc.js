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

/* ----------------- SNS ----------------- */
function openGithub() {
	location.href = 'https://github.com/angKH2nd/GotMoolJu';
}

function openNotion() {
	location.href = 'https://nebula-eater-0cb.notion.site/Got-406e99dadbe442eabc0daab8e60b80f1?pvs=4';
}
/* ----------------- SNS ----------------- */