function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
}

window.onload = function() {
    var toggleParam = getUrlParameter('toggle');
    if (toggleParam !== '') {
        toggleDiv(toggleParam);
    }
};

function checkAllDivClosed() {
    var divs = document.querySelectorAll('.sidebar-toggle > div');
    var allClosed = true;

    divs.forEach(function(div) {
        if (div.style.display !== 'none') {
            allClosed = false;
        }
    });

    return allClosed;
}

function toggleDiv(divId) {
	cancelMypageDiv();

    var divs = document.querySelectorAll('.sidebar-toggle > div');
    var lis = document.querySelectorAll('.sidebar li');

    var isOpen = false;

    divs.forEach(function(div) {
        if (div.classList.contains(divId)) {
            isOpen = div.style.display === 'block';
        } else {
            div.style.display = 'none';
        }
    });

    divs.forEach(function(div) {
        if (div.classList.contains(divId)) {
            div.style.display = isOpen ? 'none' : 'block';
        }
    });

    lis.forEach(function(li) {
        if (li.dataset.target === divId) {
            li.style.color = isOpen ? 'black' : '#4373f4';
        } else {
            li.style.color = 'black';
        }
    });

    if (checkAllDivClosed()) {
        var mapOption = document.querySelector('.map-option');
        mapOption.style.color = '#4373f4';
    }
}

function cancelDiv() {
    var divs = document.querySelectorAll('.sidebar-toggle > div');
    var lis = document.querySelectorAll('.sidebar li');

    divs.forEach(function(div) {
        div.style.display = 'none';
    });

    lis.forEach(function(li) {
        li.style.color = 'black';
    });

    var mapOption = document.querySelector('.map-option');
    mapOption.style.color = '#4373f4';
}