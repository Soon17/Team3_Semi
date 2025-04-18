<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
	  
	
	</head>
	
	<body>
            
                <option value="" disabled selected>-- 선택하세요 --</option>
                <c:forEach items="${list }" var="sc">
	       			<option value="${sc.sc_name}">${sc.sc_name }</option>
       			</c:forEach>
		
	</body>
</html>