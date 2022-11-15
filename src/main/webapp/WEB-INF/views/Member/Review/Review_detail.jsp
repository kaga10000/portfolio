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
.first_shot {
	border: 5px solid #e8e8e8;
	width: 1190px;
	height: 200px;
	margin-bottom: 30px;
}

.review_page {
	margin-left: 20%;
}

.review_border {
	width: 1200px;
	height: 300px;
}

.review_border th {
	text-align: left;
}

.review_border th {
	border-bottom: 1px solid black;
}

.review_border ul {
	float: none;
	border-bottom: 2px solid red;
	padding-left: 0;
	margin: 0;
}

.container {
	padding: 30px 20px 30px 20px;
	float: none;
	text-align: center;
}

.Reply-insert {
	float: left;
	text-align: initial;
}
#reply_border{
border: 2px solid red;
border-left: none;
border-right: none;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<body>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include>
	<h4>리뷰 상세보기</h4>
	<div class="review_page">
		<c:forEach var="goods" items="${goods_view}">
			<div class="first_shot">
				<!-- 상품정보 박스 -->
				<p
					style="width: 150px; height: 150px; margin: 25px 25px 25px 25px; float: left;">
					<img src="resources/image/upload/${goods.goods_firstshot}"
						style="width: 150px; height: 150px;"> <input type="hidden"
						name="review_firstshot" value="${goods.goods_firstshot}">
				</p>
				<div style="margin: 25px 25px 25px 25px; float: left;">
					<!-- 상품 상세정보 -->
					<h3>상품 이름 : &nbsp;${goods.goods_title}</h3>
					<h3>가격 : &nbsp;${goods.goods_price} 원</h3>
					<div class="star-ratings"></div>
				</div>
			</div>
			<input type="hidden" id="goods_code" value="${goods.goods_code}">
		</c:forEach>
		<!-- 박스 끝 -->
		<c:forEach var="review" items="${Review_view}">
			<table class="review_border">
				<tr>
					<th scope="row"
						style="border-top: 1px solid black; text-align: left; width: 10%; background-color: #F2F2F2;">제목</th>
					<th style="border-top: 1px solid black;">${review.review_title}</th>
				</tr>
				<tr>
					<th scope="row" style="background-color: #F2F2F2;">작성자</th>
					<th>${review.review_id}</th>
				</tr>
				<tr style="text-align: right;">
					<td colspan="2">
						<ul>
							<li style="float: left;">평점 : <input type="hidden"
								value="${review.review_star}" id="review_star"> <img
								src="resources/image/Star1.png" id="star_click(1)"
								style="width: 20px; height: 20px;"> <img
								src="resources/image/Star2.png" id="star_click(2)"
								style="width: 20px; height: 20px;"> <img
								src="resources/image/Star2.png" id="star_click(3)"
								style="width: 20px; height: 20px;"> <img
								src="resources/image/Star2.png" id="star_click(4)"
								style="width: 20px; height: 20px;"> <img
								src="resources/image/Star2.png" id="star_click(5)"
								style="width: 20px; height: 20px;">
							</li>
							<li>조회수 : ${review.review_hit}</li>
						</ul>
						<div class="container">${review.review_contents}</div>
					</td>
				</tr>
			</table>
			<div style="width: 1200px;">
				<button style="float: left;">리뷰게시판</button>
			</div>
			<input type='hidden' id="review_code" value="${review.review_code}">
		</c:forEach>
		<section style="float: left; margin-bottom: 30px;">
			<!-- 댓글 insert -->
			<div class="Reply-insert"
				style="width: 1200px; background-color: #e8e8e8;">
				<h1>댓글달기</h1>
				<table>
					<tr>
						<td><h4>아이디 : ${id}</h4></td>
					</tr>
				</table>
				<input type="hidden" value="${id}" id="insert_r_id">
				<textarea style="width: 80%; height: 84px; float: left;"
					id="insert_R_CON"></textarea>
				<input type="button" style="width: 20%; height: 84px; float: left;"
					onclick="replyinsert();" value="입력">
				<section>
					<!-- 댓글 평점 -->
					<input type="radio" name="radio" value="1"
						onclick="insert_r_star(this)" checked="checked">1<input
						type="radio" name="radio" value="2" onclick="insert_r_star(this)">2<input
						type="radio" name="radio" value="3" onclick="insert_r_star(this)">3
					<input type="radio" name="radio" value="4"
						onclick="insert_r_star(this)">4<input type="radio"
						name="radio" value="5" onclick="insert_r_star(this)">5 <input
						type="hidden" id="insert_R_star" value="1">
						<input type="button" value="이모티콘">
				</section>
			</div>
		</section>
		<section style="float: left; width: 1200px;">
			<!-- 댓글 select -->
			<div id ="reply_border">
			<div id ="reply_count"> <!-- 전채 댓글수 div -->
			</div>
			<table style="width: 1200px; background-color: #e8e8e8;">
			<tr height="25" align="center" style="background-color: #ffffff">
			<td width="100px;">아이디</td>
			<td width="800px;">글내용</td>
			<td width="100px;">평점</td>
			<td width="200px;">작성일</td>
			</tr>
			</table>
			<table id="rTable" style="width: 1200px; background-color: #e8e8e8;">
				<c:forEach var="Reply" items="${rlist}">
					<tr height="25" align="center" style="background-color: #ffffff">
						<td width="100px;">${Reply.reply_id}</td>
						<td width="800px;">${Reply.reply_contents}</td>
						<td width="100px;">댓글 평점 : ${Reply.reply_star}</td>
						<td width="200px;">${Reply.reply_regdate}</td>
					</tr>
				</c:forEach>
			</table>
