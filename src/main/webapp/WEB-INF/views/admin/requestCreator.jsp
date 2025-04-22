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
		
		.request-table {
		  table-layout: fixed;
		  width: 100%;
		}
		
		.col-id {
		  width: 20%;
		}
		.col-content {
		  width: 20%;
		}
		.col-date {
		  width: 30%;
		}
		.col-state {
		  width: 30%;
		}
    </style>
  </head>

  <body>
    <div class="page-container">
      <h1 class="page-title">강사 요청 목록</h1>

      <table class="request-table">
        <thead>
          <tr>
            <th class="col-id">회원 아이디</th>
            <th class="col-content">요청 내용</th>
            <th class="col-date">요청 일시</th>
            <th class="col-state">처리 상태</th>
          </tr>
        </thead>
        <tbody id="request-body">
          <!-- JSTL 반복문 안에 각각 row에 paging 클래스 추가 -->
          <c:forEach items="${r_list}" var="rq" varStatus="loop">
            <tr class="paging-row" data-rqnum="${rq.rq_num}">
              <td>${rq.member.me_id}</td>
              <td class="rqContent">
				  <c:choose>
				    <c:when test="${rq.rq_state eq 'HANDLING'}">
				      <span class="handling-message">처리중입니다</span>
				    </c:when>
				    <c:otherwise>
				      <a
				        href="#"
				        class="request-link"
				        data-rqnum="${rq.rq_num}"
				        data-rqstate="${rq.rq_state}"
				        data-url="<c:url value='/admin/applyDetail/${rq.rq_num}'/>"
				      >
				        상세보기
				      </a>
				    </c:otherwise>
				  </c:choose>

              </td>
              <td>
                <fmt:formatDate value="${rq.rq_date}" pattern="yyyy.MM.dd HH:mm:ss" />
              </td>
              <td class="rqState">
                <c:if test="${rq.rq_state eq 'WAITING'}">
                  <div class="state waiting">대기 중</div>
                </c:if>
                <c:if test="${rq.rq_state eq 'HANDLING'}">
                  <div class="state handling">처리 중</div>
                </c:if>
                <c:if test="${rq.rq_state eq 'OK'}">
                  <div class="state ok">승인</div>
                </c:if>
                <c:if test="${rq.rq_state eq 'NO'}">
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
          $pagination.find(`button[data-page="${page}"]`).addClass('active');
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
      
      $(document).on("click", ".request-link", function(e) {
    	  e.preventDefault();
    	  
    	  const rqNum = $(this).data('rqnum');
    	  const rqState = $(this).data("rqstate");
    	  const $row = $(this).closest("tr");
    	  const url = $(this).data("url");
    	  if (!url) {
    		    alert("상세보기 URL이 없습니다.");
    		    return;
    		  }
    	  window.open(url, 'popupWindow', 'width=800,height=700,scrollbars=yes')
    	  
    	  // 상태가 WAITING이면 처리 중으로 전환
    	  if(rqState === "WAITING"){
	    	  $.ajax({
				    url: "/team3/admin/handling",
				    method: "POST",
				    data: { rq_num : rqNum },
				    success: function(response) {
				    	// td의 '처리 상태' 컬럼 값을 바꿈
				        $row.find(".rqState").html(`<div class="state handling">처리 중</div>`);
				        // 링크도 같이 수정 (span으로 변경)
				        $row.find(".rqContent").html(`<span class="handling-message">처리중입니다</span>`);
				    }
				});    	  
    	  }
   	  });
      
		function popupClosed(rq_num) {
			$.ajax({
			    url: "/team3/admin/waiting",
			    method: "POST",
			    data: { rq_num : rq_num },
			    success: function(response) {
			    	location.reload();
			    }
			});
		}
    </script>
  </body>
</html>