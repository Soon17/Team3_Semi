<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>강의 요청 목록</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f9fafb;
      margin: 0;
      padding: 40px;
      color: #333;
    }

    .page-title {
      text-align: center;
      font-size: 28px;
      margin-bottom: 30px;
      color: #222;
    }

    .request-table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      table-layout: fixed;
    }

    .request-table thead {
      background-color: #f0f4f8;
    }

    .request-table th, .request-table td {
      padding: 16px 12px;
      text-align: center;
      border-bottom: 1px solid #eee;
    }

    .col-name   { width: 20%; }
    .col-id     { width: 10%; }
    .col-title  { width: 30%; }
    .col-accept { width: 20%; }
    .col-reject { width: 20%; }

    .action-form {
      display: inline-block;
    }

    .btn {
        padding: 6px 14px;
        font-size: 14px;
        font-weight: bold;
        color: #fff;
        border-radius: 20px;
        min-width: 60px;
    }

    .btn-accept {
      background-color: #4caf50;
      color: #fff;
    }

    .btn-accept:hover {
      background-color: #43a047;
    }

    .btn-reject {
      background-color: #e53935;
      color: #fff;
    }

    .btn-reject:hover {
      background-color: #d32f2f;
    }

    .lecture-link {
      color: #007BFF;
      text-decoration: none;
      font-weight: 500;
    }

    .lecture-link:hover {
      text-decoration: underline;
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
	    
  </style>
</head>

<body>
  <h1 class="page-title">강의 요청 목록</h1>

  <table class="request-table">
    <thead>
      <tr>
        <th class="col-name">강사 이름</th>
        <th class="col-id">회원 번호</th>
        <th class="col-title">강의명</th>
        <th class="col-accept">수락</th>
        <th class="col-reject">거절</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list}" var="cl">
        <tr class="paging-row">
          <td class="col-name">${cl.me_name}</td>
          <td class="col-id">${cl.cl_tc_me_num}</td>
          <td class="col-title">
            <a href="<c:url value='/admin/detail/${cl.cl_num}'/>" class="lecture-link">
              ${cl.cl_title}
            </a>
          </td>
          <td class="col-accept">
            <form class="action-form" action="<c:url value='/admin/acceptRequest'/>" method="POST">
              <input type="hidden" name="cl_num" value="${cl.cl_num}" />
              <button type="submit" class="btn btn-accept">수락</button>
            </form>
          </td>
          <td class="col-reject">
            <form class="action-form" action="<c:url value='/admin/rejectRequest'/>" method="POST">
              <input type="hidden" name="cl_num" value="${cl.cl_num}" />
              <button type="submit" class="btn btn-reject">거절</button>
            </form>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <div class="pagination" id="pagination-container"></div>
  
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
	</script>
</body>
</html>