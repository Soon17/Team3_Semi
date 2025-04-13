<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		
	
	</head>
	
	<body>
		<c:forEach items="${list }" var="cl">
			<div class="swiper-slide">
	          <div class="card" style="border-radius: 16px; overflow: hidden;">
	            <img src="<c:url value='/resources/img/karina.jpg'/>" class="card-img-top" alt="...">
	            <div class="card-body p-2">
	              <h6 class="mb-1 fw-bold">${cl.me_name }</h6>
	              <p class="mb-0 text-muted" style="font-size: 14px;">${cl.cl_title }</p>
	            </div>
	          </div>
	        </div>
		</c:forEach>
       
        
	</body>
</html>
