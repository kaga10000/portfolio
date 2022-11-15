<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style>
</style>
<jsp:include page="Admin/Admin_include/admin_header.jsp"></jsp:include>
<body>
<h1 style="margin-top: 100px;">관리자 리스트</h1> <h1><button>회원 리스트</button></h1>

<br>	
<table style="border: 0; width: 100%; background-color: #92a4e4; text-align: center;">
<tr>
<td>번호</td>
<td>관리자아이디</td>
<td>비밀번호</td>
<td>관리자이름</td>
<td>폰번호</td>
<td>관리자등급</td>
</tr>
<c:forEach var="admin" items="${alist}">
<tr style= "background-color: #ffffff">
<td>${admin.admin_code}</td>
<td>${admin.admin_id}</td>
<td>${admin.admin_pw}</td>
<td>${admin.admin_name}</td>
<td>${admin.admin_phone}</td>
<td>${admin.admin_level}</td>
</tr>
</c:forEach>
</table>
</body>
