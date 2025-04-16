<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            background-color: white;
            color: black;
            padding: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            border-radius: 5px;
            margin-top: 10px;
        }
        .header h1 {
            margin: 0;
            margin-left: 80px;
        }
        .profile-pic {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: white;
            border: 1px solid black;
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
        }
        .creator-info {
            background-color: white; 
            padding: 20px;
            margin: 20px;
            border-radius: 8px;
            box-shadow: none; 
        }
        .creator-info h2 {
            margin-top: 0;
        }
        .creator-info p {
            font-size: 1.1em;
        }
        .upload-btn {
            margin-top: 10px;
            background-color: transparent;
            color: black; 
            padding: 10px 20px;
            border: 1px solid black; 
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }
        .upload-btn:hover {
            background-color: #ddd; 
        }
        .create-class {
            margin-top: 30px;
            text-align: center;
            background-color: transparent; 
            margin: 20px;
            padding: 20px;
            border-radius: 5px;
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
        <div class="profile-pic">${member.me_profile}</div>
        <h1>${member.me_nick}님의 페이지</h1>
    </div>

    <div class="creator-info">
        <h2>강사 소개</h2>

        <c:choose>
		    <c:when test="${not empty teacher and not empty teacher.tc_intro}">
			    <p>${teacher.tc_intro}</p> 
			    <c:if test="${isOwner}">
			        <a href="<c:url value='/teacher/${member.me_num}/post' />" class="upload-btn">소개글 수정</a>
			    </c:if>
			</c:when>
		
		    <c:otherwise>
		        <c:if test="${isOwner}">
		            <a href="<c:url value='/teacher/${member.me_num}/post' />" class="upload-btn">소개글 작성</a>
		        </c:if>
		        <c:if test="${not isOwner}">
		            <p>아직 소개글이 등록되지 않았습니다.</p>
		        </c:if>
		    </c:otherwise>
		</c:choose>
    </div>

    <div class="create-class">
        <h3>클래스</h3>
        <div class="class-img">
            <h3>${cl_title}</h3>
        </div>
    </div>
</body>
</html>