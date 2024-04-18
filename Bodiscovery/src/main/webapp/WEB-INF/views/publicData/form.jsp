<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/include-header.jsp" %>

<div class="container px-4 px-lg-5 conWrap">

	<form name="save_form" action="${pageContext.request.contextPath}/publicData/insert.do" method="post">
		<input type="hidden" name="id"         value="<c:out value="${detail.id}" />"/>
	    <input type="hidden" name="nowPage"    value="<c:out value="${publicDataVO.nowPage}"/>" />
	    <input type="hidden" name="searchType" value="<c:out value="${publicDataVO.searchType}"/>" />
	    <input type="hidden" name="searchWord" value="<c:out value="${publicDataVO.searchWord}"/>" />
	    <table class="writeTable">
		    <colgroup>
		        <col width="20%"/>
		        <col width="80%"/>
		    </colgroup>
		    <tbody>
		    	<tr>
		    		<th>카테고리</th>
		    		<td>
		    			<select name="type">
		                    <option value="health" <c:out value="${detail.type eq 'health' ? 'selected' : ''}" />>헬스장</option>
		                    <option value="swim" <c:out value="${detail.type eq 'swim' ? 'selected' : ''}" />>수영장</option>
		                    <option value="tennis" <c:out value="${detail.type eq 'tennis' ? 'selected' : ''}" />>테니스</option>
		                    <option value="football" <c:out value="${detail.type eq 'football' ? 'selected' : ''}" />>풋살장</option>
		                    <option value="gateBall" <c:out value="${detail.type eq 'gateBall' ? 'selected' : ''}" />>게이트볼</option>
	                	</select>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th>이름</th>
		    		<td>
		                <input type="text" name="name"  value="<c:out value="${detail.name}" />"/>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th>주소</th>
		    		<td>
		    			<input type="text" name="addr" value="<c:out value="${detail.addr}" />"/>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th>오픈 시간</th>
		    		<td>
		    			<input type="time" name="open" value="<c:out value="${detail.open}" />"/>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th>마감 시간</th>
		    		<td>
		    			<input type="time" name="close" value="<c:out value="${detail.close}" />"/>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th>전화번호</th>
		    		<td>
		    			<input type="text" name="tel" value="<c:out value="${detail.tel}" />"/>
		    		</td>
		    	</tr>
		    </tbody>
	    </table>
	
	</form>
	
	<div class="btnWrap">
		<button type="button" class="listBtn" onclick="fnList();">목록</button>
		<button type="button" class="writeBtn" onclick="fnSave();">등록</button>
	</div>
	
	<script type="text/javascript">
	    
	    function fnSave() {
	        if (confirm("등록하시겠습니까?")) {
	            var url = "";
	            if ($("[name=save_form] [name=id]").val() == null || $("[name=save_form] [name=id]").val() == "") {    
	                url = contextPath + "/publicData/ajaxInsert.do";
	            } else {
	                url = contextPath + "/publicData/ajaxUpdate.do";
	            }

	            var param = $("[name=save_form]").serialize();
	            console.log(param);
	            $.ajax({
	                type: 'post',
	                url: url,
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
	                    console.log(error)
	                }
	            });
	        }
	    }
	
	    //목록 페이지로 이동
	    function fnList() {
	        $("[name=save_form]").attr("action", contextPath + "/publicData/list_admin.do");
	        $("[name=save_form]").submit();
	    }
	
	
  </script>

</div>
<%@ include file="../include/include-footer.jsp" %>
