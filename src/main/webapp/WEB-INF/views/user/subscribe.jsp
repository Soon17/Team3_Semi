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
						<th>구독취소</th>
				</thead>
				<tbody>
					<c:forEach var="sub" items="${subscribeList}">
					  <tr>
					    <td>${sub.cl_title}</td>
					    <td>${sub.teacher_name}</td>
					    <td><fmt:formatDate value="${sub.su_date}" pattern="yyyy-MM-dd"/></td>
					    <td>
					      <form method="post" action="${pageContext.request.contextPath}/unsubscribe">
					        <!-- hidden 에는 raw column name -->
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
