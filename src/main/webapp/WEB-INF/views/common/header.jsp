<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
	
			.dropdown-menu.category-list.show{
				position: absolute;
				top: 80px; /* 헤더 높이만큼 조정하세요! */
				padding: 100px;
				z-index: 9999;
				background-color:white;
				border :none;
				
			}		
			html, body  {
				scrollbar-gutter: stable;
				
			}
			
			.search {
				position: relative;
				width: 300px;
				min-width: 250px;
				flex-shrink: 0; 
			}
			
			.css-login {			
				font-size: 0.875rem;
				line-height: 50px;;
				font-weight: bold;
				color: rgb(12, 12, 12);
				-webkit-text-fill-color: rgb(12, 12, 12);
				display: inline-block;
				max-width: 100px;
				overflow: hidden;
				white-space: nowrap;
				text-overflow: ellipsis;
			}
			.css-login:hover {
				text-decoration: none;
			}	
			
			.searchHolder {
				width: 100%;
				border: 1px solid #bbb;
				border-radius: 8px;
				padding: 10px 12px;
				font-size: 14px;
			}
			
			#search {
				position: absolute;
				width: 17px;
				top: 10px;
				right: 12px;
				margin: 0;
			}
			
			.category-list {
				position: fixed;
				left: 0;
				right: 0;
				width: 100vw;
			}
			
			.category-overlay {
			  position: fixed;
			  top: 0;
			  left: 0;
			  width: 100vw;
			  height: 100vh;
			  background-color: rgba(128, 128, 128, 0.5); /* 회색 반투명 */
			  z-index: 1100;
			  display: none;
			  pointer-events: all;
			}
			
			.navbar-nav {
  			  white-space: nowrap;
			}
			
		</style>
	</head>
	<body>
	<div id="overlay" class="category-overlay"></div>
	<nav class="navbar navbar-expand navbar-light" style="background-color: white;  z-index: 9999;">
		<div class="container-fluid d-flex justify-content-center align-items-center" style="padding: 10px 0; ">
	
			<!-- 로고 -->
			<a class="navbar-brand px-3 mr-4" href="<c:url value="/"/>">로고이미지~</a>
	
			<!-- 메뉴 -->
			<ul class="navbar-nav d-flex flex-row align-items-center mr-4">
				<li class="nav-item mr-3">
					<a class="nav-link" href="<c:url value="/"/>">클래스</a>
				</li>
				<li class="nav-item dropdown" style="position:static;">
					<a class="nav-link dropdown-toggle ca" href="#" id="navbardrop" data-toggle="dropdown">카테고리</a>
						<div class="dropdown-menu category-list">
									
						</div>
				</li>
			</ul>
	
			<!-- 검색창 -->
			<div class="search mr-4">
				<form action="/search" method="GET">
					<input type="text" name="query" class="searchHolder" placeholder="관심주제, 클래스, 크리에이터 찾기">
					<img id="search" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</form>
			</div>
	
			<!-- 권한별 메뉴 -->
			<div class="d-flex align-items-center mr-4" style="min-width: 150px;">
				<c:choose>
					<c:when test="${sessionScope.member.me_authority eq 'ADMIN'}">
						<div>
							<ul class="navbar-nav">
								 <!-- Dropdown -->
								 <li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown">관리자 전용</a>
										<div class="dropdown-menu">
											 <a class="dropdown-item" href="<c:url value='#'/>">강사 요청 리스트</a>
											 <a class="dropdown-item" href="<c:url value='/admin/requestClass'/>">강의 요청 리스트</a>
											 <a class="dropdown-item" href="<c:url value='/admin/list'/>">회원 리스트</a>
										</div>
								 </li>
							</ul>
					 </div>
					</c:when>
					<c:when test="${sessionScope.member.me_authority eq 'USER'}">
						<a href="<c:url value='/user/myPage'/>" class="nav-link p-0" style="color: black;">
						  <div style="display: flex; align-items: center; font-weight: bold; font-size: 13px; gap: 6px;">
						    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="none" stroke="black" stroke-width="2" viewBox="0 0 24 24">
						      <circle cx="12" cy="8" r="4" />
						      <path d="M4 20c0-4 4-6 8-6s8 2 8 6" />
						    </svg>
						    <span>마이페이지</span>
						  </div>
						</a>
					</c:when>
					<c:when test="${sessionScope.member.me_authority eq 'TEACHER'}">
						<div>
							<ul class="navbar-nav">
								 <!-- Dropdown -->
								 <li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbardrop"
										data-toggle="dropdown">강사 전용</a>
										<div class="dropdown-menu">
											 <a class="dropdown-item" href="<c:url value='#'/>">강사페이지</a>
											 <a class="dropdown-item" href="<c:url value='#'/>">클래스 등록</a>
										</div>
								 </li>
							</ul>
					 	</div>
					</c:when>
					<c:otherwise>
						<span style="visibility: hidden;">마이 페이지</span>
					</c:otherwise>
				</c:choose>
			</div>
	
		<!-- 로그인 상태 -->
		<div class="d-flex align-items-center justify-content-center" style="width: 200px; height: 50px;">
			<c:choose>
				<c:when test="${not empty sessionScope.member}">
				  <!-- 알림 벨 자리 -->
				    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="none" stroke="black" stroke-width="2" viewBox="0 0 24 24"
				    	style="margin-right: 10px">
				      <path d="M18 8a6 6 0 00-12 0v5H4l1 2h14l1-2h-2V8z" />
				      <path d="M13.73 21a2 2 0 01-3.46 0" />
				    </svg>
					<div style="display: flex; align-items: center; gap: 6px;">
						<span class="css-login" title="${sessionScope.member.me_nick}">
							${sessionScope.member.me_nick}
						</span>
						 <span style="margin-right: 10px;">님</span>
						<a href="<c:url value='/logout'/>" class="css-login">로그아웃</a>
					</div>
				</c:when>
				<c:otherwise>
					<div style="width: 100%; text-align: center;">
						<a href="<c:url value='/signup'/>" class="css-login" style="padding: 10px 15px; display: inline-block;">
							로그인
						</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		</div>
	</nav>
	<script type="text/javascript">
	// 카테고리 리스트 비동기 로딩
	$.ajax({
		async: true,
		url: '<c:url value="/categoryList"/>',
		type: 'post',
		success: function (data) {
			console.log(data);
			$(".category-list").html(data);
		}
	});

		// 카테고리 버튼 클릭 시 토글
		$('.ca').on('click', function (e) {
			e.preventDefault(); // 기본 이벤트 막기
			e.stopPropagation(); // 이벤트 버블링 차단 (중요!)
		
			const $overlay = $('#overlay');
			const $dropdown = $('.dropdown-menu.category-list');
		
			if ($dropdown.hasClass('show')) {
				$dropdown.removeClass('show');
				$overlay.fadeOut(100);
			} else {
				$dropdown.addClass('show');
				$overlay.fadeIn(100);
			}
		});
		
		// 오버레이 클릭 시 닫기
		$('#overlay').on('click', function () {
			$(this).fadeOut(100);
			$('.dropdown-menu.category-list').removeClass('show');
		});
		</script>

	</body>
</html>