<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<jsp:include page="../../include/header.jsp"></jsp:include>
	<section> <!-- 상품 분류 -->
	<h4>리뷰 메인페이지</h4>
	<a href="<c:url value='admin_goods_Enrollment.class?english'/>"><button style="float: right;">상품등록</button></a>
	<table style="border: 0; width: 100%; background-color: #92a4e4; text-align: center;">
	<tr>
	<td>상품분류</td>
	<td>상품코드</td>
	<td>상품썸네일</td>
	<td>제목</td>
	<td>별점</td>
	<td>조회수</td>
	<td>생성일</td>
	</tr>
	<c:forEach var="review" items="${Rlist}">
	<tr>
	<td>${review.review_Class}</td>
	<td>${review.review_code}</td>
	<td><a href='Review_view_detail?review_code=${review.review_code}'><img src="resources/image/upload/${review.review_firstshot}" style="width: 50px;height: 50px;"></a></td>
	<td>${review.review_title}</td>
	<td>${review.review_star}</td>
	<td>${review.review_hit}</td>
	<td>${review.review_regdate}</td>
	</tr>
	</c:forEach>
	</table>
	</section>
</body>
</html>
