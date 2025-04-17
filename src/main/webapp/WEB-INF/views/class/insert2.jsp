<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style>
        .price-area strong {
            font-size: 18px;
        }

        /* 탭바 스타일 */
        .tab-bar {
            display: flex;
            border-bottom: 2px solid #eee;
            margin-top: 30px;
        }

        .tab-bar .nav-link {
            font-weight: 600;
            padding: 12px 18px;
            color: #000;
            background: none;
            border-bottom: 3px solid transparent;
            transition: all 0.3s ease;
        }

        .tab-bar .nav-link:hover {
            background-color: #f9f9f9;
        }

        .tab-bar .nav-link.active {
            border-bottom: 3px solid black;
        }

        .curriculum-wrapper {
            margin-top: 15px;
        }

        .curriculum-item {
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 10px;
            cursor: pointer;
        }

        .video-wrapper {
            margin-top: 10px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container mt-5">
  

    <!-- 탭 영역 -->
    <ul class="nav nav-tabs tab-bar" id="classTab">
        <li class="nav-item">
            <a class="nav-link active" href="#" data-type="intro">클래스 소개</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-type="item">준비물</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-type="curriculum">커리큘럼</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#" data-type="creator">기타 등등</a>
        </li>
    </ul>
	<form>
		<!-- 여기 이제 클래스 소개-->
	</form>
  
</div>


<!-- 탭 Ajax 스크립트 -->
<script>

</script>

</body>
</html>