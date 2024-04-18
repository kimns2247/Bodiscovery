<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./include/include-header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
	rel="stylesheet" 
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
	crossorigin="anonymous">
	
	<!-- swiper -->
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
	
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<style>
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
	</style>
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white tracking-in-contract">  
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
        <!-- 동영상 -->
        <section class="section">
			<video class="video" src="${pageContext.request.contextPath}/resources/video/exercise.mp4" muted autoplay loop></video>
        	<div class="overlay">
        		<ul class="description">
        			<li><h4> </h4></li>
            		<li><h4>오늘만 먹자</h4></li>
            		<li><h4>맛있는건 0 kcal</h4></li>
            		<li><h4>운동은 내일부터</h4></li>
            		<li><h4>다이어트는 다음생에...</h4>
        		</ul>
        	</div>
        </section>
        
		
		<!-- Swiper -->      
        <div class="swiper mainslide">
        	<div class="swiper-wrapper">
        		<div class="swiper-slide bg1">
        			<span>Bodiscovery 와 함께 <br> 잃어버린 나의 몸을 찾으세요!</span>
        			<p class="tit">목표 몸무게에 가장 쉽게 도달하실 수 있도록 도와드립니다.</p>
        			<p class="txt">근처에 운동시설이 어디에 있는지 추천 해줘요. 또 운동시설의 정보도 알려줍니다.</p>
        		</div>
        		
        		<div class="swiper-slide bg2">
        			<span>다양한 상품으로 여러분을 기다리고 있어요!</span>
        			<p class="tit">체중조절시 가장 중요한 것은 식단조절입니다.</p>
        			<p class="txt">하루 식단을 입력하면, 섭취 영양소를 기준치 대비 알려드립니다. 그리고 추천 상품도 추천드립니다.</p>
        		</div>
        		
        		<div class="swiper-slide bg3">
        			<span>목표 달성엔 기록이 최고죠!</span>
        			<p class="tit">앞으로도 건강한 나를 위해 몸무게 그래프로 확인 할 수 있어요.</p>
        			<p class="txt">나의 신체조건을 입력 시, 나이 대비 상위 몇% 알려드려요.</p>
        		</div>
        	</div>
        </div>
        
 	<div class="num-container" id="num-container">
 		<div class="num-item">
 			<h4 class="in-title">가입 회원</h4>
 			<span class="nums" data-count="1500">0</span><span id="num-unit">명</span><br>
 			<span class="sub-title">회원수</span><br>
 		</div>
 		<div class="num-item">
 			<h4 class="in-title">체육시설</h4>
 			<span class="nums" data-count="953">0</span><span id="num-unit">개</span><br>
 			<span class="sub-title">운동시설 개수</span><br>
 		</div>
        <div class="num-item">
 			<h4 class="in-title">이용자 기준</h4>
 			<span class="nums" data-count="85.7">0</span><span id="num-unit">%</span><br>
 			<span class="sub-title">다이어트 성공률</span><br>
 		</div>
	</div>
	
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.6.0.min.js"></script>
    <script>
        //숫자 카운트 애니메이션
        $('.nums').each(function () {
            const $this = $(this),
                countTo = $this.attr('data-count');

            $({
                countNum: $this.text()
            }).animate({
                countNum: countTo
            }, {
                duration: 7000,
                easing: 'linear',
                step: function () {
                    $this.text(Math.floor(this.countNum));
                },
                complete: function () {
                    $this.text(this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
                    //3자리 마다 콤마 표시 적용
                }
            });
        });
    </script>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!--         Core theme JS
        <script src="/resources/js/scripts.js"></script>
         -->
        
        <script>
        	const swiper = new Swiper('.mainslide', {
        		loop: true,
        		effect: 'fade',
        		autoplay: {
        			delay: 2500
        		},
        		fadeEffect: {
        			crossFade: true
        		},
        		
        	});
        
        </script>        
        
        
	      

<%@ include file="./include/include-footer.jsp" %>