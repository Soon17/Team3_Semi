<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<style>

        h2 {
            text-align: center;
            margin-top: 30px;
            font-size: 2rem;
        }

        .table {
            margin-top: 30px;
            border-radius: 0.5rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }

        .table th, .table td {
            text-align: center;
            vertical-align: middle;
        }

        .table thead {
            background-color: gray;
            color: white;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .btn-success, .btn-danger {
            border-radius: 0.5rem;
            transition: all 0.3s;
        }

        .btn-success:hover {
            background-color: #28a745;
        }

        .btn-danger:hover {
            background-color: #dc3545;
        }

        .text-muted {
            text-align: center;
            font-size: 1.2rem;
        }

        .btn-sm {
            font-size: 0.875rem;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .table th, .table td {
                font-size: 0.9rem;
            }

            h2 {
                font-size: 1.5rem;
            }
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
                        <th>링크</th>
                        <th>구독취소</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="sub" items="${subscribeList}">
                        <tr>
                            <td>${sub.cl_title}</td>
                            <td>${sub.teacher_name}</td>
                            <td><fmt:formatDate value="${sub.su_date}" pattern="yyyy-MM-dd"/></td>
                            <td>
                                <a href="<c:url value='/class/${sub.su_cl_num}'/>" class="btn btn-success btn-sm">바로가기</a>
                            </td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/unsubscribe">
                                    <input type="hidden" name="cl_num" value="${sub.su_cl_num}" />
                                    <button type="submit" class="btn btn-danger btn-sm">구독 취소</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</body>
</html>
