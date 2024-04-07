function openCommunity1Detail(className) {
    var mainElement = document.querySelector('.community1-main');
    var detailElement = document.querySelector('.' + className);

    if (detailElement) {
        detailElement.style.display = 'block';
        mainElement.style.display = 'none';
    }
}

function goBackToCommunity1ListView() {
    var mainElement = document.querySelector('.community1-main');
    var detailElements = document.querySelectorAll('.community1-detail1, .community1-detail2');

    detailElements.forEach(function(detailElement) {
        detailElement.style.display = 'none';
    });

    mainElement.style.display = 'block';
}