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

function toggleDiv(divId) {
    var divs = document.querySelectorAll('.sidebar-toggle > div');
    divs.forEach(function(div) {
        if (div.classList.contains(divId)) {
            div.style.display = 'block';
        } else {
            div.style.display = 'none';
        }
    });
}

function cancelDiv() {
    var divs = document.querySelectorAll('.sidebar-toggle > div');
    divs.forEach(function(div) {
        div.style.display = 'none';
    });
}