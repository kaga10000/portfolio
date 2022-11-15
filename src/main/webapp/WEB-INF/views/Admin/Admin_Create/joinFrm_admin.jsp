<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#joinFrm_border{
padding: 20px 20px 20px 20px;
	background-color: #f8f8f8;
	width: 50%;
	height: 100%;
	margin-left: 25%;
}
input , textarea{
    width: 95%;
    padding: 15px;
    border: 1px solid #eaeaea;
    border-radius: 2px;
    margin-top: 5px;
    clear: both;
}
h2{
text-align: center;
}
</style>
</head>
<body>
<jsp:include page="../Admin_include/admin_header.jsp"></jsp:include>
<div id="test" class="test">
	<form name="joinFrm" action="joinFrm_admin" method="post"
		onsubmit="return check()">
		<div id="joinFrm_border"> <!-- 관리자 회원가입 보더 --> 
		<h2> 관리자 등록 </h2>
			<div>
				<label>아이디</label>
				<br>
				<input type="text" id="admin_id" name="admin_id">
			</div>
		
		<div>
				<label>비밀번호</label>
				<br>
				<input type="password" id="admin_pw" name="admin_pw">
		</div>			
		<div>
				<label>비밀번호 확인</label>
				<br>
				<input type="password" id="admin_pw_chk" name="admin_pw_chk">
		</div>		
		<div>
				<label>이름</label>
				<br>
				<input type="text" id="admin_name" name="admin_name">
				<input type="hidden" id="time" name="time">
		</div>			
		<div>
				<label>휴대폰번호</label>
				<br>
				<input type="number" id="mobile1" name="mobile1" style="width:25%;">-<input type="number" id="mobile2" name="mobile2" style="width:25%;">-<input type="number" id="mobile3" name="mobile3" style="width:25%;">
		</div>
			<div>
			<label>관리자 레벨</label>
			<br>
			<select name="admin_level">
									<option value="null" selected>선택</option>
									<option value="M">마스터</option>
									<option value="G">관리자</option>
									<option value="N">사원</option>
							</select>
			</div>
				<input type="submit"value="등록하기">
		
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
</script>
</html>