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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- include libraries(jQuery, bootstrap) --> 
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js">
</script> <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
<!-- 로컬 파일 summernote css/js --> 
<!-- <script src="../4.surmmernote/lib/summernote-bs4.js"></script> -->
 <!-- <link rel="stylesheet" href="../4.surmmernote/lib/summernote-bs4.css"> --> 
 <!-- CDN 파일 summernote css/js --> 
 <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> 
 <!-- CDN 한글화 --> <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<body>
<body>
	<jsp:include page="../../Admin_include/admin_header.jsp"></jsp:include>
	<section> <!-- 상품 분류 -->
	<h4>국어 상품리스트</h4>
	<a href="admin_Introduce_Enrollment"><button style="float: right;">상품등록</button></a>
	<table style="border: 0; width: 100%; background-color: #92a4e4; text-align: center;">
	<tr>
	<td>상품코드</td>
	<td>상품분류</td>
	<td>썸네일</td>
	<td>제목</td>
	<td>가격</td>
	<td>판매수량</td>
	<td>댓글</td>
	<td>조회수</td>
	<td>생성일</td>
	<td>최근수정일</td>
	</tr>
	</table>
	</section>
</body>
</html>