<P> 새로고침 </P>
<P> 본문 보기 </P>
			</div>
		</section>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		commentList();
		commentcountList();
	});
function commentcountList(){
 var r_code = $('#review_code').val();
 var json = new Object();
 json.r_code = r_code;
 $.ajax({
	 type : 'POST',
	 url : 'rest/reply_count',
	 contentType : 'application/json; charset=UTF-8',
	 data : JSON.stringify(json),
		success : function(data) {
			console.log(data);
			$('#reply_count').append("<p> 전채 댓글수 : "+data+"개 </p>");
		}
 
 
 })
	
}
	function commentList() {
		var r_code = $('#review_code').val();
		var json = new Object();
		json.r_code = r_code;
		$.ajax({
			type : 'POST',
			url : 'rest/replyselect',
			contentType : 'application/json; charset=UTF-8',
			data : JSON.stringify(json),
			success : function(data) {
				var rlist = '';
				for (var i = 0; i < data.length; i++) {
					rlist += '<tr height="25" align="center" style="background-color: #ffffff">'
							+ '<td width="100px;">' + data[i].reply_id + '</td>'
							+ '<td width="800px;">' + data[i].reply_contents
							+ '</td>' + '<td width="100px;"> 댓글 평점 : '
							+ data[i].reply_star + '</td>' + '<td width="200px;">'
							+ data[i].reply_regdate + '</td>' + '</tr>';
				}
				console.log("1=", data);
				$('#rTable').html(rlist);
				$('#insert_R_CON').val('');
				$('#insert_R_CON').focusin();
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
	function replyinsert() {
		var r_gcode = $('#goods_code').val();
		var r_code = $('#review_code').val();
		var id = $('#insert_r_id').val();
		var contents = $('#insert_R_CON').val();
		var star = $('#insert_R_star').val();
		var json = new Object();
		json.r_gcode = r_gcode;
		json.r_code = r_code;
		json.r_star = star;
		json.r_id = id;
		json.r_contents = contents;
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : 'rest/replyinsert',
			contentType : 'application/json; charset=UTF-8',
			data : JSON.stringify(json),
		});
		$('#insert_R_CON').val('');
		location.reload();
		commentList();
	}
	function insert_r_star(e) {
		var a = $(e).attr('value'); // 클릭당시의 벨류값
		document.getElementById("insert_R_star").value = a;
	};

	$(document)
			.ready(
					function() {
						var star = $('#review_star').val(); // 평점 벨류값
						for (var n = 1; n <= star; n++) {
							document.getElementById("star_click(" + n + ")").src = "resources/image/Star1.png";
						}
					});
</script>
</html>
