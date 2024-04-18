<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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


<br>
<br>
<h3 align="center"><strong>"${user.id}"님 식단일지를 남겨주세요</strong></h3>


<!-- Section-->        
<div class="container">
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row row-cols-1 row-cols-md-2 g-2 mb-2">
                <div class="col-md-6">
                    <div class="card h-100">
                        <table>
                            <tr align="center">
                                <form action="meal1add" method="post">
                               		<input type="hidden" id="id" name="id" value="${user.id}">
                               		<button type="submit" class="btn btn-outline-dark mt-auto" style="width: 594px; height: 100px;">아침 식사 등록</button>
                               	</form>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100">
                        <table>
                            <tr align="center">
								<form action="meal2add" method="post">
                               		<input type="hidden" id="id" name="id" value="${user.id}">
                               		<button type="submit" class="btn btn-outline-dark mt-auto" style="width: 594px; height: 100px;">점심 식사 등록</button>
                               	</form>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row row-cols-1 row-cols-md-2 g-2 mb-4">
                <div class="col-md-6">
                    <div class="card h-100">
                        <table>
                            <tr align="center">
								<form action="meal3add" method="post">
                               		<input type="hidden" id="id" name="id" value="${user.id}">
                               		<button type="submit" class="btn btn-outline-dark mt-auto" style="width: 594px; height: 100px;">저녁 식사 등록</button>
                               	</form>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100">
                        <table>
                            <tr align="center">
                            	<form action="meal4add" method="post">
                               		<input type="hidden" id="id" name="id" value="${user.id}">
                               		<button type="submit" class="btn btn-outline-dark mt-auto" style="width: 594px; height: 100px;">간식 등록</button>
                               	</form>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card h-100">
                        <table>
                            <tr align="center">
                            	<form action="sportadd" method="post">
                                	<input type="hidden" id="id" name="id" value="${user.id}">
                                    <button type="submit" class="btn btn-outline-dark mt-auto" style="width: 594px; height: 100px;">운동 추가하기</button>
                                </form>
                            </tr>
                        </table>
                    </div>
                </div>
                
                
                <div class="col-md-6">
                    <div class="card h-100">
                        <table>
                            <tr align="center">
                            	<form action="ingredient" method="post">
                                	<input type="hidden" id="id" name="id" value="${user.id}">
                                    <button type="submit" class="btn btn-outline-dark mt-auto" style="width: 594px; height: 100px;">영양성분표 보기</button>
                                </form>
                            </tr>
                        </table>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
</div>


<div align="center">
	<form action="eatfood" method="post">
		<input type="hidden" id="id" name="id" value="${user.id}">
		<button type="submit" class="btn btn-outline-dark mt-auto" style="width: 594px; height: 100px;">내 식단 보기</button>
	</form>
</div>
<br>
        
 
<%@ include file="../include/include-footer.jsp" %>