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
.contents {
	width: 1600px;
	margin: 0 auto;
	float: none;
}
.contents div{
float: none;
}
.search_border {
	float: none;
	border: 5px solid gray;
	width: 1260px;
	height: 500px;
	margin: inherit;
}
.search_border_value{
width: 550px;
height: 350px;
margin: 0 auto;
margin-top: 76px;
margin-bottom: 75px;
padding: 0 47px;
float: none;
}
.search_border_value div{
margin-top: 10px;
}
.search_border_value strong{
float: left;
width: 100px;
padding: 5px 10px 0 0;
height: 30px;
}
.goods_select{
width: 400px;
height: 30px;
}
.order_by{
width: 400px;
height: 30px;
}
.search_type{
width: 120px;
height: 30px;
}
.search_btn{
width: 120px;
height: 40px;
}
.search_result{
width: 1270px;
margin: 0 auto;
}
</style>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include>
	<div class="contents">
		<h2>상품 검색</h2>
		<form action="searchForm" method="get">
		<div class="search_border">
			<div class="search_border_value">
				<div>
					<strong>상품분류</strong>
					<select class="goods_select" name="search_goods">
					<option value="Goods"selected="selected">교재상품</option>
					<option value="Lecture">강의상품</option>
					</select>
				</div>
				<div>
					<strong>검색조건</strong>
					<select class="search_type" name="search_type">
					<option value="N"selected="selected">상품명</option>
					<option value="C">상품코드</option>
					<option value="I">상품업로더</option>
					</select>
					<input type="text" placeholder="검색어" style="width: 276px; height: 30px" name="search_name">
				</div>
				<div>
					<strong>판매가격대</strong>
					<input type="text" style="width: 190px; height: 30px;" name="search_money_1"> ~ <input type="text" style="width: 190px; height: 30px;" name="search_money_2">
				</div>
				<div>
					<strong>정렬기준</strong>
					<select class="order_by" name="search_order">
					<option value=""selected="selected">:::정렬선택:::</option>
					<option value="N">신상품순</option>
					<option value="H">높은가격순</option>
					<option value="L">낮은가격순</option>
					</select>
				</div>
				<div class ="search_btn_margin" style="margin: 30px 0 0 100px;">
				<button class="search_btn" type="submit">검색</button>
				</div>
			</div>
		</div>
		</form>
		<div>
<table class="search_result">
<tr>
<td><p>총 [] 개의 상품이 검색됬습니다.</p></td>
<td style="float: right;">신상품</td>
<td style="float: right;">높은가격순</td>
<td style="float: right;">낮은가격순</td>
</tr>
</table>
					<div style="width: 1270px; margin: 0 auto;">
						<ul>
							<li><img
									src="resources/image/upload/1644566126829.png"
									style="width: 300px; height: 500px;"></li>
							<li>텟흐트</li>
							<li>123123</li>
						</ul>
					</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>
