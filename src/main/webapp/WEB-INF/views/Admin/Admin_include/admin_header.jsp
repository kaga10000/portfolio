 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	height: 200px;
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
			<a href="http://localhost:8585/project/admin_home"><img alt="망함" src="resources/image/admin_logo.png"
				width="200px" height="150px"></a>
		</div>
		<div class="dropmenu" style="width: 85%; height: 100px; margin-top: 20px;">
			<ul style="width: 15%;">
				<li class="test_li"><a href="admin_category_goods" id="current"><h1>교재상품</h1></a>
					<ul>
						<li><a href="admin_goods_korea">국어</a></li>
						<li><a href="admin_goods_english">영어</a></li>
						<li><a href="admin_goods_math">수학</a></li>
						<li><a href="admin_goods_society">사회</a></li>
						<li><a href="admin_goods_science">과학</a></li>
						<li><a href="admin_goods_programming">프로그래밍</a></li>
					</ul></li>
			</ul>
			<ul style="width: 15%;">
				<li class="test_li"><a href="admin_category_lecture"><h1>강의상품</h1></a>
						<ul>
						<li><a href="admin_lecture_korea">국어</a></li>
						<li><a href="admin_lecture_english">영어</a></li>
						<li><a href="admin_lecture_math">수학</a></li>
						<li><a href="admin_lecture_society">사회</a></li>
						<li><a href="admin_lecture_science">과학</a></li>
						<li><a href="admin_lecture_programming">프로그래밍</a></li>
					</ul></li>
			</ul>
			<ul style="width: 15%;">
				<li class="test_li"><a href="admin_category_Introduce"><h1>교수소개</h1></a>
				<ul>
						<li><a href="admin_Introduce_korea">국어</a></li>
						<li><a href="admin_Introduce_english">영어</a></li>
						<li><a href="admin_Introduce_math">수학</a></li>
						<li><a href="admin_Introduce_society">사회</a></li>
						<li><a href="admin_Introduce_science">과학</a></li>
						<li><a href="admin_Introduce_programming">프로그래밍</a></li>
					</ul></li>
			</ul>
			<ul style="width: 15%;">
				<li class="test_li"><a href="admin_category_community"><h1>커뮤니티</h1></a>
				<ul>
						<li><a href="admin_community_kakao">카카오톡 문의</a></li>
						<li><a href="admin_community_board">자유게시판</a></li>
						<li><a href="admin_community_Suggestions">건의사항</a></li>
					</ul></li>
			</ul>
			<ul style="width: 18%;">
				<li class="test_li"><a href="admin_category_main"><h1>메인페이지</h1></a>
				<ul style="width: 230px;" >
						<li><a href="admin_main_management">메인페이지 관리</a></li>
						<li><a href="admin_banner_management?position=1">배너 관리</a></li>
						<li><a href="admin_slide_management">슬라이드 관리</a></li>
					</ul></li>
			</ul>
				<div style="margin-top: 20px; width: 20%;">
			<c:choose>
					<c:when test="${id == null}">
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
							<li>${id}님&nbsp&nbsp환영합니다!</li>
						</ul>
</div>
						<div id="loginbtn_area"> 
						<a href="logout">로그아웃</a>
						<a href="Create_Admin" style="margin-left: 10px; ">관리자생성</a>
						<a href="Create_Introduce" style="margin-left: 10px;">교수생성</a>
						</div>
					</c:otherwise>
				</c:choose>
<input type="text" placeholder="검색창" style="width:200px;"><button>검색</button>

			</div>
 		</div> 
		<hr style=" width:100%;border:  thin solid gray;">
	</header>
