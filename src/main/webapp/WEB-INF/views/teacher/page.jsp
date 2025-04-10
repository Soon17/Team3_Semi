<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강사 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: transparent; /* 배경색 제거 */
            color: black; /* 텍스트 색을 검정색으로 */
            padding: 20px;
            display: flex;
            align-items: center; /* 아이템을 세로로 정렬 */
            justify-content: center;
            position: relative;
            border : 1px solid black;
        }
        .header h1 {
            margin: 0;
            margin-left: 80px; /* 프로필 사진을 위한 공간 */
        }
        .profile-pic {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-image: none; /* 기본 이미지는 비워두기 */
            background-color: transparent; /* 프로필 사진 배경색을 투명하게 설정 */
            border: 1px solid black; /* 테두리만 추가, 색은 검정색 */
            position: absolute;
            left: 20px; /* 헤더 왼쪽에 위치 */
            top: 50%;
            transform: translateY(-50%); /* 세로 가운데 정렬 */
        }
        .creator-info {
            background-color: transparent; /* 배경색 제거 */
            padding: 20px;
            margin: 20px;
            border-radius: 8px;
            box-shadow: none; /* 그림자 효과 제거 */
        }
        .creator-info h2 {
            margin-top: 0;
        }
        .creator-info p {
            font-size: 1.1em;
        }
        .upload-btn {
            margin-top: 10px;
            background-color: transparent; /* 배경색 제거 */
            color: black; /* 텍스트 색을 검정색으로 */
            padding: 10px 20px;
            border: 1px solid black; /* 테두리 추가 */
            border-radius: 5px;
            cursor: pointer;
        }
        .upload-btn:hover {
            background-color: #ddd; /* 마우스 오버시 색상만 추가 */
        }
        .create-class {
            margin-top: 30px;
            text-align: center;
        }
        .class-img {
            width: 200px;
            height: 150px;
            background-color: #ddd;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <div class="header">
        <!-- 프로필 사진 -->
        <div class="profile-pic"></div>
        <h1>강사 페이지</h1>
    </div>

    <div class="creator-info">
    <h2>강사 소개</h2>

    <!-- 소개글이 있을 경우 -->
    <c:if test="${not empty intro}">
	    <p>${intro}</p>
		    <form action="editIntroForm" method="get">
		        <button type="submit" class="upload-btn">소개 수정</button>
		    </form>
	</c:if>
	
	<c:if test="${empty intro}">
    	<p>아직 소개가 등록되지 않았습니다.</p>
		    <form action="writeIntroForm" method="get">
		        <button type="submit" class="upload-btn">소개 작성</button>
		    </form>
	</c:if>
	</div>

    <div class="create-class">
        <div class="class-img"></div>
        <h3>클래스</h3>
    </div>

</body>
</html>
