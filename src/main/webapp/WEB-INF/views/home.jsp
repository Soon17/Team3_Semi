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
		
		.carousel-inner img {
			border-radius : 10%;
			width : 100%; height : 100%;
			object-fit : cover
		}
	</style>
</head>
<body style="height:2000px">
	<div id="demo" class="carousel slide" data-ride="carousel">
	  <ul class="carousel-indicators">
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	    <li data-target="#demo" data-slide-to="2"></li>
	  </ul>
	  <div class="carousel-inner">
	    <div class="carousel-item active" style="height: 500px; width: 1100px">
	      <img src="<c:url value="/resources/img/anyoujin.jpg"/>" alt="an1">
	      <div class="carousel-caption">
	        <h3>안유진 존예</h3>
	        <p>Jonn.yeah</p>
	      </div>   
	    </div>
	    <div class="carousel-item" style="height: 500px;  width: 1100px">
	      <img src="<c:url value="/resources/img/anyoujin2.jpg"/>" alt="an2">
	      <div class="carousel-caption">
	        <h3>안유진 여신</h3>
	        <p>QueenYouJin</p>
	      </div>   
	    </div>
	    <div class="carousel-item" style="height: 500px;  width: 1100px">
	      <img src="<c:url value="/resources/img/anyoujin3.jpg"/>" alt="an3">
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
	
	<div class="container-fluid">
	  <br>
	  <h3>클래스 둘러보기</h3>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-white navbar-white sticky-top">
	  <a class="navbar-brand text-dark" href="#">전체</a>
	  <ul class="navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link text-muted" href="#">영어</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link text-muted" href="#">프로그래밍</a>
	    </li>
	  </ul>
	</nav>
	
	<div class="container-fluid d-flex" style="gap: 10px;">
	  <div class="card p-2" style="width:300px !important; flex-shrink: 0;">
	    <div class="card-body">
	      <h4 class="card-title">클래스1</h4>
	      <p class="card-text">클래스 설명</p>
	      <a href="#" class="btn btn-primary">바로가기</a>
	    </div>
	  </div>
	  <div class="card p-2" style="width:300px !important; flex-shrink: 0;">
	    <div class="card-body">
	      <h4 class="card-title">클래스2</h4>
	      <p class="card-text">클래스 설명</p>
	      <a href="#" class="btn btn-primary">바로가기</a>
	    </div>
	  </div>
	  <div class="card p-2" style="width:300px !important; flex-shrink: 0;">
	    <div class="card-body">
	      <h4 class="card-title">클래스3</h4>
	      <p class="card-text">클래스 설명</p>
	      <a href="#" class="btn btn-primary">바로가기</a>
	    </div>
	  </div>
	</div>
	
	<div class="container mt-3">
	  <h2>Responsive Embed</h2>
	  <p>Create a responsive video and scale it nicely to the parent element.</p>
	  
	  <h2>Aspect ratio 4:3</h2>
	  <div class="embed-responsive embed-responsive-4by3">
	    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tgbNymZ7vqY"></iframe>
	  </div> 
	  <br>
	  
	  <h2>Aspect ratio 16:9</h2>
	  <div class="embed-responsive embed-responsive-16by9">
	    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tgbNymZ7vqY"></iframe>
	  </div>
	  <br>
	</div>
	
	<h3>실시간 인기 클래스</h3>
	<h3>새로 오픈한 클래스</h3>
	<a href="<c:url value="/teachers"/>" class="btn btn-outline-info btn-teacher-list">강사 목록 보기</a>
</body>
</html>