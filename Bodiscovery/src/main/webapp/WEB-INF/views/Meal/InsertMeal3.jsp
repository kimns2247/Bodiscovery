<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 천원단위 콤마 표시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
window.history.forward();
function noBack(){window.history.forward();}
</script>

<body
    onload="noBack();" 
    onpageshow="if(event.persisted) noBack();" 
    onunload="">
<br>



	<div align="center">
		<h4><strong>${user.id}님</strong></h4>
		<h4>오늘 저녁은 무엇을 드셨나요?</h4>
		<br><hr>
	</div>
	
	<div class="search">
		<form align="center">
			<input type="text" id="autoComplete" name="searchFood" placeholder="음식명을 입력해주세요" value="${WORD}" style="width: 400px; height: 50px;"/>
		</form>
		
	</div>
	<br>
	
	<div id="autocomplete-results">
    <ul id="autocomplete-list">
        <!-- 자동완성 결과가 여기에 추가됩니다. -->
    </ul>
	</div>
	
	
	
	<div align="center">
	<h5>본 사이트에서 제공하는 음식관련 데이터는 100g을 기준으로 책정되어 있습니다.</h5> <br>
	<h5>음식 목록을 선택(클릭)을 하시면 자동으로 입력이 되게 구성되어 있습니다.</h5><br>
	</div>
	
	
	
	<form class="container" action="meal3Complete" method="post" onsubmit="return CheckForm()">
	<table align="center">
  
	<tr>
       <td class="col1">음식명 :</td>
       <td class="col2"><input type="text" name="menu" id="menu" placeholder="음식명" style="width: 350px; height: 30px;"/>
		<input type="hidden" name="Id" value="${user.id}"/>
    </tr>		
	 <tr>
	
		<td class="col1">날짜 :</td>
		<td class="col2"><input type="text" name="day" id="day" placeholder="날짜" style="width: 350px; height: 30px;"/></td>
	 </tr>	
	<tr>
       <td class="col1">인분 :</td>
		<td class="col2"><input type="text" name="inbun" id="inbun" placeholder="인분" style="width: 350px; height: 30px;" value="1" readonly/>
    </tr>
	<tr>
        <td class="col1">칼로리 :</td>
		<td class="col2"><input type="number" name="kcal" id="kcal" placeholder="칼로리" style="width: 350px; height: 30px;"/>
    </tr>
	<tr>
       
		<td class="col1">탄수화물 : </td>
		<td class="col2"><input type="text" name="carbon" id="carbon" placeholder="탄수화물" style="width: 350px; height: 30px;"/>			
    </tr>
	<tr>
	  <td class="col1">단백질 : </td>
	  <td class="col2"> <input type="text" name="protein" id="protein" placeholder="단백질" style="width: 350px; height: 30px;"/>			
	</tr>
	<tr>
	  <td class="col1">지방함량 : </td>
	  <td class="col2"><input type="text" name="fat" id="fat" placeholder="지방" style="width: 350px; height: 30px;"/>			
	</tr>
	
  </table><br>
  
  	<div class="center">
	  <button type="submit" class="btn btn-outline-dark mt-auto">저녁 식단 등록하기</button> <br>
	</div>
  		
</form><br>
	
	
<!-- 함수영역 -->
	<script>
    	function CheckForm() {
        	var menu = document.getElementById("menu").value;
        	var day = document.getElementById("day").value;
        	var kcal = document.getElementById("kcal").value;

        	// 입력 필드가 비어 있는지 확인
        	if (menu == "" || day == "" || kcal == "") {
            	alert("모든 값을 입력해주세요.");
            return false;
        	}
        return true;
    	}
	</script>


<%@ include file="../include/include-footer.jsp" %>
      
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$('#autoComplete').autocomplete({
    source: function(request, response) {
        $.ajax({
            url: './autocomplete',
            type: "POST",
            dataType: "JSON",
            data: { value: request.term },
            success: function(data) {
                var resultsContainer = $('#autocomplete-results');
                resultsContainer.empty();
                data.resultList.forEach(function(item) {
                    resultsContainer.append('<div class="autocomplete-item" data-fname="' + item.FNAME + '" data-kcal="' + item.FKCAL + '" data-carbon="' + item.FCARBON + '" data-protein="' + item.FPROTEIN + '" data-fat="' + item.FFAT + '">' + "음식명 : " + item.FNAME + " 칼로리 : " + item.FKCAL + " 탄수화물 : " + item.FCARBON + " 단백질 : " + item.FPROTEIN + " 지방 함량 : " + item.FFAT + '</div>');
                });
                resultsContainer.show();
            },
            error: function() {
                alert("오류가 발생했습니다.");
            }
        });
    },
    focus: function(event, ui) {
        return false;
    },
    minLength: 1,
    autoFocus: true,
    delay: 100
});

