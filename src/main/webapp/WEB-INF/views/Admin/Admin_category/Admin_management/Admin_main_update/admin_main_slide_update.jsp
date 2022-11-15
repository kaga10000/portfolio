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
	margin: 30px 0px 0px 10%;
	width: 1600px;
	height: 1400px;
}

.admin_main_border input {
	
}
.update_slide_view{
width: 100%;
height: 600px;
}
.update_slide_view div {
width: 533px;
height: 100%;
}
.update_slide_view img {
width: 400px;
height: 580px;
}
.today_slide_view{
width: 100%;
height: 600px;
}
.today_slide_view div{
width: 533px;
height: 100%;
}
h1 {
text-align: center;
}
.absolute_btn{
position: absolute;
margin:30px 0 0 5%;
width: 100px;
height: 50px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<body>
<body>
	<jsp:include page="../../../Admin_include/admin_header.jsp"></jsp:include>
	<section>
		<!-- 상품 분류 -->
		<h4>슬라이드 변경</h4>
		<a href="admin_main_management"><button>메인페이지</button></a>
		<hr>
		<form action="update_slide_img" method="post" enctype="multipart/form-data">
		<input type="submit" value="변경하기" class="absolute_btn">
		<div class="admin_main_border">
			<div class="admin_slide_border" style="width: 100%;">
				슬라이드 1<input type="file" id="slide_img1" name="slide_img" onchange="readURL(this)" multiple> 
				슬라이드 2<input type="file" id="slide_img2" name="slide_img" onchange="readURL(this)" multiple>
				슬라이드 3<input type="file" id="slide_img3" name="slide_img" onchange="readURL(this)" multiple>
			</div>
			<div style="width: 100%;">
			<h1>바뀔 이미지</h1>
			</div>
			<div class="update_slide_view">
				<div>
				<img id="slide_view1" src="#"></div>
				<div>
				<img id="slide_view2" src="#"></div>
				<div>
				<img id="slide_view3" src="#"></div>
			</div>
			<div style="width: 100%;">
			<h1>현재 이미지</h1>
			</div>
			<div class="today_slide_view">
			<c:forEach var="slide" items="${slide_list}" varStatus="status">
			<input type="hidden" name ="today_slide_img${status.count}"value="${slide.slide_img}">
			<div>
			<p>${status.count}</p>
			<img style="width: 400px;height: 580px;"src="resources/image/slide/${slide.slide_img}">
			</div>
			</c:forEach>
			</div>
		</div>
		</form>
	</section>
	<section></section>
</body>
<script type="text/javascript">
function readURL(input) {
	console.log(input.id);
    if (input.files && input.id == "slide_img1") {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#slide_view1').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
    else if (input.files && input.id == "slide_img2") {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#slide_view2').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
    else if (input.files && input.id == "slide_img3") {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#slide_view3').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
</html>
