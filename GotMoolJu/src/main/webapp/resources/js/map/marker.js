var markers = [];

		$(function(){
			$.ajax({
				url:"select.ma",
				success:function(data){


					for(let i in data){
						marker = new naver.maps.Marker({
								position: new naver.maps.LatLng(data[i].aptLocation.split(",")[1], data[i].aptLocation.split(",")[0]),
								map: map,
								icon: {
									content: [
										'<div style="width:100px; height:30px; border-radius:10%; background-color:gray; text-align: center;">',
											'<div>',
													'<span class="map-name">' + data[i].aptName + '</span>',
											'</div>',
										'</div>'
									].join(''),
									size: new naver.maps.Size(25, 34),
									scaledSize: new naver.maps.Size(25, 34),
									origin: new naver.maps.Point(0, 0),
									anchor: new naver.maps.Point(12, 34),
									draggable: true
								}
							
						});

						markers.push(marker);
						
					}
                    // console.log(data);
					markering();
				},
				error:function(){
					console.log("실패");
				}
			})
			
		})

		var marker1 = {
            content: '<div style="cursor:pointer;width:15px;height:15px;line-height:16px;font-size:5px;color:white;text-align:center;font-weight:bold;background-color:red;background-size:contain;"></div>',
            size: N.Size(40, 40),
            anchor: N.Point(20, 20)
        },
        marker2 = {
            content: '<div style="cursor:pointer;width:15px;height:15px;line-height:16px;font-size:5px;color:white;text-align:center;font-weight:bold;background-color:yellow;background-size:contain;"></div>',
            size: N.Size(40, 40),
            anchor: N.Point(20, 20)
        },
        marker3 = {
            content: '<div style="cursor:pointer;width:20px;height:20px;line-height:22px;font-size:6px;color:white;text-align:center;font-weight:bold;background-color:green;background-size:contain;"></div>',
            size: N.Size(40, 40),
            anchor: N.Point(20, 20)
        },
        marker4 = {
            content: '<div style="cursor:pointer;width:30px;height:30px;line-height:32px;font-size:8px;color:white;text-align:center;font-weight:bold;background-color:orange;background-size:contain;"></div>',
            size: N.Size(40, 40),
            anchor: N.Point(20, 20)
        },
        marker5 = {
            content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background-color:gray;background-size:contain;"></div>',
            size: N.Size(40, 40),
            anchor: N.Point(20, 20)
        };

			function markering(){

				
				var markerClustering = new MarkerClustering({
					minClusterSize: 4,
					maxZoom: 16,
					map: map,
					markers: markers,
					disableClickZoom: false,
					gridSize: 150,
					icons: [marker1, marker2, marker3, marker4, marker5],
					indexGenerator: [5, 10, 30, 50, 100],
					stylingFunction: function(clusterMarker, count) {
						$(clusterMarker.getElement()).find('div:first-child').text(count);
					}
				});
				
			}