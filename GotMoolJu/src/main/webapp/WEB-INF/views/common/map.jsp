<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/common/map.css">
</head>
<link rel="icon" sizes="32x32" type="image/png" href="resources/images/got/got_logo.ico">
<body>
	<div id="map" style="width: 1850px; height:600px;"></div>
	<div id="zoom" style="width:50%; height:50px;"></div>

	<%-- 지도 유형 변경 --%>
	<div class="map-buttons">
        <input id="NORMAL" type="button" value="일반&#10;지도" class="control-btn control-on brc fs12 fb mh hoverZ" />
        <input id="TERRAIN" type="button" value="지형" class="control-btn brc fs12 fb mh hoverZ" />
        <input id="SATELLITE" type="button" value="위성&#10;지도" class="control-btn brc fs12 fb mh hoverZ" />
        <input id="HYBRID" type="button" value="겹쳐&#10;보기" class="control-btn brc fs12 fb mh hoverZ" />
    </div> 
    
    <%-- 줌 버튼 --%>
    <div class="zoom-buttons">
	    <button id="zoomIn" class="zoom-control-btn brc mh"><i class="fa-solid fa-plus"></i></button>
	    <button id="zoomOut" class="zoom-control-btn brc mh"><i class="fa-solid fa-minus"></i></button>
	</div>

    <button onclick="toggleDiv('home')">이거 누르면 홈 열림</button>
    <button onclick="toggleDiv('re')">이건 누르면 상세보기 열림</button>
    <button onclick="toggleDiv('rank')">이거는 차트 열리게함</button>

	<script src="resources/js/common/map.js"></script>
	
	<script>

		var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(37.5565003, 126.9883882),
			zoom: 11,
			maxZoom: 17,
			minZoom: 8
		});
	
		// var marker;
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
		
		for (let i = 0; i < locations.length; i++) {
			new naver.maps.Marker({
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
		}

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
	
		naver.maps.Event.addListener(map, 'zoom_changed', function() {
			var zoomLevel = map.getZoom();
			// 여기서 함수 호출
			handleZoomChange(zoomLevel);
		});
	
		// 줌 변경 시 실행할 함수
		function handleZoomChange(zoomLevel) {
			// 여기에 줌 변경 시 실행할 작업을 넣으세요
			// 예를 들어, 줌 레벨에 따라 UI 요소를 업데이트하거나 추가 작업을 수행할 수 있습니다
			$("#zoom").html("줌 레벨 : " + zoomLevel);
		}
		
		// + 버튼 클릭 시 줌 인
		$('#zoomIn').on('click', function() {
		    var currentZoom = map.getZoom();
		    map.setZoom(currentZoom + 1);
		});

		// - 버튼 클릭 시 줌 아웃
		$('#zoomOut').on('click', function() {
		    var currentZoom = map.getZoom();
		    map.setZoom(currentZoom - 1);
		});
		
		$(function(){
			$.ajax({
				url:"select.ma",
				success:function(data){
					for(let i in data){
						new naver.maps.Marker({
							position: new naver.maps.LatLng(data[i].aptLocation.split(",")[1], data[i].aptLocation.split(",")[0]),
							map: map,
							icon: {
								content: [
				                    '<div style="width:30px; height:30px; border-radius:50%; background-color:gray; text-align: center;">',
				                        '<div>',
				                                '<span class="map-name">' + "집" + '</span>',
				                        '</div>',
				                    '</div>'
				                ].join(''),
								size: new naver.maps.Size(25, 34),
								scaledSize: new naver.maps.Size(25, 34),
								origin: new naver.maps.Point(0, 0),
								anchor: new naver.maps.Point(12, 34)
							}
						});
					}
				},
				error:function(){
					console.log("실패");
				}
			})
			
		})
	</script>
</body>
</html>