function toggleMypageDiv(className){
    var divs = document.querySelectorAll('.mypage-toggle > div');

    divs.forEach(function(div) {
        if (div.classList.contains(className)) {
            div.style.display = div.style.display === 'block' ? 'none' : 'block';
        } else {
            div.style.display = 'none';
        }
    });
}

function cancelMypageDiv() {
    var divs = document.querySelectorAll('.mypage-toggle > div');

    divs.forEach(function(div) {
        div.style.display = 'none';
    });
}