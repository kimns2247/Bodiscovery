<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../include/include-header.jsp" %>

<!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white tracking-in-contract">  
                    <h1 class="display-4 fw-bolder">Bodiscovery</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With our shop Change your body, life</p>
                </div>
            </div>
        </header>
 
<c:if test="${user != null }">
<div class="container px-4 px-lg-5 conWrap">

	<div class="container">
		<div class="row">
		 <div class="col text-end">
		<form action = "toBoardWrite.do" method = "post">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeee; text-align: center;">작성일시</th>
						<th style="background-color: #eeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${blist }">
				<tbody>
					<tr>
						<td>${list.bno }</td>
						<td><a href="getBoard?bno=${list.bno }">${list.title }</a></td>
						<td>${list.id }</td>
						<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd hh:mm" /></td>
						<td>${list.viewcnt }</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		
			<input class="btn btn-outline-dark mt-auto" type = "submit" value = "글쓰기">
<div class="container">
    <div class="row justify-content-center"> <!-- 부트스트랩 그리드 시스템을 활용하여 가운데 정렬 -->
        <div class="col-lg-6"> <!-- 적절한 컬럼 크기를 지정 -->
            <div>
                <ul class="pagination justify-content-center"> <!-- 가운데 정렬을 위한 클래스 추가 -->
                    <c:if test="${pageMaker.prev }">
                        <li class="page-item"><a class="page-link" href="boardListpage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
                    </c:if>
                
                    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        <li class="page-item"><a class="page-link" href="boardListpage${pageMaker.makeQuery(idx) }">${idx }</a></li>
                    </c:forEach>

                    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                        <li class="page-item"><a class="page-link" href="boardListpage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>
			
			
			</form>
			</div>
		</div>
	</div>
	
</div>	
</c:if>


<c:if test = "${user == null }">
<div class="container px-4 px-lg-5 conWrap">

	<div class="container">
		<div class="row">
		 <div class="col text-end">
		<form action="Naverlogin"  method = "post">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeee; text-align: center;">작성일시</th>
						<th style="background-color: #eeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<c:forEach var="list" items="${blist }">
				<tbody>
					<tr>
						<td>${list.bno }</td>
						<td><a href="getBoard?bno=${list.bno }">${list.title }</a></td>
						<td>${list.id }</td>
						<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd hh:mm" /></td>
						<td>${list.viewcnt }</td>
					</tr>
				</tbody>
				</c:forEach>
			</table>
		
			<input class="btn btn-outline-dark mt-auto" type = "submit" value = "글쓰기">
<div class="container">
    <div class="row justify-content-center"> <!-- 부트스트랩 그리드 시스템을 활용하여 가운데 정렬 -->
        <div class="col-lg-6"> <!-- 적절한 컬럼 크기를 지정 -->
            <div>
                <ul class="pagination justify-content-center"> <!-- 가운데 정렬을 위한 클래스 추가 -->
                    <c:if test="${pageMaker.prev }">
                        <li class="page-item"><a class="page-link" href="boardListpage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
                    </c:if>
                
                    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                        <li class="page-item"><a class="page-link" href="boardListpage${pageMaker.makeQuery(idx) }">${idx }</a></li>
                    </c:forEach>

                    <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                        <li class="page-item"><a class="page-link" href="boardListpage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>
			
			
			</form>
			</div>
		</div>
	</div>
	
</div>	

</c:if>






	

<%@ include file="../include/include-footer.jsp" %>