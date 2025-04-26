<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<style>
	    .delete-btn {
	        background-color: transparent;
	        border: 1px solid #ff4d4d;
	        color: #ff4d4d;
	        padding: 4px 8px;
	        border-radius: 8px;
	        cursor: pointer;
	        transition: all 0.2s ease;
	        font-size: 16px;
	    }

	    .delete-btn:hover {
	        background-color: #ff4d4d;
	        color: white;
	    }
	</style>
</head>
<body>
    <h2>구독 목록</h2>
    <c:choose>
        <c:when test="${empty subscribeList}">
            <p class="text-muted">구독 내역이 없습니다.</p>
        </c:when>
        <c:otherwise>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>강의명</th>
                        <th>강사명</th>
                        <th>구독일</th>
                        <th>현재 구독 상태</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="sub" items="${subscribeList}">
                        <tr id="row-${sub.su_cl_num}">
                            <td>${sub.cl_title}</td>
                            <td>${sub.teacher_name}</td>
                            <td><fmt:formatDate value="${sub.su_date}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <div class="subscription-status">
                                    <c:choose>
                                        <c:when test="${sub.su_status == 'regular'}">
                                            <p>구독중</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p>미구독</p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                            <td>
                                <c:if test="${sub.su_status != 'regular'}">
                                    <button class="delete-btn" onclick="deleteSubscribe(${sub.su_cl_num})">X</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose> 
</body>  
</html>
