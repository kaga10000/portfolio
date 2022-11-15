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
	margin: 30px 0px 50px 10%;
	width: 1600px;
	height: 1000px;
}

.admin_product_border a {
	margin-right: 30px;
}

#product_goods_firstshot {
	margin: 25% 25% 25% 25%;
	width: 400px;
	height: 580px;
}

h1 {
	text-align: center;
}

.absolute_btn {
	position: absolute;
	margin: 30px 0 0 5%;
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
		<h4>메인 변경</h4>
		<a href="admin_main_management"><button>메인페이지</button></a>
		<hr>
		<form action="main_product_modify" method="POST">
			<input type="hidden" value="${product_class}" id="product_class"
				name="product_class"> <input type="submit" value="변경하기"
				class="absolute_btn">
			<div class="admin_main_border">
				<div class="admin_product_border" style="width: 100%;">
					<div id="chk_value"
						style="border: 1px solid black; width: 750px; height: 1000px;">
						<c:forEach var="product" items="${product_list}">
							<c:choose>
								<c:when test="${product.product_goods_firstshot == null}">
									<img id="product_goods_firstshot"
										src="resources/image/null.png">
								</c:when>
								<c:otherwise>
									<img id="product_goods_firstshot"
										src="resources/image/upload/${product.product_goods_firstshot}">
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<div class="admin_main_but_area" style="width: 50%; height: 100%;">
						<div style="width: 100%;">
							<a href="admin_main_product_exqlanation_update?Sort=k">국어</a> <a
								href="admin_main_product_exqlanation_update?Sort=e">영어</a> <a
								href="admin_main_product_exqlanation_update?Sort=m">수학</a> <a
								href="admin_main_product_exqlanation_update?Sort=c">사회</a> <a
								href="admin_main_product_exqlanation_update?Sort=s">과학</a> <a
								href="admin_main_product_exqlanation_update?Sort=p">프로그래밍</a>
						</div>
						<div class="admin_main_select" style="width: 100%;">

							<h4>관련 상품 정렬기준</h4>
							<select id="selectbox" name ="selectValue">
								<option value="" selected disabled>정렬방식 선택</option>
								<option id="type_val" value="NEWGOODS">신상품</option>
								<option id="type_val" value="LOWINVEN">낮은재고</option>
								<option id="type_val" value="HIGHINVEN">높은재고</option>
								<option id="type_val" value="LOWMONEY">낮은가격</option>
								<option id="type_val" value="HIGHMONEY">높은가격</option>
							</select>
						</div>
						<div class="admin_goods_list" style="width: 100%; height: 800px;">
							<c:forEach var="goods" items="${goods_list}">
								<ul>
									<li><input type="checkbox" name="goods_chk"
										onclick="readURL(this)" value="${goods.goods_code}"></li>
									<li><img
										src="resources/image/upload/${goods.goods_firstshot}"
										style="width: 150px; height: 150px;"></li>
									<li>${goods.goods_title}</li>
									<li>${goods.goods_price}</li>
								</ul>
							</c:forEach>
						</div>
						<div style="width: 100%; text-align: center;">${Paging}</div>
					</div>
				</div>
			</div>
		</form>
	</section>
	<section></section>
</body>
<script type="text/javascript">
 	$(document).ready(
			function() {
				$('input[type="checkbox"][name="goods_chk"]').click(
						function() {
							if ($(this).prop('checked')) {
								$('input[type="checkbox"][name="goods_chk"]')
										.prop('checked', false);
								$(this).prop('checked', true);
							}
						});
			}); 
					
	function readURL(chk) {
		var chk_value = chk.value;
		var json = new Object();
		json.chk_val = chk_value;
		$
				.ajax({
					type : 'POST',
					url : 'rest/chk_value',
					contentType : 'application/json; charset=UTF-8',
					data : JSON.stringify(json),
					success : function(data) {
						$('#chk_value').empty();
						$('#chk_value')
								.append(
										"<img id='product_goods_firstshot' src= 'resources/image/upload/"+data[0].goods_firstshot+"'>");
						$('#chk_value')
								.append(
										"<input type='hidden'name='product_goods_firstshot' value='"+data[0].goods_firstshot+"'>");
					}
				})
	}
/* 	function chageLangSelect(){
	var langSelect = document.getElementById("selectbox");// select element에서 선택된 option의 value가 저장된다. 
	console.log(langSelect);
	var selectValue = langSelect.options[langSelect.selectedIndex].value; // select element에서 선택된 option의 text가 저장된다. 
	console.log(selectValue);
	var product_class = $("#product_class").val();
	console.log(product_class);
	var json = new Object();
	json.selectValue = selectValue;
	json.product_class = product_class;
	 $.ajax({
		type : 'POST',
		url : 'rest/product_type_sort',
		contentType : 'application/json; charset=UTF-8',
		data : JSON.stringify(json),
		success : function(data) {
			$('.admin_goods_list').empty();
			for (i=0; i<data.length; i++){
			$('.admin_goods_list')
					.append(
							'<ul><li><input type="checkbox" name="goods_chk" onclick="readURL(this)" value='+data[i].goods_code+'></li>'
							+'<li><img src=resources/image/upload/'+data[i].goods_firstshot+' style="width: 150px; height: 150px;"></li>'
							+'<li>'+data[i].goods_title+'</li>'
							+'<li>'+data[i].goods_price+'</li>'
						+'</ul>');
			}
		}
	})  */
</script>
</html>
