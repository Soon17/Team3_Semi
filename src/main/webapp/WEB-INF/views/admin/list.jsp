<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .blocked {
            color: red;
        }
        .active {
            color: green;
        }
        .btn {
            padding: 5px 10px;
            margin-left: 10px;
            cursor: pointer;
        }
        .btn-blocked {
            background-color: red;
            color: white;
            border: none;
            border-radius: 3px;
        }
        .btn-active {
            background-color: green;
            color: white;
            border: none;
            border-radius: 3px;
        }
    </style>
</head>
<body>
	<div class="mt-5 mb-5">
		<a class="btn btn<c:if test="${pm.cri.me_num ne 0 }">-outline</c:if>-success" href="<c:url value="/admin/list?me_num=0"/>">전체</a>
		<c:forEach items="${member.me_del }" var="member">
			<%-- <a class="btn btn<c:if test="${pm.cri.po_bo_num ne board.bo_num }">-outline</c:if>-success" href="<c:url value="/post/list?po_bo_num=${board.bo_num}"/>">${board.bo_name}</a> --%>
		</c:forEach>
	</div>
    <h1>회원 목록</h1>
    <table class="table table-hover">
        <thead>
            <tr>
                <th>이름</th>
                <th>아이디</th>
                <th>닉네임</th>
                <th>역할</th>
                <th>차단 여부</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="member">
                <tr>
                    <td>${member.me_name}</td>
                    <td>${member.me_id}</td>
                    <td>${member.me_nick}</td>
                    <td>${member.me_authority}</td>
                    <td>
                        <c:choose>
                            <c:when test="${member.me_del == 'Y'}">
                                <span class="blocked">차단 유저</span>
                            </c:when>
                            <c:otherwise>
                                <span class="active">활동 유저</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                    
                        <c:choose>
                            <c:when test="${member.me_del == 'Y'}">
	                            <form action="<c:url value="/admin/create"/>" method="POST">
				                    <input type="hidden" name="me_num" value="${member.me_num}" />
				                    <button type="submit" class="btn btn-active">차단 해제</button>
			                   	</form>
                            </c:when>
                            <c:otherwise>
                            	<form action="<c:url value="/admin/clear"/>" method="POST">
				                    <input type="hidden" name="me_num" value="${member.me_num}" />
				                    <button type="submit" class="btn btn-blocked">차단</button>
			                   	</form>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${list.size() eq 0 }">
				<tr>
					<th colspan="5">차단된 유저가 없습니다.</th>
				</tr>
			</c:if>
        </tbody>
    </table>
   <form action="<c:url value="/admin/list"/>">
		<input type="hidden" name="me_num" value="${pm.cri.me_num}">
		<div class="input-group mb-3">
			<select class="form-control" name="type">
				<option value="0" <c:if test="${pm.cri.type == '0'}">selected</c:if>>전체</option>
				<option value="1" <c:if test="${pm.cri.type == '1'}">selected</c:if>>이름</option>
				<option value="2" <c:if test="${pm.cri.type == '2'}">selected</c:if>>아이디</option>
			</select>
			<input type="text" class="form-control" placeholder="검색어를 입력하세요." name="search" value="${pm.cri.search}">
			<button type="submit" class="form-control btn btn-outline-success">검색</button>
		</div>
	</form>
</body>
</html>
