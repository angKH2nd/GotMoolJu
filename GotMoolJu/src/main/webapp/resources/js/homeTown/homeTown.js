/* ------------ 현재시간 ------------ */
document.addEventListener('DOMContentLoaded', function() {
    var currentTime = new Date();
    var year = currentTime.getFullYear();
    var month = (currentTime.getMonth() + 1).toString().padStart(2, '0'); // Adding leading zero if needed
    var day = currentTime.getDate().toString().padStart(2, '0'); // Adding leading zero if needed
    var hours = currentTime.getHours();
    var minutes = '00'; // Minute unit is set to 00

    // Apply the current date and time to HTML elements
    document.getElementById('currentTime').innerText = year + '.' + month + '.' + day + ' ' + hours + ':' + minutes + ' 기준';
});
/* ------------ 현재시간 ------------ */

function toggleHomeTownDiv(className){
    var divs = document.querySelectorAll('.homeTown-toggle > div');

    divs.forEach(function(div) {
        if (div.classList.contains(className)) {
            div.style.display = div.style.display === 'block' ? 'none' : 'block';
        } else {
            resetMemberUpdateForm();
            div.style.display = 'none';
        }
    });
}

function cancelHomeTownDiv() {
    var divs = document.querySelectorAll('.homeTown-toggle > div');

    divs.forEach(function(div) {
    	resetMemberUpdateForm();
        div.style.display = 'none';
    });
}

function openSearchApt() {
	toggleDiv('home');
	toggleHomeTownDiv('searchApt');
}