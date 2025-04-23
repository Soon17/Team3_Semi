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
		<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="none" stroke="black" stroke-width="2" viewBox="0 0 24 24"
					    	style="margin-right: 10px">
	      <path d="M18 8a6 6 0 00-12 0v5H4l1 2h14l1-2h-2V8z" />
	      <path d="M13.73 21a2 2 0 01-3.46 0" />
	    </svg>
	    <c:choose>
	    	<c:when test="${sessionScope.member.me_authority eq 'ADMIN'}">
	    		<c:if test="${waitingRequestCount > 0}">
				    <!-- 레드닷 -->
					<span class="notification-badge">${waitingRequestCount}</span>
	    		</c:if>
	    	</c:when>
	    	<c:when test="${sessionScope.member.me_authority eq 'USER'}">
	    	</c:when>
	    	<c:when test="${sessionScope.member.me_authority eq 'TEACHER'}">
	    	</c:when>
	    </c:choose>
	</body>
</html>