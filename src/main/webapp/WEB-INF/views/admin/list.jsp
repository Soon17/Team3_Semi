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
            font-weight: bold;
        }
        .active {
            color: green;
            font-weight: bold;
        }
        .btn-active {
            background-color: green;
            color: white;
            border: none;
            border-radius: 10px;
        }
        .btn-blocked {
            background-color: red;
            color: white;
            border: none;
            border-radius: 10px;
        }
        .table-rounded {
            border-radius: 15px;
            overflow: hidden;
        }
        .profile-img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }
        .btn-rounded {
            border-radius: 10px !important;
        }
        
        .table-rounded thead {
        	background-color: #f0f4f8;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
        }
        .pagination li {
            margin: 0 4px;
        }
        .pagination button {
            border: none;
            padding: 6px 12px;
            border-radius: 8px;
            background-color: #eee;
            cursor: pointer;
        }
        .pagination .active button {
            background-color: #28a745;
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body>
	<div class="d-flex gap-2 mb-4">
        <a class="btn btn-outline-success btn-rounded <c:if test='${empty pm.cri.me_del}'>active</c:if>'" href="<c:url value='/admin/list'/>">전체</a>
        <a class="btn btn-outline-danger btn-rounded <c:if test='${pm.cri.me_del eq "Y"}'>active</c:if>'" href="<c:url value='/admin/list?me_del=Y'/>">차단유저</a>
        <a class="btn btn-outline-success btn-rounded <c:if test='${pm.cri.me_del eq "N"}'>active</c:if>'" href="<c:url value='/admin/list?me_del=N'/>">활동유저</a>
    </div>

    <h2 class="mb-4 fw-bold">회원 목록</h2>

    <div class="table-responsive">
        <table class="table table-hover table-bordered table-rounded">
            <thead>
                <tr class="text-center align-middle">
                    <th></th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>구분</th>
                    <th>차단 여부</th>
                    <th></th>
                </tr>
            </thead>
            <tbody id="memberTableBody">
                <c:forEach items="${list}" var="member">
                    <tr class="align-middle text-center data-member">
                        <td>
                            <c:choose>
                                <c:when test="${fn:startsWith(member.me_profile, 'http')}">
                                    <img src="${member.me_profile}" alt="프로필" class="profile-img" />
                                </c:when>
                                <c:when test="${not empty member.me_profile}">
                                    <img src="<c:url value='/profile/${member.me_profile}' />" alt="프로필" class="profile-img" />
                                </c:when>
                                <c:otherwise>
                                    <img src="<c:url value='/profile/default.png' />" alt="기본 프로필" class="profile-img" />
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
                                    <form action="<c:url value='/admin/create'/>" method="POST">
                                        <input type="hidden" name="me_num" value="${member.me_num}" />
                                        <button type="submit" class="btn btn-active btn-rounded">차단 해제</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <form action="<c:url value='/admin/clear'/>" method="POST">
                                        <input type="hidden" name="me_num" value="${member.me_num}" />
                                        <button type="submit" class="btn btn-blocked btn-rounded">차단</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${list.size() eq 0}">
                    <tr>
                        <td colspan="7" class="text-center">회원 정보가 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
        
    </div>
    
    <!-- 페이지네이션 -->
    <nav class="d-flex justify-content-center">
        <ul class="pagination" id="paginationContainer">
			
        </ul>
    </nav>
    
    <!-- 검색 -->
    <form action="<c:url value='/admin/list'/>" class="my-4">
        <input type="hidden" name="member" value="${pm.cri.member}">
        <div class="input-group">
            <select class="form-select" name="type">
                <option value="0" <c:if test="${pm.cri.type == '0'}">selected</c:if>>전체</option>
                <option value="1" <c:if test="${pm.cri.type == '1'}">selected</c:if>>이름</option>
                <option value="2" <c:if test="${pm.cri.type == '2'}">selected</c:if>>아이디</option>
                <option value="3" <c:if test="${pm.cri.type == '3'}">selected</c:if>>구분</option>
            </select>
            <input type="text" class="form-control" name="search" placeholder="검색어를 입력하세요." value="${pm.cri.search}">
            <button class="btn btn-outline-success btn-rounded" type="submit">검색</button>
        </div>
    </form>
    
    <script>
        const rowsPerPage = 5;
        const rows = document.querySelectorAll('.data-member');
        const paginationContainer = document.getElementById('paginationContainer');
        const totalPages = Math.ceil(rows.length / rowsPerPage);
        let currentPage = 1;

        function showPage(page) {
            currentPage = page;
            const start = (page - 1) * rowsPerPage;
            const end = start + rowsPerPage;

            rows.forEach((row, index) => {
                row.style.display = index >= start && index < end ? '' : 'none';
            });

            renderPagination();
        }

        function renderPagination() {
            paginationContainer.innerHTML = '';

            for (let i = 1; i <= totalPages; i++) {
                const li = document.createElement('li');
                li.className = i === currentPage ? 'active' : '';
                const btn = document.createElement('button');
                btn.innerText = i;
                btn.addEventListener('click', () => showPage(i));
                li.appendChild(btn);
                paginationContainer.appendChild(li);
            }
        }

        // 초기 페이지 표시
        showPage(1);
    </script>
</body>
</html>
