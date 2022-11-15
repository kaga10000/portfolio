<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style>
.dropmenu{
border:none;
border:0px;
margin:0px;
padding:0px;
font: "sans-serif";
font-size:18px;
}

.dropmenu ul{
background: #fff;
height:100px;
list-style:none;
margin:0;
padding:0;
}

.dropmenu li{
float:left;
height:100px;
padding:0px;
}

.dropmenu li a{
background: #fff;
color:#000;
display:block;
line-height:100px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}

.dropmenu li a:hover, .dropmenu ul li:hover a{
background: rgb(31,31,31);
color:#FFFFFF;
text-decoration:none;
}

.dropmenu li ul{
background: #848484;
display:none; 
height:auto;
border:0px;
position:absolute;
width:194px;
z-index:200;
/*top:1em;
/*left:0;*/
}

.dropmenu li:hover ul{
display:block;
}

.dropmenu li li {
background: #848484;
display:block;
float:none;
margin:0px;
padding:0px;
width:auto;
}

.dropmenu li:hover li a{
background:none;
}

.dropmenu li ul a{
display:block;
height:80px;
font-size:14px;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}

.dropmenu li ul a:hover, .dropmenu li ul li:hover a{
background: rgb(171,171,171);
border:0px;
color:#ffffff;
text-decoration:none;
}

.dropmenu p{
clear:left;
}
.padding_page {
	width: 100%;
	height: 100px;
	 }

.weak_padding_page {
	width: 800px;
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

.test_li {
height: 200px;
}
ul{
float: left;
}
h1{
margin: 0;
}
</style>
	<header>
	 	<div class="mylogo" style="width: 200px; height: 150px;">
			<a href="http://localhost:8585/project/"><img alt="망함" src="resources/image/logo.png"
				width="200px" height="150px"></a>
		</div>
		<div class="dropmenu" style="width: 85%; height: 100px; margin-top: 20px;">
			<ul style="width: 15%;">
				<li class="test_li"><a href="category_goods" id="current"><h1>교재상품</h1></a>
					<ul>
						<li><a href="goods_korea">국어</a></li>
						<li><a href="goods_english">영어</a></li>
						<li><a href="goods_math">수학</a></li>
						<li><a href="goods_society">사회</a></li>
						<li><a href="goods_science">과학</a></li>
						<li><a href="goods_programming">프로그래밍</a></li>
					</ul></li>
			</ul>
			<ul style="width: 15%;">
				<li class="test_li"><a href="category_lecture"><h1>강의상품</h1></a>
						<ul>
						<li><a href="lecture_korea">국어</a></li>
						<li><a href="lecture_english">영어</a></li>
						<li><a href="lecture_math">수학</a></li>
						<li><a href="lecture_society">사회</a></li>
						<li><a href="lecture_science">과학</a></li>
						<li><a href="lecture_programming">프로그래밍</a></li>
					</ul></li>
			</ul>
			<ul style="width: 15%;">
				<li class="test_li"><a href="category_Introduce"><h1>교수소개</h1></a>
				<ul>
						<li><a href="Introduce_korea">국어</a></li>
						<li><a href="Introduce_english">영어</a></li>
						<li><a href="Introduce_math">수학</a></li>
						<li><a href="Introduce_society">사회</a></li>
						<li><a href="Introduce_science">과학</a></li>
						<li><a href="Introduce_programming">프로그래밍</a></li>
					</ul></li>
			</ul>
			<ul style="width: 15%;">
				<li class="test_li"><a href="category_Community"><h1>커뮤니티</h1></a>
				<ul>
						<li><a href="Community_kakao">카카오톡 문의</a></li>
						<li><a href="Community_board">자유게시판</a></li>
						<li><a href="Community_Suggestions">건의사항</a></li>
					</ul></li>
			</ul>
			<div style="margin-top: 20px; width: 20%;">
			<c:choose>
					<c:when test="${sessionScope.id == null}">
			<div id="Memberinfo">
							<A HREF="member_login">로그인</A>&nbsp&nbsp&nbsp&nbsp
			</div>
						<div id="btn_area">
							<a href="member_joinFrm">회원가입</a>
						</div>
					</c:when>
					<c:otherwise>
<div id="logininfo">
						<ul style="height: 30px;">
							<li>${sessionScope.id}님&nbsp&nbsp환영합니다!</li>
						</ul>
</div>
						<div id="loginbtn_area"> 
						<a href="logout">로그아웃</a>
						<a href="member_cart_list" style="margin-left: 10px; ">장바구니</a>
						</div>
					</c:otherwise>
				</c:choose>
<input type="text" id="search_val"placeholder="검색창" style="width:200px;"><button onclick="search();">검색</button>

			</div>
			<div style="margin-top: 20px;">
			<a href="admin_home"> 관리자 페이지 </a>
			</div>
 		</div> 
		<hr style=" width:100%;border:  thin solid gray;">
	</header>
	<script>
	$(document).ready(function(){
		var id = '<%=(String) session.getAttribute("id")%>';
	});
	function search(){
		console.log($('#search_val').val());
		location.href = 'Search_view?search_val='+$('#search_val').val();
	}
	</script>
