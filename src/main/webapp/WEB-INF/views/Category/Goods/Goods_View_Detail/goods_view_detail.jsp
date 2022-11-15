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
.Goods_firstShot_border {
	width: 480px;
	height: 800px;
	margin: 25px 5% 25px 15%;
	padding: 0;
}
.Goods_information_border {
	width: 480px;
	height: 800px;	
	margin: 25px 25px 25px 25px;
	padding: 0;
}
.Goods_contents {
	width: 80%;
	border : 5px solid black;
	margin: 25px 10% 25px 11%;
	padding: 0;
}
.Goods_absolute{
position: absolute;
top: 25%;
left: 25%;
}
span,td{
font-size:25px;
color:#262626;
font-weight:bold;
width: 125px;
}
th{
width: 35%;
}
.detail_menu li{
display: inline-block;
margin-right: 50px;
	}
	.Goods_contents div{
	width: 100%;
	}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<body>
<body>
	<jsp:include page="../../../include/header.jsp"></jsp:include>
	<h4>상품 상세보기</h4>
	<c:forEach var="goods" items="${Goods_view}">
<section> <!-- 상품 썸네일 section -->
	<div class="Goods_firstShot_border"><img src="resources/image/upload/${goods.goods_firstshot}" style="width: 500px; height: 800px;"></div>
</section> <!-- 썸네일 section 끝 -->
	<section> <!-- 상품 정보 section -->
	<div class="Goods_information_border">
	<p style="float:left; padding-left: 50px;">
	<span>${goods.goods_title}</span>
	</p>
	<table style="width: 100%; border-top:1px solid red; border-bottom: 1px solid red;">
	<tr>
	<th>	
	<span>판매가</span>
	</th> 
	<td><input type="hidden" id="goods_price" value="${goods.goods_price}"><span>${goods.goods_price}</span></td>
	</tr>
	<tr>
	<th>	
	<span>배송방법</span>
	</th> 
	<td><span>택배</span></td>
	</tr>
	<tr>
	<th>	
	<span>배송비</span>
	</th> 
	<td><span>2500</span></td>
	</tr>
	</table>
	<div style="width:100%;">
	<p style="font-size: 20px; text-align: left;"><span>수량을 선택해주세요.</span></p>
	<hr>
	<p style="text-align: left;">제목</p>
	<input type='button' onclick='count("plus")' value='+'/>
       <input type='button'  onclick='count("minus")' value='-'/>
<div id='result'>1</div>
<input type="hidden" id="result_count" value="1">
	<hr>
<div><strong>총 상품 금액:</strong> <span id='result_price'>${goods.goods_price}</span><strong> 원</strong></div>
	</div>
   <hr>
   <a href="Buy_Btn?${goods_code}"><button>구매하기</button></a>
   <button onclick="showping_basket(${goods_code})">장바구니</button>
	</div> <!-- 상품정보 section 끝 -->
	</section>
	<section> <!-- 상품글 section 시작 -->
	<div class = "Goods_contents">
	<div class = "detail_menu" style="width: 100%;"> <!-- 상품 ahref 시작 -->
	<ul style= "text-align: center;	width: 100%; padding: 0px;">
	<li class = "selected"><a href="#goods_detail">상품 상세정보</a></li>
	<li><a href="#goods_sale_detail">상품 구매정보</a></li>
	<li><a href="">상품 사용후기</a></li>
	<li><a href="">상품 QnA</a></li> 
	</ul> 
	</div> <!-- A태그 끝 -->
	<hr>
	<div class="goods_detail" id="goods_detail" style="text-align: center; width: 100%;"> <!-- 상품 상세정보 시작 -->
	<p>
	<img src="resources/image/upload/${goods.goods_firstshot}" style="width:40%; height: 800px;">
	</p>
	</div> <!-- 상품 상세정보 끝 -->
	<div class = "detail_menu" style="width: 100%;"> <!-- 상품 ahref 시작 -->
	<ul style= "text-align: center;	width: 100%; padding: 0px;">
	<li><a href="#goods_detail">상품 상세정보</a></li>
	<li class = "selected"><a href="#goods_sale_detail">상품 구매정보</a></li>
	<li><a href="">상품 사용후기</a></li>
	<li><a href="">상품 QnA</a></li> 
	</ul> 
	</div> <!-- A태그 끝 -->
	<div style=" text-align:center;" id="goods_sale_detail"> <!-- 구매정보 시작 -->
	<div> <!-- 구매정보 접기 / 펼치기 -->
	<h3>상품 결제정보</h3>
	고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
    정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp;
    <br>
    <br>
    무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;
	<br>
	주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지
    않은 주문은 자동취소 됩니다.  &nbsp;
	<h3>상품 배송정보</h3>
	<ul style="width: 100%; padding: 0px; ">
	<li>배송 방법 : 택배</li>
	<li>배송 지역 : 전국지역</li>
	<li>배송 비용 : 2,500원</li>
	<li>배송 기간 : 3일 ~ 7일</li>
	<li>배송 안내 : 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다. <br>
