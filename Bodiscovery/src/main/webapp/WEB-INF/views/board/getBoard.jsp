<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/include-header.jsp" %>

        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Bodiscovery</h1>
                    <p class="lead fw-normal text-white-50 mb-0">With our shop Change your body, life</p>
                </div>
            </div>
        </header>
        <style>
        
                .reply-item {
        border: 1px solid gray;
        padding: 5px;
        margin-top: 5px;
        max-width: 1250px; /* 최대 가로 길이 지정 */
        margin-right: auto;
        margin-left: auto;
    }
    
    img{
    width : 400px;   
    height : 400px;
    }
</style>

<div class="container-fluid">
    <div class="row justify-content-center"> <!-- 수정된 부분 -->
        <div class="col-lg-8"> <!-- 수정된 부분 -->
            <table class="table" style="border: 1px solid #dddddd">
               <tr>
                  <td colspan = "5" style="background-color: #eeeee; text-align: left;">&nbsp;&nbsp;[제목]&nbsp;&nbsp;${board.title }</td>
                  <td colspan = "1" style="background-color: #eeeee; text-align: right;">조회수:&nbsp;${board.viewcnt }
               </tr>
               
               <tr>
                  <td colspan = "3"align="left">&nbsp;&nbsp;${board.id }</td>
                  <td colspan = "3" align="right"><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd hh:mm" /></td>
               </tr>
      
               <c:if test = "${board.filename != null }">
               <tr>
                  <td colspan = "6"><br><br>
                  ${board.content }<br><br>
                  <img src = "${pageContext.request.contextPath}/${board.filename}"/>
                  </td>
               </tr>   
               </c:if>
            
               <c:if test = "${board.filename == null }">
               <tr>
                  <td colspan = "6"><br><br>
                  ${board.content }<br><br>
                  </td>
               </tr>   
               </c:if>
               
               <c:if test= "${user.id == board.id}">
               <tr>
                  <td colspan = "6" align = "center">
                     <a href="toBoardUpdate?bno=${board.bno }">[수정]</a>
                     <a href="boardDelete.do?bno=${board.bno }">[삭제]</a>
                  </td>
               </tr>
               </c:if>
            </table>            
         </div>
      </div>
   </div>

   <hr />
<ul>
   <c:forEach items="${reply}" var="reply">
    <div class="reply-item container-fluid" align="left" style="margin-left: calc(${reply.re_depth * 20}px + 295px);">
       
           [${reply.re_id }]&nbsp;
            <fmt:formatDate value="${reply.re_date }" pattern="MM-dd hh:mm" />
            <!-- 답글 버튼에 data-reply-form-id 속성을 추가하여 해당하는 입력 폼의 ID를 지정 -->
            <button class="btn btn-outline-dark mt-auto replyButton" style="padding: 0.3rem 0.6rem; font-size: 0.8rem;" data-reply-form-id="replyForm_${reply.rno}">답글</button>
            <c:if test = "${user.id == reply.re_id}">
           <button class="btn btn-outline-dark mt-auto replyButton" style="padding: 0.3rem 0.6rem; font-size: 0.8rem;" data-reply-form-id="updateForm_${reply.rno}">수정</button>
            <form action = "replyDelete.do" method = "post" style="display: inline;">
                 <input type="hidden" name="rno" id="rno" value="${reply.rno }">
                <input type="hidden" name="re_id" id="re_id" value="${user.id}">
                <input type="hidden" name="bno" id="bno" value="${board.bno }">
             <input class="btn btn-outline-dark mt-auto replyButton" style="padding: 0.3rem 0.6rem; font-size: 0.8rem;" type ="submit" value = "삭제">
           </form>
            </c:if>
      <c:if test = "${user != null }">
    <form action="replyWrite.do" method="post">
       <input type="hidden" name="rno" id="rno" value="${reply.rno }">
       <input type="hidden" name="re_id" id="re_id" value="${user.id}">
       <input type="hidden" name="bno" id="bno" value="${board.bno }">
                
        <p>${reply.re_content }</p>
        <!-- 답글 입력 폼의 ID를 동적으로 생성하여 각각의 입력 폼을 구분 -->
        <div id="replyForm_${reply.rno}" class="reply-item container-fluid" style="display: none; border-top: 1px solid gray; padding: 5px;">
            <p>
                <label>${user.id}</label><label>[답글 작성]</label>
            </p>
            <p>
                <textarea rows="3" cols="60" name="re_content" placeholder="답글을 작성해주세요."></textarea>
                <button class="btn btn-outline-dark mt-auto" type="submit">댓글 작성</button>
            </p>
        </div>
        
    </form>
   </c:if>
    <c:if test = "${user == null }">
    <form action="Naverlogin.do" method="post">
       <input type="hidden" name="rno" id="rno" value="${reply.rno }">
       <input type="hidden" name="re_id" id="re_id" value="${user.id}">
       <input type="hidden" name="bno" id="bno" value="${board.bno }">
                
        <p>${reply.re_content }</p>
        <!-- 답글 입력 폼의 ID를 동적으로 생성하여 각각의 입력 폼을 구분 -->
        <div id="replyForm_${reply.rno}" class="reply-item container-fluid" style="display: none; border-top: 1px solid gray; padding: 5px;">
            <p>
                <label>${user.id}</label><label>[답글 작성]</label>
            </p>
            <p>
                <textarea rows="3" cols="60" name="re_content" placeholder="답글을 작성해주세요."></textarea>
                <button class="btn btn-outline-dark mt-auto" type="submit">댓글 작성</button>
            </p>
        </div>
        
    </form>
   </c:if>
    <!-- 댓글 수정 창  -->
    <form action="replyUpdate.do" method="post">
     <div id="updateForm_${reply.rno}" class="reply-item container-fluid" style="display: none; border-top: 1px solid gray; padding: 5px;">
            <p>
                <label>${user.id}</label><label>[댓글 수정]</label>
            </p>
            <p>
                 <input type="hidden" name="bno" id="bno" value="${board.bno }">
                <input type="hidden" name="rno" id="rno" value="${reply.rno }">
                <textarea rows="3" cols="60" name="re_content" id = "re_content">${reply.re_content}</textarea>
                <button class="btn btn-outline-dark mt-auto" type="submit">댓글 수정</button>
            </p>
        </div>
    </form>
    
