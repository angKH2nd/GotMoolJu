// 지도 유형 변경
var btns = $(".map-buttons > input");
btns.on("click", function(e) {
    e.preventDefault();

    var mapTypeId = this.id;

    if (map.getMapTypeId() !== naver.maps.MapTypeId[mapTypeId]) {
        map.setMapTypeId(naver.maps.MapTypeId[mapTypeId]); // 지도 유형 변경하기

        btns.removeClass("control-on");
        $(this).addClass("control-on");
    }
});