고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다.<br> 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</li>
	</ul>
	<h3>상품 교환 및 반품 안내</h3>
	<b>상품 교환 및 반품 주소</b>
	<br>
	인천 광역시 당하동 동아아파트
	<br><br>
	<b>교환이 가능한 경우</b>
	<br>
	-상품을 공급 받으신 날로부터 7일이내
	<br> 
	단, 가전제품의 경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.
	<br>
- 공급받으신 상품 및 용역의 내용이 표시.광고 내용과 <br>
  다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내
  <br>
  <br>
  <b>교환 및 반품이 불가능한 경우</b>
  <br>
- 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여 <br>
  포장 등을 훼손한 경우는 제외 <br>
- 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>
  (예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에
  따른 반품/교환은 제조사 기준에 따릅니다.)<br>
- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을
  제공한 경우에 한 합니다.<br>
- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
- 복제가 가능한 상품등의 포장을 훼손한 경우
  (자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)<br>

※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.
  (색상 교환, 사이즈 교환 등 포함)<br>
	<br>
	</div>
  <hr>
	</div> <!-- 구매정보 끝 -->
	<div class = "detail_menu" style="width: 100%;"> <!-- 상품 ahref 시작 -->
	<ul style= "text-align: center;	width: 100%; padding: 0px;">
	<li class = "selected"><a href="#goods_detail">상품 상세정보</a></li>
	<li><a href="">상품 구매정보</a></li>
	<li><a href="">상품 사용후기</a></li>
	<li><a href="">상품 QnA</a></li> 
	</ul> 
	</div> <!-- A태그 끝 -->
	
	<div style="width: 100%;"> <!-- 사용후기 시작 -->
	<table style="border: 0; width: 100%; background-color: #F8E6E0;text-align: center;">
	<tr>
	<td>코드</td>
	<td>제목</td>
	<td>작성자</td>
	<td>작성일</td>
	<td>조회수</td>
	</tr>
	<c:forEach var="review" items="${rlist}">
	<tr>
	<td>${reivew.reivew_code}</td>
	<td>${reivew.reivew_title}</td>
	<td>${reivew.reivew_id}</td>
	<td>${reivew.reivew_regdate}</td>
	<td>${reivew.reivew_hit}</td>
	</tr>
	</c:forEach>
	</table>
	<div style="text-align: right; width: 100%;"> <!-- 리뷰관련 버튼 -->
	<a href="Review_write?goods_code=${goods_code}"><button>상품후기쓰기</button></a>
	<a href="Review_view"><button>후기모두보기</button></a>
	</div>
	<div style="text-align: center;"> 페이징 ! </div>
	
	</div> <!-- 끝 -->
	</div> 
	</section> <!-- 상품글 section 끝 -->
   	</c:forEach>
</body>
<script type="text/javascript">
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  const price = document.getElementById('goods_price').value;
	  const resultprice_Element = document.getElementById('result_price'); 
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  console.log(number);
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	    $('#result_count').attr('value',number);
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1;
	    $('#result_count').attr('value',number);
	  } 
	  if(number <= -1){
		  alert("최소 구매수량은 0개입니다.")
		  number = 0;
		  $('#result_count').attr('value',number);
	  }
	  const result_price = price * number;
	  console.log(result_price);
	  
	  // 결과 출력
	  resultElement.innerText = number;
	  resultprice_Element.innerText = result_price;
	}
	
function showping_basket(goods_code) {
	var id = '<%=(String) session.getAttribute("id")%>';
	var goods_count = document.getElementById("result_count").value;
	goods_count = parseInt(goods_count);
	var json = new Object();
	json.goods_code = goods_code;
	json.goods_count = goods_count;
	json.member_id = id;
var confirm_test = confirm("장바구니에 추가합니까?");
if (confirm_test == true) {
	 $.ajax({
		type : 'POST',
		url : 'rest/showping_basket_insert',
		contentType : 'application/json; charset=UTF-8',
		data : JSON.stringify(json),
		success : function(data) {
			alert("추가되었습니다!")
		}
	})
}
else if (confirm_test == false){
	alert("취소되었습니다.")
}
	}
</script>
</html>
