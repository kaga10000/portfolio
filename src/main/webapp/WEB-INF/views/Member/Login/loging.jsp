<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
</head>
  <body>
  <input type="hidden" name="id" value="${id}">
  <input type="hidden" name="name" value="${name}">
      </body>
      <script type="text/javascript">
      window.location.href = 'http://localhost:8085/project/';
      </script>
</html>
