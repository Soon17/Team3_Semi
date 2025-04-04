<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
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
					</tr>
				</thead>
				<tbody>
					<c:forEach var="sub" items="${subscribeList}">
						<tr>
							<td>${sub.CL_TITLE}</td>
							<td>${sub.teacher_name}</td>
							<td>
								<fmt:formatDate value="${sub.SU_DATE}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</body>	
</html>