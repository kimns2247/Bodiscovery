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

<!--아이디 값 없으면 작n성이 안되야 함 + 아이디 값 불러와야 함  -->
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>

<body
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">




 <div class="container">
      <div class="row">
      <form action = "boardWrite.do" method = "post" enctype = "multipart/form-data">
         <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
               <tr>
                  <th colspan="5" style="background-color: #eeeee; text-align: center;">게시판 글쓰기</th>
               </tr>
            </thead>
            
            <tbody>
               <tr>
                        <td colspan="5" ><input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" id = "title">
                           <input type = "hidden" name ="id" id = "id" value="${user.id}">
                        </td>
                    </tr>
                 
                     <tr>
                        <td colspan="5" ><textarea class="form-control" placeholder="내용을 입력해주세요" name="content" id = "content" style="height:350px;"></textarea>
                        </td>
                      </tr>
                      
                      <tr>
                         <td colspan = "5"><input type = "file" id = "filename" name = "file" /></td>
                      </tr>
            </tbody>
         
               <tr>
                  <td>
                     <input class="btn btn-outline-dark mt-auto" type = "submit" value = "작성">
                     <input class="btn btn-outline-dark mt-auto" type = "reset" value = "취소">
                  </td>
               </tr>
         
         </table>
      
      </form>
   </div>
 </div>

<%@ include file="../include/include-footer.jsp" %>