// 자동완성 결과에서 항목을 선택했을 때 해당 항목의 정보를 입력 필드에 적용
$(document).on('click', '.autocomplete-item', function() {
    $('#menu').val($(this).data('fname'));
    $('#kcal').val($(this).data('kcal'));
    $('#carbon').val($(this).data('carbon'));
    $('#protein').val($(this).data('protein'));
    $('#fat').val($(this).data('fat'));
    
    $('#autocomplete-results').hide();
});


function getCurrentDate() {
    var today = new Date();
    var year = today.getFullYear(); // 연도
    var month = today.getMonth() + 1; // 월
    var day = today.getDate(); // 일

    // 월과 일이 한 자리 수인 경우 앞에 0을 붙여 두 자리로 만듦
    month = (month < 10) ? '0' + month : month;
    day = (day < 10) ? '0' + day : day;

    // 현재 날짜를 YYYY-MM-DD 형식으로 반환
    return year + '-' + month + '-' + day;
}

// 페이지가 로드될 때 실행되는 함수
$(document).ready(function() {
    // 현재 날짜를 가져와서 날짜 입력 필드에 넣음
    $('#day').val(getCurrentDate());
});


function increasePortion() {
    var inbunInput = document.getElementById('inbun');
    var currentValue = parseInt(inbunInput.value);

    // 현재 인분에 1을 더하여 설정
    inbunInput.value = currentValue + 1;
}


function decreasePortion() {
    var inbunInput = document.getElementById('inbun');
    var currentValue = parseInt(inbunInput.value);

    // 현재 인분이 1보다 큰 경우에만 감소 처리
    if (currentValue > 1) {
        // 현재 인분에서 1을 빼고 설정
        inbunInput.value = currentValue - 1;
    }
}



function adjustPortion(change) {
    var inbunInput = document.getElementById('inbun');
    var kcalInput = document.getElementById('kcal');
    var carbonInput = document.getElementById('carbon');
    var proteinInput = document.getElementById('protein');
    var fatInput = document.getElementById('fat');

    var currentValue = parseInt(inbunInput.value);

    // 인분 조절
    var newValue = currentValue + change;
    if (newValue < 1) {
        newValue = 1;
    }
    inbunInput.value = newValue;

    // 칼로리, 탄수화물, 단백질, 지방 조절
    // 예시로 간단하게 칼로리만 조절하는 방법을 표현하였습니다.
    // 각 영양소의 비율이 정해져 있다면 그 비율에 따라서 계산을 해야합니다.
    var baseKcal = 100; // 1인분의 기본 칼로리
    var adjustedKcal = baseKcal * newValue;
    kcalInput.value = adjustedKcal;

    // 탄수화물, 단백질, 지방 역시 동일한 방법으로 조절하면 됩니다.
    // 필요에 따라 영양소의 비율을 고려하여 계산해야 합니다.
}
</script>
	
<style type="text/css">


