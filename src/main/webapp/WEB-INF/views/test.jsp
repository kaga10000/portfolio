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

</style>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<body>

<body>
<jsp:include page="include/header.jsp"></jsp:include>

<c:forEach items="${test2}" var="member">
<table>
<tr>
<td>
회원아이디
</td>
<td>${member.member_id}</td>
</tr>
<tr>
<td>회원 코드</td>
<td>${member.member_code}</td>
</tr>
<tr>
<td>
회원비번
</td>
<td>${member.member_pw}</td>
</tr>
<tr>
<td>
회원이름
</td>
<td>${member.member_name}</td>
</tr>
<tr>
<td>
회원폰
</td>
<td>${member.member_phone}</td>
</tr>
</table>
</c:forEach>
</body>
</html>
