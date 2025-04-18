<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	    <a class="btn btn<c:if test="${pm.cri.me_del}">-outline</c:if>-success" href="<c:url value='/admin/list'/>">전체</a>
	    
	    <a class="btn btn<c:if test="${pm.cri.me_del eq 'Y' }">-outline</c:if>-danger" href="<c:url value="/admin/list?me_del=Y"/>">차단유저</a>
	    
	    <a class="btn btn<c:if test="${pm.cri.me_del eq 'N' }">-outline</c:if>-success" href="<c:url value="/admin/list?me_del=N"/>">활동유저</a>
	</div>

    <h1>회원 목록</h1>
    <table class="table table-hover">
        <thead>
            <tr>
            	<th></th>
                <th>이름</th>
                <th>아이디</th>
                <th>닉네임</th>
                <th>구분</th>
                <th>차단 여부</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="member">
                <tr>
                	<td>
					<c:choose>
					    <c:when test="${fn:startsWith(member.me_profile, 'http')}">
					        <img src="${member.me_profile}"
					             alt="프로필"
					             style="width:30px; height:30px; border-radius:50%; object-fit:cover; margin-right:10px;" />
					    </c:when>
					    <c:when test="${not empty member.me_profile}">
					        <img src="<c:url value='/profile/${member.me_profile}' />"
					             alt="프로필"
					             style="width:30px; height:30px; border-radius:50%; object-fit:cover; margin-right:10px;" />
					    </c:when>
					    <c:otherwise>
					        <img src="<c:url value='/profile/default.png' />"
					             alt="기본 프로필"
					             style="width:30px; height:30px; border-radius:50%; object-fit:cover; margin-right:10px;" />
					    </c:otherwise>
					</c:choose>
					</td>
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
				                    <input type="hidden" name="me_num" value="${member.me_num}"/>
				                    <button type="submit" class="btn btn-active">차단 해제</button>
			                   	</form>
                            </c:when>
                            <c:otherwise>
                            	<form action="<c:url value="/admin/clear"/>" method="POST">
				                    <input type="hidden" name="me_num" value="${member.me_num}"/>
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
		<input type="hidden" name="member" value="${pm.cri.member}">
		<div class="input-group mb-3">
			<select class="form-control" name="type">
				<option value="0" <c:if test="${pm.cri.type == '0'}">selected</c:if>>전체</option>
				<option value="1" <c:if test="${pm.cri.type == '1'}">selected</c:if>>이름</option>
				<option value="2" <c:if test="${pm.cri.type == '2'}">selected</c:if>>아이디</option>
				<option value="3" <c:if test="${pm.cri.type == '3'}">selected</c:if>>구분</option>
			</select>
			<input type="text" class="form-control" placeholder="검색어를 입력하세요." name="search" value="${pm.cri.search}">
			<button type="submit" class="form-control btn btn-outline-success">검색</button>
		</div>
	</form>
</body>
</html>
