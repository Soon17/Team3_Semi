<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	      <img src="<c:url value="/resources/img/sample.png"/>" alt="Los Angeles" width="1100" height="500">
	      <div class="carousel-caption">
	        <h3>Los Angeles</h3>
	        <p>We had such a great time in LA!</p>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="<c:url value="/resources/img/sample.png"/>" alt="Chicago" width="1100" height="500">
	      <div class="carousel-caption">
	        <h3>Chicago</h3>
	        <p>Thank you, Chicago!</p>
	      </div>   
	    </div>
	    <div class="carousel-item">
	      <img src="<c:url value="/resources/img/sample.png"/>" alt="New York" width="1100" height="500">
	      <div class="carousel-caption">
	        <h3>New York</h3>
	        <p>We love the Big Apple!</p>
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
	 
	${pw}
	<h3>실시산 인기 클래스</h3>
	<h3>새로 오픈한 클래스</h3>
</body>
</html>