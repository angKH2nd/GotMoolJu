$(document).ready(function() {
    toggleIntroduce('introduceCompany');
});

function toggleIntroduce(divClass) {
    var divs = document.querySelectorAll('.introduce-bar-toggle > div');
    divs.forEach(function(div) {
        div.style.display = 'none';
    });

    var selectedDiv = document.querySelector('.' + divClass);
    if (selectedDiv) {
        selectedDiv.style.display = 'block';
    }

    // 버튼 색상 변경
    var buttons = document.querySelectorAll('.introduce-bar li');
    buttons.forEach(function(button) {
        button.style.color = '#bebebe';
    });
    var selectedButton = document.querySelector('.' + divClass + '-btn');
    if (selectedButton) {
        selectedButton.style.color = 'black';
    }
}

function cancelIntroduceHowToUseGot() {
	toggleEtcDiv('introduceHowToUseGot');
	cancelDiv();
}