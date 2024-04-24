$(function(){


{
    var SeoulDistricts = [
      {name: "Dobong-gu", name_kr: "도봉구", coordinates: {latitude: "37.6688", longitude: "127.0471"}},
      {name: "Dongdaemun-gu", name_kr: "동대문구", coordinates: {latitude: "37.5744", longitude: "127.0400"}},
      {name: "Dongjak-gu", name_kr: "동작구", coordinates: {latitude: "37.5124", longitude: "126.9393"}},
      {name: "Eunpyeong-gu", name_kr: "은평구", coordinates: {latitude: "37.6027", longitude: "126.9291"}},
      {name: "Gangbuk-gu", name_kr: "강북구", coordinates: {latitude: "37.6396", longitude: "127.0257"}},
      {name: "Gangdong-gu", name_kr: "강동구", coordinates: {latitude: "37.5301", longitude: "127.1238"}},
      {name: "Gangnam-gu", name_kr: "강남구", coordinates: {latitude: "37.5172", longitude: "127.0473"}},
      {name: "Gangseo-gu", name_kr: "강서구", coordinates: {latitude: "37.5509", longitude: "126.8497"}},
      {name: "Geumcheon-gu", name_kr: "금천구", coordinates: {latitude: "37.4565", longitude: "126.8954"}},
      {name: "Guro-gu", name_kr: "구로구", coordinates: {latitude: "37.4954", longitude: "126.8874"}},
      {name: "Gwanak-gu", name_kr: "관악구", coordinates: {latitude: "37.4784", longitude: "126.9516"}},
      {name: "Gwangjin-gu", name_kr: "광진구", coordinates: {latitude: "37.5385", longitude: "127.0828"}},
      {name: "Jongno-gu", name_kr: "종로구", coordinates: {latitude: "37.5726", longitude: "126.9793"}},
      {name: "Jung-gu", name_kr: "중구", coordinates: {latitude: "37.5636", longitude: "126.9975"}},
      {name: "Jungnang-gu", name_kr: "중랑구", coordinates: {latitude: "37.6065", longitude: "127.0928"}},
      {name: "Mapo-gu", name_kr: "마포구", coordinates: {latitude: "37.5663", longitude: "126.9016"}},
      {name: "Nowon-gu", name_kr: "노원구", coordinates: {latitude: "37.6542", longitude: "127.0568"}},
      {name: "Seocho-gu", name_kr: "서초구", coordinates: {latitude: "37.4837", longitude: "127.0324"}},
      {name: "Seodaemun-gu", name_kr: "서대문구", coordinates: {latitude: "37.5791", longitude: "126.9368"}},
      {name: "Seongbuk-gu", name_kr: "성북구", coordinates: {latitude: "37.5894", longitude: "127.0169"}},
      {name: "Seongdong-gu", name_kr: "성동구", coordinates: {latitude: "37.5633", longitude: "127.0364"}},
      {name: "Songpa-gu", name_kr: "송파구", coordinates: {latitude: "37.5146", longitude: "127.1060"}},
      {name: "Yangcheon-gu", name_kr: "양천구", coordinates: {latitude: "37.5169", longitude: "126.8664"}},
      {name: "Yeongdeungpo-gu", name_kr: "영등포구", coordinates: {latitude: "37.5264", longitude: "126.8963"}},
      {name: "Yongsan-gu", name_kr: "용산구", coordinates: {latitude: "37.5326", longitude: "126.9900"}}
    ]
  }

  var markers = [];

  for (let i = 0; i < SeoulDistricts.length; i++) {

    (function(i) {
        $.ajax({
            url: "countJachi.ma",
            data: {jachi : SeoulDistricts[i].name_kr},
            success: function(count){

                if(count != 0){

                    var marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(SeoulDistricts[i].coordinates.latitude, SeoulDistricts[i].coordinates.longitude),
                        map: map,
                        icon: {
                            content: [
                                '<div class="jachi-outer">',
                                    '<div>',
                                        '<span class="jachi-inner">' + count + '</span>',
                                        '</div>',
                                        SeoulDistricts[i].name_kr + '</div>'
                                    ].join(''),
                                    size: new naver.maps.Size(25, 34),
                                    scaledSize: new naver.maps.Size(25, 34),
                                    origin: new naver.maps.Point(0, 0),
                                    anchor: new naver.maps.Point(12, 34)
                                }
                            });
                    markers.push(marker);
                    naver.maps.Event.addListener(marker, 'click', function (e) {
                        // Smoothly move the map to the clicked position and adjust zoom level
                        map.morph(e.coord, map.getZoom() + 1);
                    });

                }
            
            },
            error: function(){
                console.log("실패")
            }
        });
    })(i);

 
    }

})


