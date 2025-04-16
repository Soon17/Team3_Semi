<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="tiles"
uri="http://tiles.apache.org/tags-tiles"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>프로젝트</title>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <c:if test="${empty skipHeader or skipHeader != 'true'}">
        <!-- skipHeader가 없거나 'true'가 아닐 경우 header를 출력 -->
        <tiles:insertAttribute name="header" />
    </c:if>
    <div class="container">
        <tiles:insertAttribute name="body" />
    </div>
    <c:if test="${empty skipFooter or skipFooter != 'true'}">
        <!-- skipHeader가 없거나 'true'가 아닐 경우 header를 출력 -->
        <tiles:insertAttribute name="footer" />
    </c:if>
  </body>
</html>
