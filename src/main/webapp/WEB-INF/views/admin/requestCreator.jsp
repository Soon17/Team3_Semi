<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

    <style>
      .page-container {
        font-family: 'Segoe UI', sans-serif;
        background-color: #f9fafb;
        padding: 40px;
        color: #333;
      }

      .page-title {
        text-align: center;
        margin-bottom: 30px;
        font-size: 28px;
        color: #222;
      }

      .request-table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      }

      .request-table thead {
        background-color: #f0f4f8;
      }

      .request-table th,
      .request-table td {
        text-align: center;
        padding: 16px 12px;
        border-bottom: 1px solid #eee;
      }

      .request-link {
        color: #007BFF;
        text-decoration: none;
        font-weight: 500;
      }

      .request-link:hover {
        text-decoration: underline;
      }

      .state {
        display: inline-block;
        padding: 6px 14px;
        font-size: 14px;
        font-weight: bold;
        color: #fff;
        border-radius: 20px;
        min-width: 70px;
      }

      .state.waiting {
        background-color: #f6c700;
        color: #333;
      }

      .state.handling {
        background-color: #aaa;
      }

      .state.ok {
        background-color: #4caf50;
      }

      .state.no {
        background-color: #e53935;
      }

      .pagination {
        margin-top: 20px;
        display: flex;
        justify-content: center;
        gap: 8px;
      }

      .pagination button {
        padding: 6px 12px;
        border: none;
        border-radius: 6px;
        background-color: #e0e0e0;
        cursor: pointer;
        font-weight: bold;
        transition: background-color 0.2s ease;
      }

      .pagination button.active {
        background-color: #007BFF;
        color: #fff;
      }

      .pagination button:hover {
        background-color: #ccc;
      }
      
      .handling-message {
		  color: #aaa;
		  font-weight: bold;
		}
    </style>
  </head>

  <body>
    <div class="page-container">
      <h1 class="page-title">강사 요청 목록</h1>

      <table class="request-table">
        <thead>
          <tr>
            <th>회원 아이디</th>
            <th>요청 내용</th>
            <th>요청 일시</th>
            <th>처리 상태</th>
          </tr>
        </thead>
        <tbody id="request-body">
          <!-- JSTL 반복문 안에 각각 row에 paging 클래스 추가 -->
          <c:forEach items="${r_list}" var="rl" varStatus="loop">
            <tr class="paging-row">
              <td>${rl.member.me_id}</td>
              <td>
				  <c:choose>
				    <c:when test="${rl.rq_state eq 'HANDLING'}">
				      <span class="handling-message">처리중인 건입니다</span>
				    </c:when>
				    <c:otherwise>
				      <a
				        href="#"
				        class="request-link"
				        data-url="<c:url value='/admin/applyDetail/${rl.rq_num}'/>"
				        onclick="window.open(this.dataset.url, 'popupWindow', 'width=800,height=1000,scrollbars=yes'); return false;"
				      >
				        상세보기
				      </a>
				    </c:otherwise>
				  </c:choose>

              </td>
              <td>
                <fmt:formatDate value="${rl.rq_date}" pattern="yyyy.MM.dd HH:mm:ss" />
              </td>
              <td>
                <c:if test="${rl.rq_state eq 'WAITING'}">
                  <div class="state waiting">대기 중</div>
                </c:if>
                <c:if test="${rl.rq_state eq 'HANDLING'}">
                  <div class="state handling">처리 중</div>
                </c:if>
                <c:if test="${rl.rq_state eq 'OK'}">
                  <div class="state ok">승인</div>
                </c:if>
                <c:if test="${rl.rq_state eq 'NO'}">
                  <div class="state no">반려</div>
                </c:if>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <div class="pagination" id="pagination-container"></div>
    </div>

    <script>
      const rowsPerPage = 5;

      $(document).ready(function () {
        const $rows = $('.paging-row');
        const totalRows = $rows.length;
        const totalPages = Math.ceil(totalRows / rowsPerPage);
        const $pagination = $('#pagination-container');

        function showPage(page) {
          const start = (page - 1) * rowsPerPage;
          const end = start + rowsPerPage;

          $rows.hide().slice(start, end).show();

          $pagination.find('button').removeClass('active');
          $pagination.find(`button[data-page=${page}]`).addClass('active');
        }

        function createPagination() {
          for (let i = 1; i <= totalPages; i++) {
            const $btn = $(`<button data-page="${i}">${i}</button>`);
            $btn.on('click', function () {
              showPage(i);
            });
            $pagination.append($btn);
          }
        }

        createPagination();
        showPage(1);
      });
    </script>
  </body>
</html>