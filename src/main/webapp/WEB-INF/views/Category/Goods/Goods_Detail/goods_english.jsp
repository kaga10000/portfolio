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
.margin {
	margin: 50px 120px 0px 200px;
	text-align: center;
}
.goods_amount{
float : none;
}
.goods_search{
text-align: right;
}
.goods_search tr{
float : none;
margin : 0;
}
.goods_search td{
 float : left;
 padding : 0 6px 0 10px;
 margin: 0;
}
.good_search p{
}
.Paging_css{
width: 1410px;
margin-bottom: 50px;
}

</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<body>
	<jsp:include page="../../../include/header.jsp"></jsp:include>
	<div class="margin">
		<section>
			<!-- 상품 분류 -->
			<img src="resources/image/goods_category/English.jpg" width="1260px"
				height="555px;" style="margin-right: 150px;">
			<h4>교재 상품 영어</h4>
		</section>
		<section>
			<!-- 상품 검색 -->
<div class="goods_amount">
					<p>등록제품 : ${glist_count} 개</p>
</div>
			<div class="goods_search">
				<table>
				<tr>
				<td><a href ="goods_Sort?method=1&Sort=english">신상품</a></td>
				<td><a href ="goods_Sort?method=2&Sort=english">낮은가격</a></td>
				<td><a href ="goods_Sort?method=3&Sort=english">높은가격</a></td>
				</tr>
				</table>
			</div>
		</section>
		<section> <!-- 상품 리스트 -->
			<div style="width: 1410px;">
				<c:forEach var="goods" items="${glist}">
					<div>
						<ul>
							<li><a
								href='goods_view_detail?goods_code=${goods.goods_code}'><img
									src="resources/image/upload/${goods.goods_firstshot}"
									style="width: 300px; height: 500px;"></a></li>
							<li>${goods.goods_title}</li>
							<li>${goods.goods_price}</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</section>
		<section> <!-- 페이징 -->
			<div class="Paging_css">
				${Paging}
			</div>
		</section>
	</div>
	
</body>
</html>
