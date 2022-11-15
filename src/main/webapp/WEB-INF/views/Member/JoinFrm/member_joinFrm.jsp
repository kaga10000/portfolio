<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#joinFrm_border {
	padding: 20px 20px 20px 20px;
	background-color: #f8f8f8;
	width: 50%;
	height: 100%;
	margin-left: 25%;
}

input, textarea {
	width: 95%;
	padding: 15px;
	border: 1px solid #eaeaea;
	border-radius: 2px;
	margin-top: 5px;
	clear: both;
}

h2 {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../../include/header.jsp"></jsp:include>
	<div id="test" class="test">
		<form name="joinFrm" action="memberjoin" method="post"
			onsubmit="return check()">
			<div id="joinFrm_border">
				<!-- 관리자 회원가입 보더 -->
				<h2>Daiabognd 회원가입</h2>
				<div>
					<label>아이디</label> <br> <input type="text" id="m_id"
						name="member_id">
				</div>

				<div>
					<label>비밀번호</label> <br> <input type="password" id="m_pw"
						name="member_pw">
				</div>
				<div>
					<label>비밀번호 확인</label> <br> <input type="password" id="pw_chk"
						name="pw_chk">
				</div>
				<div>
					<label>이름</label> <br> <input type="text" id="m_name"
						name="member_name"> <input type="hidden" id="time"
						name="time">
				</div>
				<div>
					<label>휴대폰번호</label> <br> <input type="number" id="mobile1"
						name="mobile1" style="width: 25%;">-<input type="number"
						id="mobile2" name="mobile2" style="width: 25%;">-<input
						type="number" id="mobile3" name="mobile3" style="width: 25%;">
					<br>
				</div>
				<input type="submit" value="회원가입">
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>