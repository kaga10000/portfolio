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
.admin_main_border{
border:3px solid black;
margin:80px 0px 0px 20%;
width: 1200px;
height: 600px;
}
.admin_main_border input{
width: 300px;
height: 600px;
margin: 0px 45px 0px 45px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<body>
<body>
	<jsp:include page="../../Admin_include/admin_header.jsp"></jsp:include>
	<section>
		<!-- 상품 분류 -->
		<h4>어드민 메인 관리</h4>
		<hr>
		<div class="admin_main_border">
		<input type="button" style="background-color: #F5D0A9;"id="1" value="슬라이드 변경" onclick="Slide_bottom(this)">
		<input type="button" style="background-color: #A9A9F5;" id="2" value="상품설명 변경" onclick="Product_explanation_bottom(this)">
		<input type="button" style="background-color: #F6CEE3;" id="3" value="카테고리 변경" onclick="Category_bottom(this)">
		</div>
	</section>
	<section>

	</section>
</body>
<script type="text/javascript">
function Slide_bottom(e){
	 location.href = "admin_main_slide_update";
}
function Product_explanation_bottom(e){
	 location.href = "admin_main_product_exqlanation_update?Sort=k";
}
function Category_bottom(e){
	 location.href = "admin_main_Category_update";
}
</script>
</html>
