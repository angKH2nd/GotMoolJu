$(function(){


    
    const locations = [
{ name: "서울특별시", latitude: 37.5665, longitude: 126.9780 },
{ name: "부산광역시", latitude: 35.1796, longitude: 129.0756 },
{ name: "인천광역시", latitude: 37.4563, longitude: 126.7052 },
{ name: "대구광역시", latitude: 35.8714, longitude: 128.6014 },
{ name: "광주광역시", latitude: 35.1595, longitude: 126.8526 },
{ name: "대전광역시", latitude: 36.3504, longitude: 127.3845 },
{ name: "울산광역시", latitude: 35.5384, longitude: 129.3114 },
{ name: "세종특별자치시", latitude: 36.5979, longitude: 127.2943 },
{ name: "경기도", latitude: 37.2751, longitude: 127.0097 },
{ name: "충청북도", latitude: 36.6376, longitude: 127.4912 },
{ name: "충청남도", latitude: 36.6588, longitude: 126.6729 },
{ name: "전라남도", latitude: 35.1547, longitude: 126.8531 },
{ name: "경상북도", latitude: 36.5769, longitude: 128.5056 },
{ name: "경상남도", latitude: 35.2383, longitude: 128.6922 },
{ name: "강원특별자치도", latitude: 37.8854, longitude: 127.7306 },
{ name: "전북특별자치도", latitude: 35.8242, longitude: 127.1480 },
{ name: "제주특별자치도", latitude: 33.4986, longitude: 126.5312 }
];

var sidoMarkers = [];

for (let i = 0; i < locations.length; i++) {
    var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(locations[i].latitude, locations[i].longitude),
                map: map,
                icon: {
                    content: [
                        '<div class="map-circle">',
                            '<div>',
                                '<span class="map-name">' + locations[i].name + '</span>',
                                '</div>',
                                '</div>'
                            ].join(''),
                            size: new naver.maps.Size(25, 34),
                            scaledSize: new naver.maps.Size(25, 34),
                            origin: new naver.maps.Point(0, 0),
                            anchor: new naver.maps.Point(12, 34)
                        }
                    });
            sidoMarkers.push(marker);

        }

        // 클릭된 좌표로 줌 + 1 해서 이동
        for (var i = 0, ii = sidoMarkers.length; i < ii; i++) {
            (function (index) {
                naver.maps.Event.addListener(sidoMarkers[index], 'click', function (e) {
                    // Smoothly move the map to the clicked position and adjust zoom level
                    map.morph(e.coord, map.getZoom() + 1);
                });
            })(i);
        }


})	