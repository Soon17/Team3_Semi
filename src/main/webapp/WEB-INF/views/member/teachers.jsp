<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

</head>
<body>
	<h2>강사 정보</h2>
	<div class="container d-inline-flex p-3" style="background-color: gray;">
	  <div class="card p-2 ml-10" style="width:200px">
	    <img class="card-img-top rounded-circle" src="<c:url value="/resources/img/anyoujin4.jpg"/>" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">안유진</h4>
	      <p class="card-text">강아지상 안유진</p>
	      <a href="#" class="btn btn-primary">프로필 보기</a>
	    </div>
	  </div>
	  
	  <div class="card p-2 ml-10" style="width:200px">
	    <img class="card-img-top rounded-circle" src="<c:url value="/resources/img/anyoujin5.jpg"/>" alt="Card image" style="width:100%">
	    <div class="card-body">
	      <h4 class="card-title">An-Youjin</h4>
	      <p class="card-text">고양이상 안유진</p>
	      <a href="#" class="btn btn-primary">프로필 보기</a>
	    </div>
	  </div>
	</div>
</body>
</html>