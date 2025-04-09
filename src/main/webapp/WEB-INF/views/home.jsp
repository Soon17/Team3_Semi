<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

  <style>
    .carousel-inner img {
      border-radius: 10%;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .swiper {
      width: 100%;
      padding: 20px 0;
    }

    .swiper-slide {
      width: 250px !important;
    }

    .card-img-top {
      height: 150px;
      object-fit: cover;
    }

    .swiper-button-next,
    .swiper-button-prev {
      color: #333;
    }
  </style>
</head>

<body style="height:2000px">
  <!-- 캐러셀 -->
  <div id="demo" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
      <li data-target="#demo" data-slide-to="0" class="active"></li>
      <li data-target="#demo" data-slide-to="1"></li>
      <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <div class="carousel-inner">
      <div class="carousel-item active" style="height: 500px;">
        <img src="<c:url value='/resources/img/anyoujin.jpg'/>" alt="an1">
        <div class="carousel-caption">
          <h3>안유진 존예</h3>
          <p>Jonn.yeah</p>
        </div>   
      </div>
      <div class="carousel-item" style="height: 500px;">
        <img src="<c:url value='/resources/img/anyoujin2.jpg'/>" alt="an2">
        <div class="carousel-caption">
          <h3>안유진 여신</h3>
          <p>QueenYouJin</p>
        </div>   
      </div>
      <div class="carousel-item" style="height: 500px;">
        <img src="<c:url value='/resources/img/anyoujin3.jpg'/>" alt="an3">
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

  <!-- 카테고리 메뉴 -->
  <div class="container-fluid">
    <br>
    <h3>클래스 둘러보기</h3>
  </div>

  <nav class="navbar navbar-expand bg-white navbar-white sticky-top">
    <a class="navbar-brand text-dark" >카테고리별</a>
    <ul class="navbar-nav">
      <c:forEach items="${list}" var="ca">
        <li class="nav-item">
          <a href="#" class="nav-link text-muted category-link " data-category="${ca.ca_name}">${ca.ca_name}</a>
        </li>
      </c:forEach>
    </ul>
  </nav>

  <!-- 클래스 카드 고정 목록 -->
  <div class="container-fluid py-3">
    <div class="swiper mySwiper">
      <div class="swiper-wrapper swiper-Class">
        <!-- 카드 반복 시작 -->
        
        <!-- 카드 반복 끝 -->
      </div>

      <!-- 슬라이드 화살표 -->
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
    </div>
  </div>

  <hr>

  <!-- 최신 클래스 슬라이드 -->
  <div class="container-fluid">
    <br>
    <h3>최신 클래스</h3>
  </div>

  

  <!-- 슬라이드 초기화 스크립트 -->
  <script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 3,
      spaceBetween: 10,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
      },
      grabCursor: true
    });
    
    $(".category-link").on("click",function(e){
    	e.preventDefault();
    	const ca_name = $(this).data("category");
    	$.ajax({
    		async: true,
    		url: '<c:url value="/class/categoryClass"/>',
    		type: 'GET',
    		data: { ca_name : ca_name },
    		success: function (data) {
    			$(".swiper-Class").empty();
    			$(".swiper-Class").html(data);
    		}
    	});
    });
  </script>

  <!-- 강사 목록 버튼 -->
  <a href="<c:url value='/teachers'/>" class="btn btn-outline-info btn-teacher-list">강사 목록 보기</a>
</body>
</html>
