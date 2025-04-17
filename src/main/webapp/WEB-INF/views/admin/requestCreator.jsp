<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
        <style>
            /* 공통 스타일 */
            
            button {
                font-size: 16px;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                border-radius: 5px;  /* 버튼 모서리 둥글게 */
                transition: background-color 0.3s, transform 0.2s;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* 수락 버튼 스타일 (초록색) */
            .accept-button {
                background-color: #28a745;  /* 초록색 */
                color: white;
            }

            .accept-button:hover {
                background-color: #218838;  /* 호버 시 어두운 초록색 */
                transform: translateY(-2px);  /* 호버 시 살짝 올라감 */
            }

            /* 거절 버튼 스타일 (빨간색) */
            .reject-button {
                background-color: #dc3545;  /* 빨간색 */
                color: white;
            }

            .reject-button:hover {
                background-color: #c82333;  /* 호버 시 어두운 빨간색 */
                transform: translateY(-2px);  /* 호버 시 살짝 올라감 */
            }
        </style>
    </head>

    <body>
    	${r_list}
        <%-- <h1>강의 요청 목록</h1>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>강사이름</th>
                    <th>회원번호</th>
                    <th>강의명</th>
                    <th>수락</th> 
                    <th>거절</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="cl">
                    <tr>
                        <td>${cl.me_name}</td>
                        <td>${cl.cl_tc_me_num}</td>
                        <td>
						    <a href="<c:url value="/admin/detail/${cl.cl_tc_me_num}"/>">${cl.cl_title}</a>
						</td>
                        <td>
                            <!-- 수락 버튼 (초록색) -->
                            <form action="<c:url value="/admin/acceptRequest"/>" method="POST">
                                <input type="hidden" name="cl_num" value="${cl.cl_num}" />
                                <button type="submit" class="accept-button">수락</button>
                            </form>
                        </td>
                        <td>
                            <!-- 거절 버튼 (빨간색) -->
                            <form action="<c:url value="/admin/rejectRequest"/>" method="POST">
                                <input type="hidden" name="cl_num" value="${cl.cl_num}" />
                                <button type="submit" class="reject-button">거절</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> --%>
    </body>
</html>