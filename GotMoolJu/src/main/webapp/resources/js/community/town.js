function changeTownArea() {
    var list = document.querySelector('.town-main-list');
    var insert = document.querySelector('.town-main-insert');

    if (list.style.display === 'none') {
        list.style.display = 'block';
        insert.style.display = 'none';
    } else {
        list.style.display = 'none';
        insert.style.display = 'block';
    }
}