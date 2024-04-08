document.addEventListener("DOMContentLoaded", function() {
    const imgSlide = document.querySelector(".imgSlide");
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    
    if (!imgSlide || !prevBtn || !nextBtn) {
        console.error("One or more elements not found.");
        return;
    }
    
    let slideOffset = 0;

    // 이전 버튼 클릭 시 슬라이드 왼쪽으로 이동
    prevBtn.addEventListener("click", function() {
        slideOffset += 475;
        
        if (slideOffset >= 0) {
            slideOffset = -950;
        }
        
        imgSlide.style.left = slideOffset + "px";
    });

    // 다음 버튼 클릭 시 슬라이드 오른쪽으로 이동
    nextBtn.addEventListener("click", function() {
        slideOffset -= 475;
        
        if (slideOffset <= -950) {
            slideOffset = 0;
        }
        
        imgSlide.style.left = slideOffset + "px";
    });
});