$(document).ready(function() {
    toggleCommunity('town');
    $(".town-btn").click();
});

function toggleCommunity(divClass) {
    var divs = document.querySelectorAll('.community-bar-toggle > div');
    divs.forEach(function(div) {
        div.style.display = 'none';
    });

    var selectedDiv = document.querySelector('.' + divClass);
    if (selectedDiv) {
        selectedDiv.style.display = 'block';
    }

    // 버튼 색상 변경
    var buttons = document.querySelectorAll('.community-bar li');
    buttons.forEach(function(button) {
        button.style.color = '#bebebe';
    });
    var selectedButton = document.querySelector('.' + divClass + '-btn');
    if (selectedButton) {
        selectedButton.style.color = 'black';
    }
    
    resetCommunityDiv();
}

function resetCommunityDiv(){
	$(".town-insert-title-input").val('');
	$(".town-insert-content-text").val('');
	$(".town-insert-bottom>input").val('');
}
