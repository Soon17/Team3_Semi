<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<style>
		/* Make the image fully responsive */
		.carousel-inner img {
		  width: 100%;
		  height: 100%;
		}
	</style>
</head>
<body>
	<div id="demo" class="carousel slide" data-ride="carousel">
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="<c:url value="/resources/img/anyoujin.jpg"/>" alt="Los Angeles" width="1100" height="500">
	      <div class="carousel-caption">
	        <h3>안유진 존예</h3>
	        <p>Jonn.yeah</p>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="<c:url value="/resources/img/anyoujin2.jpg"/>" alt="Chicago" width="1100" height="500">
	      <div class="carousel-caption">
	        <h3>안유진 여신</h3>
	        <p>QueenYouJin</p>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="<c:url value="/resources/img/anyoujin3.jpg"/>" alt="New York" width="1100" height="500">
	      <div class="carousel-caption">
	        <h3>안유진 인정</h3>
	        <p>MS.An, submit</p>
	      </div>   
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#demo" data-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#demo" data-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
	
	<h3>실시간 인기 클래스</h3>
	<h3>새로 오픈한 클래스</h3>
	<a href="<c:url value="/teachers"/>" class="btn btn-outline-info btn-teacher-list">강사 목록 보기</a>
</body>
</html>