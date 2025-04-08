<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
        
    </head>

    <body>
        <h1>강의 상세</h1>
			<div class="form-group">
				<label>타이틀</label>
				<div class="form-control">${cl.cl_title}</div>
			</div>
			<div class="form-group">
				<label>준비물</label>
				<div class="form-control">${cl.cl_item}</div>
			</div>
			<div class="form-group">
				<label>강의 소개</label>
				<div class="form-control">${cl.cl_intro}</div>
			</div>
			<div class="form-group">
				<label>구독 금액</label>
				<div class="form-control">${cl.cl_money}</div>
			</div>
			<div class="form-group">
				<label>요청일</label>
				<div class="form-control">
					<fmt:formatDate value="${cl.cl_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="form-group">
				<label>난이도</label>
				<div class="form-control">${cl.cl_level}</div>
			</div>
			
			<div class="mb-3 d-flex justify-content-between">
				<a href="<c:url value="/admin/requestClass"/>" class="btn btn-outline-success">목록으로</a>
			</div>
    </body>
</html>