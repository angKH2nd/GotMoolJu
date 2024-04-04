function toggleLoan(divId) {
    var divs = document.querySelectorAll('.loanbar-toggle > div');
    divs.forEach(function(div) {
        div.style.display = 'none';
    });

    var selectedDiv = document.querySelector('.' + divId);
    if (selectedDiv) {
        selectedDiv.style.display = 'block';
    }
}