</div>
</c:forEach>
</ul>
<c:if test = "${user != null }">
<div class="container-fluid" align="left">
    <div class="reply-item" style="border:1px solid gray; padding: 5px;">
        <form method="post" action="replyWrite.do">
            <input type="hidden" name="bno" value="${board.bno }">
            <input type="hidden" name="rno" id="rno" value="0">
            <p>
                <label>${user.id}</label> <input type="hidden" name="re_id" value="${user.id}">
            </p>
            <p>
                <textarea rows="3" cols="60" name="re_content" placeholder="댓글을 작성해주세요."></textarea>
                <button class="btn btn-outline-dark mt-auto" type="submit">댓글 작성</button>
            </p>
        </form>
    </div>
</div>
</c:if>

<c:if test = "${user == null }">
<div class="container-fluid" align="left">
    <div class="reply-item" style="border:1px solid gray; padding: 5px;">
        <form method="post" action="Naverlogin.do">
            <input type="hidden" name="bno" value="${board.bno }">
            <input type="hidden" name="rno" id="rno" value="0">
            <p>
                <label>${user.id}</label> <input type="hidden" name="re_id" value="${user.id}">
            </p>
            <p>
                <textarea rows="3" cols="60" name="re_content" placeholder="댓글을 작성해주세요."></textarea>
                <button class="btn btn-outline-dark mt-auto" type="submit">댓글 작성</button>
            </p>
        </form>
    </div>
</div>
</c:if>




<script>
    // 페이지 로드 후 실행되는 함수
    document.addEventListener("DOMContentLoaded", function() {
        // 모든 답글 버튼에 대해 이벤트 리스너 등록
        var replyButtons = document.querySelectorAll(".replyButton");
        replyButtons.forEach(function(button) {
            button.addEventListener("click", function(event) {
                // 해당하는 답글 입력 폼의 ID를 가져옴
                var replyFormId = event.target.getAttribute("data-reply-form-id");
                // 해당하는 답글 입력 폼을 가져옴
                var replyForm = document.getElementById(replyFormId);
                // 현재 상태를 확인하여 토글 처리
                if (replyForm.style.display === "block") {
                    replyForm.style.display = "none";
                } else {
                    replyForm.style.display = "block";
                }
            });
        });
    });
</script>


<%@ include file="../include/include-footer.jsp" %>