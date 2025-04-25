<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				top: 3px;
				right: 2px;
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
			
			.notice-bell {
				position: relative;
				display: inline-block;
				cursor: pointer;
			}
			
			.notification-badge {
			  position: absolute;
			  top: -5px;
			  right: -5px;
			  min-width: 18px;
			  height: 18px;
			  padding: 0 5px;
			  background-color: red;
			  color: white;
			  font-size: 11px;
			  font-weight: bold;
			  border-radius: 10px;
			  text-align: center;
			  line-height: 18px;
			  display: inline-block;
			}
			
		</style>
	</head>
	<body>
	<div id="overlay" class="category-overlay"></div>
	<nav class="navbar navbar-expand-xl navbar-light" style="background-color: white;  z-index: 9999;">
		<div class="container-fluid d-flex justify-content-center align-items-center container" style="padding: 10px 0; ">
	
			<!-- 로고 -->
			<a class="navbar-brand px-3 mr-4" href="<c:url value='/'/>">
			  <svg width="160" height="40" viewBox="0 0 200 60" xmlns="http://www.w3.org/2000/svg" style="vertical-align: middle;">
			    <text x="0" y="45"
			          font-family="Arial, Helvetica, sans-serif"
			          font-size="40"
			          font-weight="bold"
			          fill="#111">
			      Class<tspan fill="#007BFF">KH</tspan>
			    </text>
			  </svg>
			</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
			  aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			  <span class="navbar-toggler-icon"></span>
			</button>
			
			
			<!-- 이 부분은 기존 메뉴들을 감싸는 div -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<div class="d-flex justify-content-between w-100 align-items-center">
				
					<!-- 좌측정렬 -->
					<div class="d-flex flex-column flex-lg-row align-items-start align-items-lg-center gap-2">
						<div class="nav-item">
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
						</div>
						<div class="nav-item">
							<!-- 검색창 -->
							<div class="search mr-4">
								<form action="<c:url value='/search' />" method="GET">
								    <input type="text" name="keyword" class="searchHolder" placeholder="관심주제, 클래스, 크리에이터 찾기">
								    <button type="submit" style="background: none; border: none; position: absolute; right: 12px; top: 10px;">
								        <img id="search" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="검색">
								    </button>
								</form>
							</div>
						</div>
						<div class="nav-item">
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
														<a class="dropdown-item" href="<c:url value='/admin/requestCreator'/>">강사 요청 리스트</a>
														<a class="dropdown-item" href="<c:url value='/admin/requestClass'/>">강의 요청 리스트</a>
														<a class="dropdown-item" href="<c:url value='/admin/list'/>">회원 리스트</a>
														<a class="dropdown-item" href="<c:url value='/admin/update'/>">개인 정보 수정</a>
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
														<a class="dropdown-item" href="<c:url value='/user/myPage'/>">마이페이지</a>
														<a class="dropdown-item" href="<c:url value='/teacher/${member.me_num }'/>">강사페이지</a>
													 	<a class="dropdown-item" href="<c:url value='/class/insert/${member.me_num }'/>">클래스 등록</a>
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
						</div>
					</div>
					
					<!-- 우측 정렬 -->
					<div class="nav-item ms-auto">
						<div class="nav-item">
							<!-- 로그인 상태 -->
							<div class="d-flex align-items-center justify-content-center" style="width: 200px; height: 50px;">
								<c:choose>
									<c:when test="${not empty sessionScope.member}">
										<!-- 알림 벨 자리 -->
										<div class="notice-bell">
										    
										</div>
										<c:choose>
											<c:when test="${fn:startsWith(sessionScope.member.me_profile, 'http')}">
												<img src="${sessionScope.member.me_profile}"
												     alt="프로필"
												     style="width:30px; height:30px; border-radius:50%; object-fit:cover; margin-right:10px;" />
											</c:when>
											<c:when test="${not empty sessionScope.member.me_profile}">
												<img src="<c:url value='/profile/${sessionScope.member.me_profile}' />"
												     alt="프로필"
												     style="width:30px; height:30px; border-radius:50%; object-fit:cover; margin-right:10px;" />
											</c:when>
											<c:otherwise>
												<img src="<c:url value='/profile/default.png' />"
												     alt="기본 프로필"
												     style="width:30px; height:30px; border-radius:50%; object-fit:cover; margin-right:10px;" />
											</c:otherwise>
										</c:choose>
									  
										<div style="display: flex; align-items: center; gap: 6px;">
											<span class="css-login" title="${sessionScope.member.me_nick}">
												${sessionScope.member.me_nick}
											</span>
											 <span style="margin-right: 10px;">님</span>
										</div>
										<a href="<c:url value='/logout'/>" class="css-login">로그아웃</a>
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
					</div>
				</div>
				
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
		
		//알림 벨 비동기 로딩
		$.ajax({
			async: true,
			url: '<c:url value="/noticeBell"/>',
			type: 'post',
			success: function (data) {
				$(".notice-bell").html(data);
			}
		});
		
		$(".notice-bell").click(() => {
			const userAuthority = "${sessionScope.member.me_authority}"
			
			if (userAuthority === "ADMIN") {
				let count = $(".notification-badge").text();
				alert(count + "개의 업무처리가 있습니다.");
			    // 또는 여기에 모달을 띄우거나, AJAX로 알림 리스트를 불러와도 됨
			} else {
			    alert("접근 권한이 없습니다.");
			}
		})
	</script>

	</body>
</html>