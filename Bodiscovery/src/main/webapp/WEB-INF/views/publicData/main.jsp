<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>      <!-- 파일명은   index.jsp -->
<head>               <!--  위치는 webapp 아래 -->
<meta charset="UTF-8">
<title>KAKAO MAP API</title>
<style>
	.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap {position:relative;width:100%;height:350px;}
	#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
	#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
	#category li.on {background: #eee;}
	#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
	#category li:last-child{margin-right:0;border-right:0;}
	#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
	#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
	#category li .bank {background-position: -10px 0;}
	#category li .mart {background-position: -10px -36px;}
	#category li .pharmacy {background-position: -10px -72px;}
	#category li .oil {background-position: -10px -108px;}
	#category li .cafe {background-position: -10px -144px;}
	#category li .store {background-position: -10px -180px;}
	#category li.on .category_bg {background-position-x:-46px;}
	.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
	.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
	.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
	.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
	.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
	.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
	.placeinfo .tel {color:#0f7833;}
	.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

	/* 마커 눌렀을때 간단한 소개 내용 띄우기 */
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {display: block; background: #d95050; background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    .overlay_info a strong {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png) no-repeat; padding-left: 27px;}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 56px}
    .overlay_info img {vertical-align: top;}
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 24px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
  	.close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .close:hover {cursor: pointer;}
    
   </style>
</head>

<body>

<div class="map_wrap">
	<div id="map" style="width:100%;height:350px;"></div>
	<ul id="category">
       <li id="BK9" data-order="0" onclick="searchPlaceVal('health')"> 
           <span class="category_bg bank"></span>
           헬스장
       </li>       
       <li id="MT1" data-order="1" onclick="searchPlaceVal('swim')"> 
           <span class="category_bg mart"></span>
           수영장
       </li>  
       <li id="PM9" data-order="2" onclick="searchPlaceVal('tennis')"> 
           <span class="category_bg pharmacy"></span>
           테니스
       </li>  
       <li id="OL7" data-order="3" onclick="searchPlaceVal('football')"> 
           <span class="category_bg oil"></span>
           풋살장
       </li>  
       <li id="CE7" data-order="4" onclick="searchPlaceVal('gateBall')"> 
           <span class="category_bg cafe"></span>
           게이트볼
       </li>  
          
   </ul>
</div>
    <div class="map_wrap">
        <div id="map" style="width:100%;height:350px;"></div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b336a94dd724e7237838f9bda2d119ab&libraries=services,clusterer,drawing"></script>
    <script type="text/javascript">
        var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567),
                level: 5  //보여지는 지도의 단계 , 숫자가 커질수록 지도가 광범위해짐
            };

        var map = new kakao.maps.Map(mapContainer, mapOption);
        var ps = new kakao.maps.services.Places();

        function searchPlaceVal(val) {
            var param = {
                "searchType": val
            }
            $.ajax({
                type: 'post',
                url: "/sawon/publicData/ajaxMapList.do",
                async: true,
                dataType: 'json',
                data: param,
                success: function (result) {
                    var addrList = result.list;
                    for (var i = 0; i < addrList.length; i++) {
                        ps.keywordSearch(addrList[i].name, placesSearchCB);
                    }
                },
                error: function (request, status, error) {
                    console.log(error);
                }
            });
        }

        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                var dataArr = [data[0]];
                displayPlaces(dataArr);

                var bounds = new kakao.maps.LatLngBounds();
                for (var i = 0; i < data.length; i++) {
                    bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                }
                map.setBounds(bounds);
            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                console.log('주소 검색 결과가 존재하지 않습니다.');
                return;
            } else if (status === kakao.maps.services.Status.ERROR) {
                console.log('주소 검색 결과 중 오류가 발생했습니다.');
                return;
            }
        }

        function displayPlaces(places) {
            for (var i = 0; i < places.length; i++) {
                var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), 1);
                (function (marker, place) {
                    kakao.maps.event.addListener(marker, 'click', function () {
                        displayPlaceInfo(place);
                    });
                })(marker, places[i]);
            }
        }

        function addMarker(position, order) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png',
                imageSize = new kakao.maps.Size(27, 28),
                imgOptions = {
                    spriteSize: new kakao.maps.Size(72, 208),
                    spriteOrigin: new kakao.maps.Point(46, (order * 36)),
                    offset: new kakao.maps.Point(11, 28)
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                    position: position,
                    image: markerImage
                });

            marker.setMap(map);
            return marker;
        }

        function displayPlaceInfo(place) {
            var content = '<div class="placeinfo">' +
                '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>' +
                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>';

            if (place.road_address_name) {
                content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
            } else {
                content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
            }

            content += '    <span class="tel">' + place.phone + '</span>' +
                '</div>' +
                '<div class="after"></div>';

            var placeOverlay = new kakao.maps.CustomOverlay({
                position: new kakao.maps.LatLng(place.y, place.x),
                content: content,
                yAnchor: 1
            });

            placeOverlay.setMap(map);
        }

        function closeOverlay() {
            placeOverlay.setMap(null);
        }
     
        

        // 일정 시간마다 주소 갱신 (예: 5초마다)
        setInterval(getAndDisplayNewAddress, 5000); // 5초마다 새로운 주소를 가져와서 지도에 마커를 표시

    </script>
	</body>
</html>



