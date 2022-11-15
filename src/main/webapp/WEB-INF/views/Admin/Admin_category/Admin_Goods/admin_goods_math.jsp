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
.Goods_main_border {
	width: 200px;
	height: 300px;
	border: 5px solid black;
	margin: 25px 25px 25px 25px;
	padding: 0;
}

.Goods_absolute {
	position: absolute;
	top: 25%;
	left: 25%;
}

input[type="checkbox"] {
	width: 20px;
	height: 20px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<body>
<body>
	<jsp:include page="../../Admin_include/admin_header.jsp"></jsp:include>
	<section>
		<!-- 상품 분류 -->
		<h4>어드민 영어 상품관리</h4>
		<a href="<c:url value='admin_goods_Enrollment.class?math'/>"><button
				style="float: right;">상품등록</button></a>
		<table
			style="border: 0; width: 100%; background-color: #92a4e4; text-align: center;">
			<tr>
				<td width="80px;"><input type="checkbox" id="allchk">
				<td>상품코드</td>
				<td>상품업로더</td>
				<td>상품분류</td>
				<td>썸네일</td>
				<td>제목</td>
				<td>가격</td>
				<td>판매수량</td>
				<td>댓글</td>
				<td>조회수</td>
				<td>상품 보유량</td>
				<td>생성일</td>
				<td>최근수정일</td>
			</tr>
			<c:forEach var="goods" items="${glist}">
				<tr style="background-color: #E6E0F8;">
					<td><input type="checkbox" value="${goods.goods_code}"
						name="goods_chk" id="goods_chk"></td>
					<td>${goods.goods_code}</td>
					<td>${goods.goods_id}</td>
					<td>${goods.goods_class}
					<input type="hidden" value="math"
					name="goods_class" id="goods_class">
					</td>
					<td><a href='goods_view_detail?goods_code=${goods.goods_code}'><img
							src="resources/image/upload/${goods.goods_firstshot}"
							style="width: 50px; height: 50px;"></a></td>
					<td>${goods.goods_title}</td>
					<td>${goods.goods_price}원</td>
					<td>${goods.goods_salenumber}</td>
					<td>${goods.goods_comment}</td>
					<td>${goods.goods_hit}</td>
					<td>${goods.goods_inven}개</td>
					<td>${goods.goods_regdate}</td>
					<td>${goods.goods_updatedate}</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<section>
		<ul class="board_btn">
			<li><input type="button" value="삭제" onclick="board_delete()"></li>
			<li><input type="button" value="변경" onclick="board_update()"></li>
		</ul>
	</section>
	<div>${Paging}</div>
</body>
<script>
$(function(){ //전체선택 체크박스 클릭 
	$("#allchk").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#allchk").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
			} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false); 
			} 
	}) 
});
function board_delete(){
	var test_arr = [];
	var test_length = $("input[name='goods_chk']:checked").length;
	$("input[name=goods_chk]:checked").each(function(i){
		test_arr.push($(this).val());
	})
		var confirm_test = confirm("삭제하시겠습니까??");
		if (confirm_test == true) {
			 $.ajax({
				type : 'POST',
				url : 'rest/board_delete',
				dataType: 'json',
				data : {
					test_arr : test_arr
				},
				success : function(data) {
					location.reload();
				},
				error : function(err) {
					console.log(err);
				}
			})
		}
		else if (confirm_test == false){
			alert("취소되었습니다.")
		}
}

function board_update(){
var id = '<%=(String) session.getAttribute("id")%>';
		var goods_code = $("input[name='goods_chk']:checked").val();
		var test = $("input[name='goods_chk']:checked").length;
		var test_class = $("#goods_class").val();
		console.log(test_class);
		console.log(test);
		if (test == 1 ){
			var confirm_test = confirm("수정?");
			if (confirm_test == true) {
				location.href = 'board_update?goods_code=' + goods_code +'&goods_class='+test_class;
			} else if (confirm_test == false) {
				alert("취소")
			}
		}
			else {
			alert("두개이상의 글을 수정할 수 없습니다.");
		}
	}
</script>
</html>
