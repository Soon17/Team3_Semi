<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
	<style type="text/css">
		.error,.red{ color : red; }
		.green{ color : green; }
	</style>
	<title>로그인</title>
</head>
<body>
	
	 <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=a209846bb41627e1da96872fa6fd97b8&redirect_uri=	
		http://localhost:8080/spring/login&response_type=code">
        <img src="<c:url value='/resources/static/kakao_login_medium_narrow.png' />" alt="카카오 로그인" style="height:30px">
    </a>
    
    
    
</body>
</html>