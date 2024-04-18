<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/include-header.jsp" %>

<!-- Swiper -->
<link rel="stylesheet" type="text/css" charset="UTF-8" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.min.css"/>

<div class="container px-4 px-lg-5 conWrap">
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b336a94dd724e7237838f9bda2d119ab&libraries=services,clusterer,drawing"></script>
	
	
	<div class="map_wrap">
		<div id="map" style="width: 100%; height:350px; border-radius: 15px; border: 4.5px solid black;"></div>
		
		<ul id="category">
	       <li id="BK9" data-order="0" onclick="fnSearchTypeChg('health')"> 
	           <span class="category_bg bank"></span>
           		헬스장
	       </li>       
	       <li id="MT1" data-order="1" onclick="fnSearchTypeChg('swim')"> 
	           <span class="category_bg mart"></span>
	           	수영장
	       </li>  
	       <li id="PM9" data-order="2" onclick="fnSearchTypeChg('tennis')"> 
	           <span class="category_bg pharmacy"></span>
	          	 테니스
	       </li>  
	       <li id="OL7" data-order="3" onclick="fnSearchTypeChg('football')"> 
	           <span class="category_bg oil"></span>
	           	풋살장
	       </li>  
	       <li id="CE7" data-order="4" onclick="fnSearchTypeChg('gateBall')"> 
	           <span class="category_bg cafe"></span>
	          	 게이트볼
	       </li>  
	          
	   </ul>
	</div>
    <br>
	<form name="search_form" action="${pageContext.request.contextPath}/publicData/list_user.do" method="post">
	    <input type="hidden" name="id" value=""/>
	    <input type="hidden" name="nowPage" value="1" />
	    
		<ul class="board_search">
		   <li>
	   			<!-- 카테고리 선택을 위한 select 요소 추가 -->
				<select id="searchType" name="searchType" onchange="fnList()">
					<option value="" >전체</option>
				    <option value="health" <c:out value="${publicDataVO.searchType eq 'health' ? 'selected' : ''}" />>헬스장</option>
				    <option value="swim" <c:out value="${publicDataVO.searchType eq 'swim' ? 'selected' : ''}" />>수영장</option>
				    <option value="tennis" <c:out value="${publicDataVO.searchType eq 'tennis' ? 'selected' : ''}" />>테니스</option>
				    <option value="football" <c:out value="${publicDataVO.searchType eq 'football' ? 'selected' : ''}" />>풋살장</option>
				    <option value="gateBall" <c:out value="${publicDataVO.searchType eq 'gateBall' ? 'selected' : ''}" />>게이트볼</option>
				</select>
			</li>
		   <li>
		   		<input type="text" name="searchWord" title="검색어(NAME)를 입력하세요" value="" placeholder="검색어를 입력하세요"/>
		   		<input type="submit" value="검색" />
		   		
		   </li>
		</ul>
	</form>
		
	<table  class="listTable">
    	<colgroup>
    		<col width="50px" />
    		<col width="100px" />
    		<col width="25%" />
    		<col width="*" />
    		<col width="10%" />
    		<col width="10%" />
    		<col width="10%" />
    	</colgroup>
	    <thead>
		    <tr>
		        <th>NO</th>
		        <th>카테고리</th>
		        <th>이름</th>
		        <th>주소</th>
		        <th>오픈 시간</th> 
		        <th>마감 시간</th>
		        <th>전화번호</th>
		    </tr>
	    </thead>
	    <tbody>
		    <c:set var="num" value ="${totalCount - ((publicDataVO.nowPage - 1) * publicDataVO.pageSize) }"/>
		    <c:forEach var="data" items="${list}" varStatus="status">
		        <tr>
					<td>
		                <c:out value="${num}" />
		            </td>
		            <td>
		                <c:out value="${data.typeName}" />
		            </td>
		            <td class="tLeft" >
		                <c:out value="${data.name}" />
		            </td>
		            <td class="tLeft" onclick="fnAddrDetail('<c:out value="${data.addr}" />')">
		                <c:out value="${data.addr}" />
		            </td>
		            <td>
		            	<c:out value="${data.open}" />
		            </td>
		            <td>
		            	<c:out value="${data.close}" />
		            </td> 
		            <td>
		                <c:out value="${data.tel}" />
		            </td>
		        </tr>
		        <c:set var="num" value ="${num-1}"/>
		    </c:forEach>
		   	<c:if test="${list.size() == 0 }">
		   		<tr>
					<td colspan="7">
						데이터가 없습니다.
		            </td>
		        </tr>
		   	</c:if>
		   	
	    </tbody>
	</table>
	<form name="list_form" action="${pageContext.request.contextPath}/publicData/list_user.do" method="post">
		<input type="hidden" name="id"         value=""/>
	    <input type="hidden" name="nowPage"    value="<c:out value="${publicDataVO.nowPage}"/>" />
	    <input type="hidden" name="searchType" value="<c:out value="${publicDataVO.searchType}"/>" />
	    <input type="hidden" name="searchWord" value="<c:out value="${publicDataVO.searchWord}"/>" />
	</form>
	<c:if test="${list.size() > 0 }">
		${comUtil:getPaging(staticVO, '')}
	</c:if>


	<style type="text/css">
		.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap { margin-top: 10px; position:relative;width:100%;height:350px;}
		#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
		#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
		#category li.on {background: #eee;}
		#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
		#category li:last-child{margin-right:0;border-right:0;}
		#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
		/*  마커 이미지 가져오기 */
		#category li .category_bg {background:url(../resources/image/places_category.png) no-repeat;}
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

	
	<script type="text/javascript">
		var ps;
		var map;
		var placeOverlay;
		var mapContainer;
    	$(document).ready(function () {
    		//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
    		placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    		    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    		    markers = [], // 마커를 담을 배열입니다
    		    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
    		 
    		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		    mapOption = {
    		        center: new kakao.maps.LatLng(37.4941570926939, 126.531478279537), // 지도의 중심좌표
    		        level: 8 // 지도의 확대 레벨
    		    };  

    		// 지도를 생성합니다    
    		map = new kakao.maps.Map(mapContainer, mapOption); 

    		// 장소 검색 객체를 생성합니다
    		ps = new kakao.maps.services.Places();
    		
		    
	 		searchPlaceVal($("[name='search_form'] [name='searchType']").val());
	    });
    	

	    //상세 페이지로 이동
	    function fnDetail(pId) {
	        $("[name=list_form] [name=id]").val(pId);
	        $("[name=list_form]").attr("action", contextPath + "/publicData/detail.do");
	        $("[name=list_form]").submit();
	    }
		
	    //등록 페이지로 이동    
	    function fnInsert() {
	        $("[name=list_form]").attr("action", contextPath + "/publicData/insert.do");
	        $("[name=list_form]").submit();
	    }
	   	
	    //검색 조건에 맞게 목록 조회
	   	function fnList() {
	        $("[name=search_form]").submit();
		}
	    
	    function nextPage(pNowPage){
	    	$("[name=nowPage]").val(pNowPage);
	        $("[name=list_form]").submit();
	    }
	    
	    function fnSearchTypeChg(pVal){
	    	$("[name='search_form'] [name='searchType']").val(pVal);
	    	fnList();
	    }

	    //주소 조회
	    function fnAddrDetail(PAddr){
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	        ps.keywordSearch(PAddr, placesSearchCB2); 
	    }
	    
	
		 // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	    function placesSearchCB2(data, status, pagination) {
	        if (status === kakao.maps.services.Status.OK) {
	        	window.open(data[0].place_url);
	        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	            alert('주소 검색 결과가 존재하지 않습니다.');
	            return;

	        } else if (status === kakao.maps.services.Status.ERROR) {
	            alert('주소 검색 결과 중 오류가 발생했습니다.');
	            return;

	        }
	    }
		var sMapList;
		var sPlaceName;
		var sIdx;
		var sOrder;
		var selectedMarker = null; // 클릭한 마커를 담을 변수
		
	    function searchPlaceVal(val) {
	        var param = {
	            "searchType": val
	        }
	        $.ajax({
	            type: 'post',
	            url: contextPath + "/publicData/ajaxMapList.do",
	            async: true,
	            dataType: 'json',
	            data: param,
	            success: function (result) {
	            	sMapList = result.list;
	            	if(sMapList.length > 0){
	            		fnMapMarkerSetting(0);
	            	}

	            },
	            error: function (request, status, error) {
	                console.log(error);
	            }
	        });
	    }
		
	    function fnMapMarkerSetting(pIdx){
	    	sIdx = pIdx;
	    	if(sMapList.length > pIdx){
	    		sPlaceName = sMapList[pIdx].name;
	    		if(sMapList[pIdx].type == "health"){
					sOrder = 0;
				}else if(sMapList[pIdx].type == "swim"){
					sOrder = 1;
				}else if(sMapList[pIdx].type == "tennis"){
					sOrder = 2;
				}else if(sMapList[pIdx].type == "football"){
					sOrder = 3;
				}else if(sMapList[pIdx].type == "gateBall"){
					sOrder = 4;
				}
	            ps.keywordSearch(sMapList[pIdx].addr, placesSearchCB);
	    	}
	    }
	    
	    function placesSearchCB(data, status, pagination) {
	        if (status === kakao.maps.services.Status.OK) {
	        	if(data.length > 0){
	        		var content = '<div class="placeinfo">' +
		            '   <a class="title" href="' + data[0].place_url + '" target="_blank" title="' + sPlaceName + '">' + sPlaceName + '</a>' +
		           // '            <div class="close" onclick="closeOverlay()" title="닫기"></div>';
		           '';
			        if (data[0].road_address_name) {
			            content += '    <span title="' + data[0].road_address_name + '">' + data[0].road_address_name + '</span>' +
			                '  <span class="jibun" title="' + data[0].address_name + '">(지번 : ' + data[0].address_name + ')</span>';
			        } else {
			            content += '    <span title="' + data[0].address_name + '">' + data[0].address_name + '</span>';
			        }
			
			        content += '    <span class="tel">' + data[0].phone + '</span>' +
			            '</div>' +
			            '<div class="after"></div>';
		            
			        /*  마커 이미지 가져오기 */
	        		// 마커 이미지 설정
	        		var imageSrc = contextPath + "/resources/image/places_category.png";
	        		var imageSize = new kakao.maps.Size(27, 28);
	        		var imgOptions = {
	                    spriteSize: new kakao.maps.Size(72, 208),
	                    spriteOrigin: new kakao.maps.Point(46, (sOrder * 36)),
	                    offset: new kakao.maps.Point(11, 28)
	                };
	        		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
	                
	        		// 마커를 생성합니다
	        	    var marker = new kakao.maps.Marker({
	        	        map: map, // 마커를 표시할 지도
	        	        position: new kakao.maps.LatLng(data[0].y, data[0].x), // 마커의 위치
                    	image: markerImage
	        	    });

	        	    // 마커에 표시할 인포윈도우를 생성합니다 
	        	    var infowindow = new kakao.maps.InfoWindow({
	        	        content: content // 인포윈도우에 표시할 내용
	        	    });

	        	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	        	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	        	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	        	    kakao.maps.event.addListener(marker, 'click', function() {
	        	    		// 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
	        	            // 마커의 이미지를 클릭 이미지로 변경합니다
	        	            if (!selectedMarker || selectedMarker !== marker) {
	        	            	infowindow.open(map, marker);
		        	            // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
		        	            selectedMarker = marker;		
	        	            }else{
	        	            	infowindow.close();
		        	            // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
		        	            selectedMarker = null;		
	        	            	
	        	            }

	        	    });
	        	}
	        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	            console.log('주소 검색 결과가 존재하지 않습니다.');
	        } else if (status === kakao.maps.services.Status.ERROR) {
	            console.log('주소 검색 결과 중 오류가 발생했습니다.');
	        }

    	    
    	    sIdx++;
    	    fnMapMarkerSetting(sIdx);
	    }
		 
	   </script>
</div>	   
	   

<%@ include file="../include/include-footer.jsp" %>