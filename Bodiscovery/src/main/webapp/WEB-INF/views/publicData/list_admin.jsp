<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/include-header.jsp" %>


<div class="container px-4 px-lg-5 conWrap">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b336a94dd724e7237838f9bda2d119ab&libraries=services,clusterer,drawing"></script>

	<form name="search_form" action="${pageContext.request.contextPath}/publicData/list_admin.do" method="post">
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
		   		<input type="text" name="searchWord" title="검색어(NAME)를 입력하세요" value=""/>
		   		<input type="submit" value="검색" />
		   </li>
		</ul>
	</form>
		
	<table class="listTable">
    	<colgroup>
    		<col width="50px" />
    		<col width="100px" />
    		<col width="22%" />
    		<col width="*" />
    		<col width="8%" />
    		<col width="8%" />
    		<col width="9%" />
    		<col width="13%" />
    	</colgroup>
	    <thead>
		    <tr>
		        <th>NO</th>
		        <th>카테고리</th>
		        <th>이름</th>
		        <th>주소</th>
		        <th>오픈 시간</th>
		        <th>마감 시간</th>
		        <th>전화변호</th>
		        <th>등록일</th>
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
		            <td class="tLeft" onclick="fnDetail('<c:out value="${data.id}" />')">
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
		            <td>
		                <c:out value="${data.registerDate}" />
		            </td>
		        </tr>
		        <c:set var="num" value ="${num-1}"/>
		    </c:forEach>
		   	<c:if test="${list.size() == 0 }">
		   		<tr>
					<td colspan="8">
						데이터가 없습니다.
		            </td>
		        </tr>
		   	</c:if>
	    </tbody>
	</table>
	<form name="list_form" action="${pageContext.request.contextPath}/publicData/list_admin.do" method="post">
		<input type="hidden" name="id"         value=""/>
	    <input type="hidden" name="nowPage"    value="<c:out value="${publicDataVO.nowPage}"/>" />
	    <input type="hidden" name="searchType" value="<c:out value="${publicDataVO.searchType}"/>" />
	    <input type="hidden" name="searchWord" value="<c:out value="${publicDataVO.searchWord}"/>" />
	</form>
	<c:if test="${list.size() > 0 }">
		${comUtil:getPaging(staticVO, '')}
	</c:if>
	
	
	<div class="btnWrap">
		<button type="button" class="writeBtn" onclick="fnInsert();">등록</button>
	</div>
	
	<script type="text/javascript">
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
	    
	    // 장소 검색 객체를 생성합니다
		 var ps = new kakao.maps.services.Places();  
	    //주소 조회
	    function fnAddrDetail(PAddr){
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	        ps.keywordSearch(PAddr, placesSearchCB); 
	    }
	 	
		 // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	    function placesSearchCB(data, status, pagination) {
	        if (status === kakao.maps.services.Status.OK) {
	        	window.open(data[0].place_url);
				console.log(data);
	        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	            alert('주소 검색 결과가 존재하지 않습니다.');
	            return;

	        } else if (status === kakao.maps.services.Status.ERROR) {
	            alert('주소 검색 결과 중 오류가 발생했습니다.');
	            return;

	        }
	    }
	  
	  
	</script>
</div>	   
	   

<%@ include file="../include/include-footer.jsp" %>