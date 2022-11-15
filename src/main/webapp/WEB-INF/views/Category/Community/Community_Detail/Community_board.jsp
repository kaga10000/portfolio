<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Home</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.Goods_main_border {
	width: 200px;
	height: 300px;
	border: 5px solid black;
	margin: 25px 25px 25px 25px;
	padding: 0;
}
.Goods_absolute{
position: absolute;
top: 25%;
left: 25%;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<body>
<body>
	<jsp:include page="../../../include/header.jsp"></jsp:include>
	<section> <!-- 상품 분류 -->
	<h4>커뮤니티 자유게시판</h4>
	<div class="Goods_absolute">
		<div class="Goods_main_high">
			<ul class="Goods_main_border">
				<li><a href=""> <img src="resources/image/KOREA.jpg"
						style="width: 200px; height: 300px;">
				</a></li>
			</ul>
			<ul class="Goods_main_border">
				<li><a href=""> <img src="resources/image/English.jpg"
						style="width: 200px; height: 300px;">
				</a></li>
			</ul>
			<ul class="Goods_main_border">
				<li><a href=""> <img src="resources/image/MATH.jpg"
						style="width: 200px; height: 300px;">
				</a></li>
			</ul>
		</div>
		<div class="Goods_main_row">
			<ul class="Goods_main_border">
				<li><a href=""> <img src="resources/image/society.jpg"
						style="width: 200px; height: 300px;">
				</a></li>
			</ul>
			<ul class="Goods_main_border">
				<li><a href=""> <img src="resources/image/science.jpg"
						style="width: 200px; height: 300px;">
				</a></li>
			</ul>
			<ul class="Goods_main_border">
				<li><a href=""> <img src="resources/image/Spring.jpg"
						style="width: 200px; height: 300px;">
				</a></li>
			</ul>
		</div>
	</div>
	</section>
</body>
</html>
