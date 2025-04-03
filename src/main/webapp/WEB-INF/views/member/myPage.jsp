<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>회원 목록</h1>
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
					<td>${sub.SU_DATE}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
		</tfoot>
	</table>
</body>
</html>