*{
		margin: 0;
		padding: 0;
	}
	.mainslide{
		height: 80vh; text-align: center;
	}
	.mainslide .bg1 {
		background: url(${pageContext.request.contextPath}/resources/image/slide1.jpg) 
					no-repeat center/cover;
					color: #fff;
	}
	.mainslide .bg2 {
		background: url(${pageContext.request.contextPath}/resources/image/slide2.jpg) 
					no-repeat center/cover;
					color: #fff;
	}
	.mainslide .bg3 {
		background: url(${pageContext.request.contextPath}/resources/image/slide3.jpg) 
					no-repeat center/cover;
					color: #fff;
	}
	.mainslide .swiper-slide {
		display: flex; 
		align-items: center; 
		flex-direction: column; 
		justify-content: center;
	}
	.mainslide span {
		font-size: 30px
	}
	.mainslide .tit {
		font-size: 50px; 
		font-weight: bold; 
		opacity: 0;			/* 처음에 숨김 */
	}
	.mainslide .txt {
		font-size: 20px; 
		width: 800px; 
		margin-top: 20px; 
		opacity: 0;			/* 처음에 숨김 */
	}
	.mainslide .swiper-slide-active span{animation: ani 1s .3s both}
	.mainslide .swiper-slide-active .tit{animation: ani 1s .7s both}
	.mainslide .swiper-slide-active .txt{animation: ani 1s .1s both}
	
	@keyframes ani {
		0% {
			opacity: 0; transform: translateY(30px)
		}
		100% {
			opacity: 1; transform: translateY(0px)
		}
	}
    .video {
        width : 100%;
       	height : 70vh;
       	object-fit : cover;
       	margin: 0 auto;
       	display: block;
	}
	.section {
       	position: relative;
    }
    
    .header {
       	z-index:1000;

    }
    
    .overlay {
        position: absolute;		/* 세로 중앙에 맞춤 */
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	z-index: 2;
    	margin: 14px 3px;
    	display: inline-block;
    	vertical-align: top;
    	height: auto;
    	overflow: hidden;
    	color: white;
    }
    
    .description {
       	padding-left: 0;
       	margin: 0;
    }
    
    .description li {
        list-style: none;
    	line-height: 3em;
    	display: flex;
    	justify-content: center;
    	flex-wrap: nowrap;
    	animation-name: rolling;
    	animation-duration: 5s;
    	animation-iteration-count: infinite;
    }
    
	@keyframes rolling {
        0% {
        	transform: translateY(0);
    	}
    	33% {
        	transform: translateY(-3em);
    	}
    	66% {
        	transform: translateY(-6em);
    	}
    	100% {
        	transform: translateY(-9em);
    	}
	}
	.talk {
		position: fixed;
		right: 15px;
		bottom: 15px;
		width: 40px;
		height: 40px;
		z-index: 99;
	}
	.center {

	   text-align: center;

	}
	.footer-logo {
		display: block;
		margin: 0 auto;
		width: 300px;
		height: auto;
	}
	.upper_blank {
		height: 300px;
        background: yellowgreen;
        text-align: center;
        padding-top: 200px;
    }
    .num-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        align-items: center;
        padding: 10%;
    }
    .num-item {
        text-align: center;
        padding: 10px;
        margin-bottom: 30px;
    }
    .in-title {
        font: 30px/1 'arial';
        color: gray;
        font-weight: 600;
        margin-bottom: 20px;
    }
    .sub-title {
        font: 14px/1 'arial';
        color: gray;
    }
    .nums {
        font: bold 80px/1 'arial';
        color: #343048;
    }
    #num-unit {
        font: bold 30px/1 'arial';
        color: dimgray;
    }
	.navbar-brand img {
        width: 200px;
        height: auto;
    }


 
      div.container{
    }
 
      div.insert{
    }
 
    div.create{
    width: 800px;
    text-align: center;
    padding: 30px;
    border-bottom: 1px solid black;
    margin: auto;
    }
 
    table{
    height: 300px;
    width: 900px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    td{
    border-bottom: 1px dotted black;
    }
 
    caption{
    text-align: left;
    }
 
    .col1 {
    background-color: #f1f3f5;
    width:90px;
    padding: 10px;
    text-align: right;
    font-weight: bold;
    font-size: 0.8em;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    }
 
    .but1 {
    height: 25px;
    width: 80px;
    color: white;
    background-color: black;
    border-color: black;
    }
 
    .but2 {
    height: 27px;
    width: 120px;
    color: white;
    background-color: black;
    border-color: black;
    }
    
    #btn{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
     #btn2{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
 
    .but3 {
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
 
    .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
    .but1:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but2:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but3:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
 
    .but4:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    #btn:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    #btn2:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    p{
    font-size: 0.7em;
    }
 
    .g{
    font-size: 0.7em;
    }
 
    .c{
    font-size: 0.7em;
    }
 
    .a{
    font-size: 0.7em;
    }
    
    .num{
    color: red;
    }
    
    .col1 {
       text-align:center;
    }
 
 	#title {
 	text-align: center;
 	}
 	
 	.id_ok{
		color:blue;
		display: none;
	}	

	.id_already{
		color:red; 
		display: none;
	}
	
	.email_ok{
		color:blue;
		display: none;
	}	

	.email_already{
		color:red; 
		display: none;
	}
	
	.no-border {
  border-width: 0;
}

.bottom-border {
  border-width: 0 0 1px;
}
input{
border-color: rgba(200, 200, 200, 0.7);
	border: 1px solid;
	border-color: rgba(200, 200, 200, 0.7);
	height:25px;
}


.textbox{
margin: 10px 0px 5px 0px;
}
.csv{
	height:15px;
}

.display{
display: flex;
	justify-content: center;

}

.text2_register{

	height: 40px;
	margin: 10px 0px 5px 0px;
	border: 1px solid;
	border-color: rgba(200, 200, 200, 0.7);
}
 	
</style>
	
	
</body>
</html>
