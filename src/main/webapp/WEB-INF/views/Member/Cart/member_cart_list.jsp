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

.contents div {
	float: none;
}
.price_area{

}
</style>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include>
	<h2>장바구니 테스트</h2>
	<table
		style="border: 0; width: 100%; background-color: #92a4e4; text-align: center;">
		<tr>
			<td width="80px;"><input type="checkbox" id="allchk">
			<td>상품 썸네일</td>
			<td>상품 제목</td>
			<td>가격</td>
			<td>담은 수량</td>
		</tr>
		<c:forEach var="goods" items="${list}" varStatus="status">
			<tr style="background-color: #E6E0F8;">
			<td><input type="checkbox" value="${goods.goods_code}"
						name="goods_chk" id="goods_chk"></td>
				<td><a href='goods_view_detail?goods_code=${goods.goods_code}'><img
						src="resources/image/upload/${goods.goods_firstshot}"
						style="width: 250px; height: 350px;"></a></td>
				<td>${goods.goods_title}</td>
				<td>${goods.goods_price}원<input type="hidden" name="hidden_price_area" id="hidden_price_area${status.count}"value="${goods.goods_price}"></td>
				<td>${goods.goods_count}<input type="hidden" name="hidden_price_area_count" id="hidden_price_area_count${status.count}"value="${goods.goods_count}"></td>
				<c:forEach var="cart" items="${Count}" varStatus="status">
					<td><c:out value="${cart}" /></td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<div style=" margin-top: 10px; height: 30px; width: 100%;">
	<input type="button" value="삭제" onclick="cart_delete()" Style="float: right;">	
	</div>
		<hr>
<table style="text-align: center;">
<tr>
<td>선택 상품금액</td>
<td> 총 배송비</td>
<td> 총 결제비</td>
</tr>
<tr>
<td id="price_area_goods"></td>
<td id="price_area_koopang">2500원</td>
<td id="price_area_result"></td>
</tr>
</table>
</body>
<script type="text/javascript">
$(function(){ //전체선택 체크박스 클릭 
	$("#allchk").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#allchk").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
			} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false); 
			} 
	}) 
});
$(function(){
	$("#price_area").ready(function(){
		var price_area = []; //배열 선언
		var price_length =$("input[name='hidden_price_area']").length; //몇개인지 확인
		$("input[name='hidden_price_area']").each(function(i){
		var price = ($(this).val());
		price_area.push(price);
		}) // 하나씩 배열에 추가
		const price_array = price_area.map((i) => Number(i));
		// 문자열 -> 숫자열 
		var sum = 0; //합계값 선언
		for (var i = 0; i < price_length; i++) {
		var price_count = $("input[name='hidden_price_area_count']").eq(i).attr("value");
		    sum += price_array[i] * price_count; // 숫자열 하나씩 더해주기
		}
		$('#price_area_goods').append("<p> "+sum+"원 </p>");
		var result = sum + 2500;
		$('#price_area_result').append("<p> "+result+"원 </p>");
		
		
	})
});
function cart_delete(){
	var test_arr = [];
	var test_length = $("input[name='goods_chk']:checked").length;
	$("input[name=goods_chk]:checked").each(function(i){
		test_arr.push($(this).val());
	})
		var confirm_test = confirm("삭제하시겠습니까??");
		if (confirm_test == true) {
			 $.ajax({
				type : 'POST',
				url : 'rest/cart_delete',
				dataType: 'json',
				data : {
					test_arr : test_arr
				},
			})
		}
		else if (confirm_test == false){
			alert("취소되었습니다.")
		}
			location.reload(true);
}
</script>
</html>
