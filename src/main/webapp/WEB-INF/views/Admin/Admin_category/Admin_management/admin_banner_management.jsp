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
.admin_main_border {
	border: 3px solid black;
	margin: 80px 0px 0px 10%;
	width: 1600px;
	height:1000px;
}
.absolute_btn{
position: absolute;
margin:30px 0 0 5%;
width: 100px;
height: 50px;
}
.admin_banner_type {
	width: 300px;
	height: 50px;
	margin: 0px 45px 0px 45px;
}

.update_banner_view {
	width: 100%;
	height: 250px;
	margin-bottom: 30px;
}

.update_banner_view div img {
	width: 700px;
	margin: 0px 20px 0px 30px;
	height: 200px;
}

.today_banner_view {
	width: 100%;
	height: 250px;
	margin-bottom: 30px;
}

.today_banner_view div img {
	width: 700x;
	margin: 0px 20px 0px 30px;
	height: 200px;
}
.today_banner_border{
width:750px;
height: 250px;
}
.today_banner_border img{
width:700px;
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
		<h4>어드민 배너 관리</h4>
		<hr>
		<form action="update_banner_img" method="post" enctype="multipart/form-data">
		<input type="submit" value="변경하기" class="absolute_btn">
		<div class="admin_main_border">
		<input type="hidden" value="${banner_position}" name="banner_position">
		<c:choose>
		<c:when test="${banner_position == 1 }">
		<h3>슬라이드 하단</h3>
		</c:when>
		<c:when test="${banner_position == 2 }">
		<h3>상품설명 하단</h3>
		</c:when>
		</c:choose>
			<input class="admin_banner_type" type="button"
				style="background-color: #F5D0A9;" id="1" value="슬라이드 하단"
				onclick="banner_position_bottom1(this)"> <input
				class="admin_banner_type" type="button"
				style="background-color: #A9A9F5;" id="2" value="상품설명 하단"
				onclick="banner_position_bottom2(this)">
			<div class="admin_slide_border" style="width: 100%;">
				배너 왼쪽<input type="file" id="banner_img1" name="banner_img"
					onchange="readURL(this)" multiple> 배너 오른쪽<input type="file"
					id="banner_img2" name="banner_img" onchange="readURL(this)" multiple>
			</div>
			<div style="width: 100%;">
				<h1>바뀔 이미지</h1>
			</div>
			<div class="update_banner_view">
				<div style="width:750px;height: 250px;">
					<img id="banner_view1" src="#">
					URL 입력 :<input type="text" name="banner_href_1">
				</div>
				<div style="width:750px;height: 250px;">
					<img id="banner_view2" src="#">
				URL 입력 : <input type="text" name="banner_href_2">
				</div>
			</div>
			<div style="width: 100%;">
				<h1>현재 이미지</h1>
			</div>
			<div class="today_banner_view">
				<c:forEach var="banner" items="${banner_img_list}" varStatus="status">
			<div class="today_banner_border">
					<img src="resources/image/banner/${banner.banner_img}">
					<p>${banner.banner_href}</p>
					<input type="hidden" id="banner_ori_firstshot" name="banner_ori_firstshot${status.count}" value="${banner.banner_img}">
			</div>
				</c:forEach>
			</div>
		</div>
		</form>
	</section>
	<section></section>
</body>
<script type="text/javascript">
	function banner_position_bottom1(e) {
		location.href = "admin_banner_management?position=" + 1;
	}
	function banner_position_bottom2(e) {
		location.href = "admin_banner_management?position=" + 2;
	}
	function readURL(input) {
		console.log(input.id);
		if (input.files && input.id == "banner_img1") {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#banner_view1').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		} else if (input.files && input.id == "banner_img2") {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#banner_view2').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</html>
