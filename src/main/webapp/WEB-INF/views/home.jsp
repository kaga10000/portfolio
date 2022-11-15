<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Home</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.swiper-container {
	width: 99%;
	height: 700px;
	border: 5px solid silver;
	border-radius: 7px;
	box-shadow: 0 0 20px #ccc inset;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	box-shadow: 0 0 5px #555;
}

.padding_page {
	width: 100%;
	height: 100px;
}

.weak_padding_page {
	width: auto;
	height: 50px;
}

div {
	float: left;
	text-align: center;
}

li {
	list-style: none;
	padding-left: 0px;
}

ul {
	float: left;
	margin: 0;
	padding: 0;
	width: 100%;
}

.good_border1 {
	width: 1000px;
	margin-top: 50px;
}

.slide_bottom_banner {
	width: 100%;
}

.slide_bottom_banner img {
	margin: 0 50px 0 50px;
}

.product_bottom_banner {
	width: 100%;
}

.product_bottom_banner img {
	margin: 0 50px 0 50px;
}

.swiper-slide-img {
	width: 100%;
	height: 500px;
}

.swiper-container {
	height: 500px;
}
</style>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- swiper jQuery -->
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<body>


	<jsp:include page="include/header.jsp"></jsp:include>

	<div class="weak_padding_page"></div>

	<section>
		<!-- main swiper -->
		<!-- swiper슬라이더 메인컨테이너 -->
		<div class="swiper-container">
			<!-- 보여지는 영역 -->
			<div class="swiper-wrapper">
				<!-- div class="swiper-slide" 를 추가하면된다 -->
			<c:forEach var="slide" items="${slide_list}">
					<div class="swiper-slide">
						<img class="swiper-slide-img"
							src="resources/image/slide/${slide.slide_img}"
							alt="이미지를 지원하지 않습니다." />
					</div>
				</c:forEach> 
			</div>
			<!-- 페이징 버튼 처리 -->
			<div class="swiper-pagination"></div>

			<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
		<script>
		const swiper = new Swiper('.swiper-container', {
	        //기본 셋팅
	        //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
	        direction : 'horizontal',
	        //한번에 보여지는 페이지 숫자
	        slidesPerView : 1,
	        //페이지와 페이지 사이의 간격
	        spaceBetween : 30,
	        //드레그 기능 true 사용가능 false 사용불가
	        debugger : false,
	        //마우스 휠기능 true 사용가능 false 사용불가
	        mousewheel : false,
	        //반복 기능 true 사용가능 false 사용불가
	        loop : true,
	        //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
	        centeredSlides : true,
	        // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
	        // effect: 'fade',
	        speed : 1000,
	        //자동 스크를링
	        autoplay : {
	            //시간 1000 이 1초
	            delay : 3500,
	            disableOnInteraction : false,
	        },
	        //방향표
	        navigation : {
	            //다음페이지 설정
	            nextEl : '.swiper-button-next',
	            //이전페이지 설정
	            prevEl : '.swiper-button-prev',
	        },
	    });

		</script>
	</section>

	<div class="padding_page"></div>

	<section>
		<!-- 배너 섹션 -->
		<div class="slide_bottom_banner" style="float: left;">
	 		<c:forEach var="banner" items="${banner_list_step_one}">
				<a href="${banner.banner_href}"><img
					src="resources/image/banner/${banner.banner_img}" width="600px;"
					height="150px;"></a>
			</c:forEach> 
		</div>
	</section>


	<div class="padding_page"></div>


	<section>
		<!-- 최근추가상품들 -->
		<div style="width: 100%; text-align: center;">
			<div style="margin-left: 200px;">
 				<c:forEach var="product" items="${product_list}">
					<a
						href='goods_view_detail?goods_code=${product.product_goods_code}'>
						<img
						src="resources/image/upload/${product.product_goods_firstshot}"
						width="400px;" height="650px;">
					</a>
				</c:forEach> 
			</div>
			<div class="good_border1">
				<h3>
	 				<c:choose>
						<c:when test="${product_class == 'k'}">
		국어 
		</c:when>
						<c:when test="${product_class == 'e'}">
		영어
		</c:when>
						<c:when test="${product_class =='m' }">
		수학
		</c:when>
						<c:when test="${product_class == 'c'}">
		사회
		</c:when>
						<c:when test="${product_class == 's'}">
		과학
		</c:when>
						<c:when test="${product_class == 'p'}">
		프로그래밍
		</c:when>
					</c:choose>
					관련 상품 입니다.
				</h3> 
				 <c:forEach var="goods" items="${product_emotional_list}">
					<div
						style="border: 3px solid; margin: 20px; width: 200px; height: 300px;">
						<a href='goods_view_detail?goods_code=${goods.goods_code}'> <img
							src="resources/image/upload/${goods.goods_firstshot}"
							style="width: 200px; height: 250px;">
						</a>
						<ul>
							<li>${goods.goods_title}</li>
							<li>${goods.goods_price}</li>
						</ul>
					</div>
				</c:forEach> 
			</div>
		</div>
	</section>
	<div class="padding_page"></div>
	<section>
		<!-- 배너 섹션 -->
		<div class="product_bottom_banner" style="float: left;">
			 <c:forEach var="banner" items="${banner_list_step_two}">
				<a href="${banner.banner_href}"><img
					src="resources/image/banner/${banner.banner_img}" width="700px;"
					height="200px;"></a>
			</c:forEach> 
		</div>
	</section>
	<div class="padding_page"></div>
	<section>
		<!-- 카테고리 섹션 -->
		<div style="width: 100%;">
			<img src="resources/image/category1.jpg" width="350px;"
				height="600px;"> <img src="resources/image/category2.jpg"
				width="350px;" height="600px;"> <img
				src="resources/image/category3.jpg" width="350px;" height="600px;">
			<img src="resources/image/category4.jpg" width="350px;"
				height="600px;">
		</div>
	</section>

	<div class="padding_page"></div>
	<footer>
		<div style="background-color: black; width: 100%; height: 200px;">
			<h1 style="color: white;">인천 서구 고양아파트 고양동 고양호</h1>
		</div>
	</footer>
</body>
<%-- <script>
$(document).ready(function(){
	var id = '<%=(String) session.getAttribute("id")%>
	';
	});
</script> --%>
</html>
