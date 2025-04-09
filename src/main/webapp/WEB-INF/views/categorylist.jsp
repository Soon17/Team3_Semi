<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
	  
	
	</head>
	
	<body>
		<c:forEach items="${list }" var="category">
	        <a class="dropdown-item" href="<c:url value='/category/${category.ca_num}'/>">
	        ${category.ca_name}</a>
        </c:forEach>
	</body>
</html>
