<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">		
		html, body  {
 			 scrollbar-gutter: stable;
 			
		}
		
		.search {
			position: relative;
			width: 300px;
		}
		
		 .css-login {			
			font-size: 0.875rem;
  			line-height: 1.125rem;
  			font-weight: bold;
  			color: rgb(12, 12, 12);
  			-webkit-text-fill-color: rgb(12, 12, 12);
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
		
		.dropdown-menu {
			position: fixed; /* 화면에 고정 */
			left: 0;
			right: 0;
			width: 100vw;
		}
		
		
		
	</style>
</head>
<body >
	<nav class="navbar navbar-expand-sm navbar-light justify-content-between" style="background-color: white-space;">
		
		<div class="justify-content-between d-flex">
			<!-- Brand -->
			<a class="navbar-brand" href="<c:url value="/"/>">로고이미지~</a>
	
			<!-- Links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/"/>">클래스</a></li>
	
				<!-- Dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> 카테고리(드랍다운을 css로 클래스101 사이트처럼) </a>
					<div class="dropdown-menu">
						<c:forEach items="${list }" var="category">
							<a class="dropdown-item" href="<c:url value='/category/${category.ca_num}'/>">
							${category.ca_name}</a>
						</c:forEach>
					</div>
				</li>
			</ul>
			<div class="search">
				<form action="/search" method="GET">
					<!-- 검색은  -->
					<input type="text" name="query" class="searchHolder"
						placeholder="관심주제, 클래스, 크리에이터 찾기"> <img id="search"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</form>
			</div>
			<c:if test="${sessionScope.member.me_authority eq 'ADMIN'}">
				<div>
					<ul class="navbar-nav">
						<!-- Dropdown -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown">관리자 전용</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<c:url value='/admin/request/creator'/>">강사 요청 리스트</a>
								<a class="dropdown-item" href="<c:url value='#'/>">강의 요청 리스트</a>
								<a class="dropdown-item" href="<c:url value='#'/>">회원 리스트</a>
							</div>
						</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${sessionScope.member.me_authority eq 'USER'}">
				<div style="display: flex; align-items: center; height: 43px;">
					<a href="<c:url value='/myPage'/>" style="margin-left: 10px; color: black; font-weight: bold; text-decoration: none;">
					마이 페이지</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.member.me_authority eq 'TEACHER'}">
				<div>
					<a>강사야</a>
				</div>
			</c:if>
		</div>
		
		<div class="d-flex">
			<c:choose>
				<c:when test="${not empty sessionScope.member}">
					<div style="display: flex; align-items: center; height: 43px;">
						 <span class="css-login">${sessionScope.member.me_nick}</span>님
						<a href="<c:url value='/logout'/>" 
							class="css-login" style="margin-left: 20px;"> 로그아웃
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<a href="<c:url value='/signup'/>"> <span class="css-login">로그인</span>
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>
</body>
</html>