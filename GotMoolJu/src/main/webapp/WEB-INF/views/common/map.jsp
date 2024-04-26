<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갓물주</title>
<link rel="stylesheet" href="resources/css/common/map.css">
<!-- <script src="./resources/js/MarkerClustering.js"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=9165mfbte9"></script>
	<script src="resources/assets/js/dong_coords.json" type="text/javascript"></script>	
</head>
<link rel="icon" sizes="32x32" type="image/png" href="resources/images/got/got_logo.ico">
<body>

	<div id="map" style="width: 1850px; height:807px;"></div>

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

	<!-- <script src="./resources/js/map/sidoName.js"></script>	 -->
	<script>
		// 맵 생성
		var map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(37.5565003, 126.9883882),
			zoom: 10,
			maxZoom: 17,
			minZoom: 8
		});
		
		var markers = [];

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
            markers.push(marker);
        }

        // 클릭된 좌표로 줌 + 1 해서 이동
        for (var i = 0, ii = markers.length; i < ii; i++) {
            (function (index) {
                naver.maps.Event.addListener(markers[index], 'click', function (e) {
                    // Smoothly move the map to the clicked position and adjust zoom level
                    map.morph(e.coord, map.getZoom() + 1);
                });
            })(i);
        }

		// 줌 변경 이벤트
		naver.maps.Event.addListener(map, 'zoom_changed', function() {
			var zoomLevel = map.getZoom();
			var mapCenter = map.getCenter();
			console.log(mapCenter);
			handleZoomChange(zoomLevel);

			if (zoomLevel <= 10) {
				// 마커 제거
				for(let i=0; i<markers.length; i++){
					markers[i].setMap(null);
				}
			
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
					markers.push(marker);
				}

				// 클릭된 좌표로 줌 + 1 해서 이동
				for (var i = 0, ii = markers.length; i < ii; i++) {
					(function (index) {
						naver.maps.Event.addListener(markers[index], 'click', function (e) {
							// Smoothly move the map to the clicked position and adjust zoom level
							map.morph(e.coord, map.getZoom() + 1);
						});
					})(i);
				}
			}else if(zoomLevel == 11 || zoomLevel == 12){
				// 마커 제거
				for(let i=0; i<markers.length; i++){
					markers[i].setMap(null);
				}

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

				var promises = [];

				for (let i = 0; i < SeoulDistricts.length; i++) {
					// Create a promise for each AJAX request and push to the promises array
					var request = $.ajax({
						url: "countJachi.ma",
						data: { jachi: SeoulDistricts[i].name_kr },
						success: function(count) {
							
								SeoulDistricts[i].count = count;
							
						},
						error: function() {
							console.log("Failed to fetch data for", SeoulDistricts[i].name_kr);
						}
					});

					promises.push(request);
				}

				// Wait for all AJAX requests to finish
				$.when.apply($, promises).then(function() {
					// All AJAX requests are complete, now create markers
					for (let i = 0; i < SeoulDistricts.length; i++) {

						if(SeoulDistricts[i].count != 0){
							
							var marker = new naver.maps.Marker({
							position: new naver.maps.LatLng(SeoulDistricts[i].coordinates.latitude, SeoulDistricts[i].coordinates.longitude),
							map: map,
							icon: {
								content: [
									'<div class="jachi-outer">',
										'<div>',
											'<span class="jachi-inner">' + SeoulDistricts[i].count + '</span>',
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
							map.morph(e.coord, map.getZoom() + 1);
						});
					}
					}
				});

				
			}else if(zoomLevel == 13 || zoomLevel == 14){

				// 마커 제거
				for(let i=0; i<markers.length; i++){
					markers[i].setMap(null);
				}

				let dongCoords = load();
				var promises = [];

				const getData = () => {
					dongCoords.then((appData) => {
						for (let i = 0; i < appData.length; i++) {
							let request = $.ajax({
								url: "countDong.ma",
								data: { dong: appData[i].emd_nm },
								success: function (count) {
									appData[i].count = count;
								},
								error: function () {
									console.log("Failed to fetch data for", appData[i].emd_nm);
								}
							});
							promises.push(request);
						}

						// Ensure all requests are complete before proceeding
						$.when.apply($, promises).then(function () {
							for (let i = 0; i < appData.length; i++) {
								if (appData[i].count != 0) { // Ensure count is defined
									var marker = new naver.maps.Marker({
										position: new naver.maps.LatLng(appData[i].center_lati, appData[i].center_long),
										map: map,
										icon: {
											content: [
												'<div class="jachi-outer">',
													'<div>',
														'<span class="jachi-inner">' + appData[i].count + '</span>',
													'</div>',
													appData[i].emd_nm + '</div>'
											].join(''),
											size: new naver.maps.Size(25, 34),
											scaledSize: new naver.maps.Size(25, 34),
											origin: new naver.maps.Point(0, 0),
											anchor: new naver.maps.Point(12, 34)
										}
									});
									markers.push(marker);
									naver.maps.Event.addListener(marker, 'click', function (e) {
										map.morph(e.coord, map.getZoom() + 1);
									});
								}
							}
						});
					});
				};
				
		getData();

			}else if(zoomLevel >= 15){
				// 마커 제거
				for(let i=0; i<markers.length; i++){
					markers[i].setMap(null);
				}

				setTimeout(() => {
					detailMakers();
				}, 100);
			}
		});

		function detailMakers(){
			var mapBounds = map.getBounds();
			$.ajax({
				url:"detailAptCount.ma",
				data:{
					minX:mapBounds._min.x,
					minY:mapBounds._min.y,
					maxX:mapBounds._max.x,
					maxY:mapBounds._max.y
				},
				success:function(data){
					for(let i=0; i<data.length; i++){

						var marker = new naver.maps.Marker({
							position: new naver.maps.LatLng(data[i].aptLocationX, data[i].aptLocationY),
							map: map,
							icon: {
							content: [
								'<div class="aptContent">',
									'<div class="aptImage">',
										data[i].aptCount,
										'</div>',
									'<div class="aptImageName">' + data[i].aptName + '</div>',
									'<input type="hidden" value="' + data[i].aptLocationX + '" id="aptLocation">',
									'</div>'		
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
								map.morph(e.coord);
							});
						}
					},
					error:function(){
						console.log("실패")
					}
				})
			}

		//------------------- 줌인 줌아웃 -------------------------------
		
		naver.maps.Event.addListener(map, 'zoom_changed', function() {
			var zoomLevel = map.getZoom();
			handleZoomChange(zoomLevel);
		})
	
		// 줌 변경 시 실행할 함수
		function handleZoomChange(zoomLevel) {
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
		
		// 중심 변경시 이벤트 실행
		// naver.maps.Event.addListener(map, 'center_changed', function() {

		// 	 var currentZoomLevel = map.getZoom();

		// 	 for(let i=0; i<markers.length; i++){
		// 			markers[i].setMap(null);
		// 		}
				
		// 	 if(currentZoomLevel >= 15){
		// 		setTimeout(() => {
		// 			detailMakers()
		// 		}, 500);
		// 		console.log(markers)
		// 	 }
		// });	
			
		$(document).on('click', '.aptContent', function(e) {
			var aptNameElement = $(this).find('.aptImageName');
			var aptLocationElement = $(this).find('#aptLocation');

    		var aptName = aptNameElement.text();
			var aptLocation = aptLocationElement.val();

			openDetailView([aptName, aptLocation]);
		});

		async function load() {
			// 파일 읽어 오기
			const data = await fetch('resources/assets/js/dong_coords.json');
			// JSON으로 해석
			const obj = await data.json();
			
			return obj;
		}
	</script>
		
	<script src="./resources/js/common/map.js"></script>
	<script src="./resources/js/map/mapChange.js"></script>
</body>
</html>