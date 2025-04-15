<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
  <title>${ca_name}</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    .container {
      display: flex;
      padding: 20px;
    }

    .sub-category {
      width: 200px;
      border-right: 1px solid #ccc;
      padding-right: 20px;
    }

    .sub-category h2 {
      margin-top: 0;
      font-size: 24px;
    }

    .sub-category ul {
      list-style: none;
      padding: 0;
    }

    .sub-category li {
      margin-bottom: 10px;
      cursor: pointer;
    }

    .sub-category li.active {
      font-weight: bold;
      text-decoration: underline;
    }

    .class-list {
      flex-grow: 1;
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      padding-left: 20px;
    }

    .class-card {
      width: 200px;
      border: 1px solid #ddd;
      padding: 10px;
      border-radius: 10px;
      background-color: #fff;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .class-card .image {
      height: 120px;
      background-color: #f0f0f0;
      margin-bottom: 10px;
    }

    .class-card h5 {
      margin: 0 0 5px 0;
      font-size: 16px;
    }

    .class-card p {
      margin: 0;
      font-size: 14px;
      color: #555;
    }
  </style>
</head>
<body>

  <div class="container">
    <!-- 왼쪽: 카테고리명 + 서브카테고리 -->
    <div class="sub-category">    
      <h2>${ca_name} 페이지</h2>
      <ul id="sub-list"></ul>
    </div>

    <!-- 오른쪽: 클래스 목록 -->
    <div class="class-list" id="class-list"></div>
  </div>

  <script>
    let classList = [];

    $(function () {
      $.ajax({
        url: "<c:url value='/category/data/${ca_num}'/>",
        method: "GET",
        success: function (res) {
          classList = res.classList;

          // 1. 서브카테고리 + 전체
          let subHtml = '<li data-clnum="all" class="active">전체</li>';
          res.subList.forEach(function (sub) {
            subHtml += `<li data-clnum="\${sub.sc_cl_num}">\${sub.sc_name}</li>`;
          });
          $("#sub-list").html(subHtml);

          // 2. 전체 출력 초기화
          renderAllClasses();
        },
        error: function () {
          $("#sub-list").html("<li>서브카테고리 불러오기 실패</li>");
          $("#class-list").html("<p>클래스 목록 불러오기 실패</p>");
        }
      });
    });

    // 전체 출력
    function renderAllClasses() {
      let classHtml = "";
      classList.forEach(function (cls) {
        classHtml += `
          <div class="class-card">
            <div class="image"></div>
            <h5>\${cls.cl_title || "제목 없음"}</h5>
            <p>\${cls.me_name || "이름 없음"}</p>
          </div>
        `;
      });
      $("#class-list").html(classHtml);
    }

    // 서브카테고리 필터링
    function renderClassesBySubCategory(sc_cl_num) {
      const filtered = classList.filter(cls => cls.cl_num === sc_cl_num);
      let classHtml = "";
      filtered.forEach(function (cls) {
        classHtml += `
          <div class="class-card">
            <div class="image"></div>
            <h5>\${cls.cl_title || "제목 없음"}</h5>
            <p>\${cls.me_name || "이름 없음"}</p>
          </div>
        `;
      });
      $("#class-list").html(classHtml);
    }

    // 클릭 이벤트
    $(document).on("click", "#sub-list li", function () {
      $("#sub-list li").removeClass("active");
      $(this).addClass("active");

      const sc_cl_num = $(this).data("clnum");
      if (sc_cl_num === "all") {
        renderAllClasses();
      } else {
        renderClassesBySubCategory(parseInt(sc_cl_num));
      }
    });
  </script>
</body>
</html>