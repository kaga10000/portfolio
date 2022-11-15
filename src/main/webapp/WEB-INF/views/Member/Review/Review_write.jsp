<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Home</title>
</head>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js">
	
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="resources/summerNote/summernote-lite.js"></script>
<script src="resources/summerNote/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="resources/summerNote/summernote-lite.css?after">
<style type="text/css">
.first_shot {
	border: 2px solid #FAAC58;
	width: 1190px;
	height: 200px;
}

.review_page {
	margin-left: 20%;
}
.review_page div{
text-align: left;
}
.review_border {
	width: 1190px;
	border: 2px solid #FAAC58;
	height: 300px;
}
.container{
padding: 0px;
}

</style>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include>
	<form action="Review_writeFrm" method="post" enctype="multipart/form-data">
	<h4>리뷰등록</h4>
	<hr style="color: red;">
	<a href="admin_category_goods"><button style="float: right;">홈</button></a>
	<div class="review_page">
		<c:forEach var="goods" items="${Goods_view}">
			<div class="first_shot">
				<!-- 상품정보 박스 -->
				<p
					style="width: 150px; height: 150px; margin: 25px 25px 25px 25px; float: left;">
					<img src="resources/image/upload/${goods.goods_firstshot}"
						style="width: 150px; height: 150px;">
						<input type="hidden" name="review_firstshot" value="${goods.goods_firstshot}">
										</p>
				<div style="margin: 25px 25px 25px 25px; float: left;">
					<!-- 상품 상세정보 -->
					<h3>상품 이름 : &nbsp;${goods.goods_title}</h3>
					<h3>가격 : &nbsp;${goods.goods_price} 원</h3>
					<div class="star-ratings">
	<div class="star" id="star">
		<img src="resources/image/Star1.png"  id="star_click(1)" value="1" style="width: 50px; height: 50px;"onclick="star_rating(this)">
		<img src="resources/image/Star2.png"  id="star_click(2)" value="2" style="width: 50px; height: 50px;"onclick="star_rating(this)">
		<img src="resources/image/Star2.png"  id="star_click(3)" value="3" style="width: 50px; height: 50px;"onclick="star_rating(this)">
		<img src="resources/image/Star2.png"  id="star_click(4)" value="4" style="width: 50px; height: 50px;"onclick="star_rating(this)">
		<img src="resources/image/Star2.png"  id="star_click(5)" value="5" style="width: 50px; height: 50px;"onclick="star_rating(this)">
	<input type="hidden" id="review_star" name="review_star" value="1">
	<input type="hidden" id="review_goods_code" name="review_goods_code" value="${goods.goods_code}">
	</div>
</div>
	<input type="hidden" id="review_class" name="review_class" value="${goods.goods_class}">
				</div>
			</div>
			<!-- 박스 끝 -->
			<table class="review_border">
				<tr>
					<td><input type="text" name="review_title" style="width: 100%; margin: 10px 0px 10px 0px;" placeholder="제목을 입력해주세요." required></td>
				</tr>
				<tr>
					<td>
						<div class="container">
							<textarea class="summernote" id="summernote" name="review_contents"
								placeholder="내용을 입력해주세요."></textarea>
						</div>
					</td>
				</tr>
			</table>
<input type="submit" value="글작성" >
		</c:forEach>
	</div>
		</form>
</body>
<script type="text/javascript">

function star_rating(e) {
	  var a = $(e).attr('value'); // 클릭당시의 벨류값
	  var list = document.getElementById("star").getElementsByTagName("img"); // 평점 배열
	  for(var n = 1; n <= list.length; n++){
		  document.getElementById("star_click("+n+")").src = "resources/image/Star2.png";
	  }
	  for(var i = 1; i <= a; i++){
		  document.getElementById("star_click("+i+")").src = "resources/image/Star1.png";
		  $("#review_star").attr("value",""+i+"");
	  }
    };

	$(document).ready(
			function() {

				var toolbar = [
						// 글꼴 설정
						[ 'fontname', [ 'fontname' ] ],
						// 글자 크기 설정
						[ 'fontsize', [ 'fontsize' ] ],
						// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
						[
								'style',
								[ 'bold', 'italic', 'underline',
										'strikethrough', 'clear' ] ],
						// 글자색
						[ 'color', [ 'forecolor', 'color' ] ],
						// 표만들기
						[ 'table', [ 'table' ] ],
						// 글머리 기호, 번호매기기, 문단정렬
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						// 줄간격
						[ 'height', [ 'height' ] ],
						// 그림첨부, 링크만들기, 동영상첨부
						[ 'insert', [ 'picture', 'link', 'video' ] ] ];

				var setting = {
					width : 1170,
					height : 363,
					minHeight : 300,
					maxHeight : 500,
					lang : 'ko-KR',
					toolbar : toolbar,
					callbacks : { //여기 부분이 이미지를 첨부하는 부분
						onImageUpload : function(files, editor, welEditable) {
							for (var i = files.length - 1; i >= 0; i--) {
								uploadSummernoteImageFile(files[i], this);
							}
						}
					}
				};

				$('.summernote').summernote(setting);
			});
</script>
</body>
</html>
