<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	
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
		    padding: 80px;
		    display: flex;
		    align-items: center;
		    justify-content: flex-start;
		    position: relative;
		    border-radius: 5px;
		    margin-top: 10px;
		    padding-left: 140px; /* 이미지 공간 확보 */
		}
		
		.header h1 {
		    margin: 0;
		    margin-left: 240px;
		    text-align: center;
		}
		
		.profile-pic {
		    width: 150px;
		    height: 150px;
		    border-radius: 50%;
		    background-color: white;
		    position: absolute;
		    left: 20px;
		    top: 50%;
		    transform: translateY(-50%);
		    overflow: hidden;
		}
		.profile-pic img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		    display: block;
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
        .container {
            max-width: 1200px;
            margin: 80px auto 40px;
            padding: 0 20px;
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
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 24px;
            justify-items: center;
        }

        .card {
            width: 200px;
            border-radius: 12px;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-4px);
        }

        .card-image {
            width: 100%;
            height: 140px;
            background-color: #eee;
        }

        .card-info {
            padding: 10px;
        }

        .card-title {
            font-size: 16px;
            color: #111;
            margin: 4px 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .card-sub {
            font-size: 13px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="header">
       <div class="profile-pic">
           <c:choose>
             <c:when test="${fn:startsWith(owner.me_profile, 'http')}">
                 <img src="${owner.me_profile}" style="width:100%; height:100%; border-radius:50%;">
             </c:when>
             <c:when test="${not empty owner.me_profile}">
                 <img src="<c:url value='/profile/${owner.me_profile}'/>" style="width:100%; height:100%; border-radius:50%;">
             </c:when>
             <c:otherwise>
                 <img src="<c:url value='/profile/default.png'/>" style="width:100%; height:100%; border-radius:50%;">
             </c:otherwise>
         </c:choose>
       </div>
       <h1>${owner.me_nick}님의 페이지</h1>
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
	<div class="container">
	    <div class="card-grid">
			<c:forEach var="cl" items="${classList}">
				<a href="<c:url value='/class/${cl.cl_num}'/>" class="card">
				<img src="<c:url value='/uploads/${cl.cl_th_picture }'/>"style="width: 100%; height: 200px; object-fit: cover; border-radius: 10px;">
				<div class="card-info">
				    <div class="card-sub">${cl.me_nick}</div>
					<div class="card-title">${cl.cl_title}</div>
				</div>
				</a>
			</c:forEach>
	     </div>
     </div>
</body>
</html>