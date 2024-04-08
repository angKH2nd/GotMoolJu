document.addEventListener('DOMContentLoaded', function() {
  const listContainer = document.querySelector('.recent-list-container');
  const leftButton = document.querySelector('.recent-left-button');
  const rightButton = document.querySelector('.recent-right-button');
  const lists = document.querySelectorAll('.recent-list');

  let currentIndex = 0;
  const maxIndex = lists.length - 7;
  const itemWidth = 130; // Adjust according to your list item width

  leftButton.addEventListener('click', function() {
    if (currentIndex > 0) {
      currentIndex--;
      listContainer.style.transform = `translateX(-${currentIndex * itemWidth}px)`;
    }
  });

  rightButton.addEventListener('click', function() {
    if (currentIndex < maxIndex) {
      currentIndex++;
      listContainer.style.transform = `translateX(-${currentIndex * itemWidth}px)`;
    }
  });
});