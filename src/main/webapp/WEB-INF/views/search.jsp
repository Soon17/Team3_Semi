<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
        }

        .container {
            max-width: 1200px;
            margin: 80px auto 40px;
            padding: 0 20px;
        }

        h2 {
            margin-bottom: 40px;
            font-size: 24px;
            font-weight: bold;
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

        .no-result {
            text-align: center;
            color: #999;
            font-style: italic;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>"${keyword}" 검색 결과</h2>

    <c:choose>
        <c:when test="${not empty resultList}">
            <div class="card-grid">
                <c:forEach var="item" items="${resultList}">
                    <a href="<c:url value='/class/${item.cl_num}'/>" class="card">
                        <div class="card-image"></div>
                        <div class="card-info">
                            <div class="card-sub">${item.teacherNick}</div>
                            <div class="card-title">${item.name}</div>
                        </div>
                    </a>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-result">"${keyword}"와 관련된 결과가 없습니다.</div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>