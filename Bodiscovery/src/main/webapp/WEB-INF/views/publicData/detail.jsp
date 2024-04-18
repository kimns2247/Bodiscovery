<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/include-header.jsp" %>


<div class="container px-4 px-lg-5 conWrap">

    <table class="writeTable">
	    <colgroup>
	        <col width="20%"/>
	        <col width="80%"/>
	    </colgroup>
	    <tbody>
	    	<tr>
	    		<th>카테고리</th>
	    		<td>
	    			<c:out value="${detail.typeName}" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>이름</th>
	    		<td>
	                <c:out value="${detail.name}" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>주소</th>
	    		<td>
	    			<c:out value="${detail.addr}" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>오픈 시간</th>
	    		<td>
	            	<c:out value="${data.open}" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>마감 시간</th>
	    		<td>
	            	<c:out value="${data.close}" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>전화변호</th>
	    		<td>
	    			<c:out value="${detail.tel}" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>등록일</th>
	    		<td>
	    			<c:out value="${detail.registerDate}" />
	    		</td>
	    	</tr>
	    </tbody>
    </table>
	<div class="btnWrap">
        <button type="button" class="listBtn" onclick="fnList();">목록</button>
        <button type="button" class="writeBtn" onclick="fnUpdate();">수정</button>
        <button type="button" class="deleteBtn" onclick="fnDelete();">삭제</button>
	</div>
	
    <!-- AJAX 폼 -->
    <form name="detail_form" action="${pageContext.request.contextPath}/publicData/detail.do" method="post">
		<input type="hidden" name="id"         value="<c:out value="${detail.id}" />"/>
	    <input type="hidden" name="nowPage"    value="<c:out value="${publicDataVO.nowPage}"/>" />
	    <input type="hidden" name="searchType" value="<c:out value="${publicDataVO.searchType}"/>" />
	    <input type="hidden" name="searchWord" value="<c:out value="${publicDataVO.searchWord}"/>" />
    </form>

    

    <!-- 스크립트 -->
    <script type="text/javascript">
        // 삭제
        function fnDelete() {
            if (confirm("삭제하시겠습니까?")) {
                var param = $("[name=detail_form]").serialize();
                $.ajax({
                    type: 'post',
                    url: contextPath + '/publicData/ajaxDelete.do',
                    async: true,
                    dataType: 'json',
                    data: param,
                    success: function (result) {
                        if (result.status) {
                            alert(result.msg);
                            fnList();
                        }
                    },
                    error: function (request, status, error) {
                        console.log(error);
                    }
                });
            }
        }

        // 수정 페이지로 이동
        function fnUpdate() {
            $("[name=detail_form]").attr("action", contextPath + "/publicData/update.do");
            $("[name=detail_form]").submit();
        }

        // 목록 페이지로 이동
        function fnList() {
            $("[name=detail_form]").attr("action", contextPath + "/publicData/list_admin.do");
            $("[name=detail_form]").submit();
        }
    </script>

</div>
<%@ include file="../include/include-footer.jsp" %>


