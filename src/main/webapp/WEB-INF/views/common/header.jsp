<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		.search {
		  position: relative;
		  width: 300px;
		 
		}
		.css-login {
		    text-align: left;
		    color: rgb(12, 12, 12);
		    -webkit-text-fill-color: rgb(12, 12, 12);
		    font-size: 0.875rem;
		    line-height: 1.125rem;
		    font-weight: 400;
		}
		input {
		  width: 100%;
		  border: 1px solid #bbb;
		  border-radius: 8px;
		  padding: 10px 12px;
		  font-size: 14px;
		}
		
		img {
		  position : absolute;
		  width: 17px;
		  top: 10px;
		  right: 12px;
		  margin: 0;
		}
		
		
	</style>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light justify-content-between">
		
	<!-- Brand -->
	<a class="navbar-brand" href="#">로고이미지~</a>
	
	<!-- Links -->
	<ul class="navbar-nav">
		<li class="nav-item">
	    	<a class="nav-link" href="#">클래스</a>
 		</li>
	
	  <!-- Dropdown -->
	    <li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				카테고리(드랍다운을 css로 클래스101 사이트처럼)
			</a>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="#">운동</a>
				<a class="dropdown-item" href="#">영어</a>
				<a class="dropdown-item" href="#">프로그래밍</a>
			</div>
	    </li>
	</ul>
		<div class="search">
			<input type="text" placeholder="관심주제, 클래스, 크리에이터 찾기">
			<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
		</div>
		<div>
			<div class="nav-item">
	          <a class="nav-link" href="<c:url value="/signup"/>">회원 가입</a>
	        </div>
			<div class="nav-item">
	          <a class="nav-link" href="<c:url value="/login"/>">로그인</a>
	        </div>
		</div>
	</nav>
	<br>
	<br>
</body>
</html>