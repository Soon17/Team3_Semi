<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>강의 상세</title>
  <style>
  
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f8fafc;
      padding: 40px;
      color: #333;
    }

    .page-title {
      font-size: 28px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 40px;
    }

    .detail-container {
      max-width: 900px;
      margin: 0 auto;
      background: #ffffff;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
    }

    .row {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
    }

    .form-group {
      flex: 0 0 48%;
      display: flex;
      flex-direction: column;
    }

    .form-group-full {
      flex: 0 0 100%;
    }

    .form-group label {
	  font-weight: 700; /* 기존 600 → 700으로 */
	  font-size: 16px;   /* 기존보다 1px 정도 키우기 */
	}

    .form-control {
      height:0px !important;
      padding: 12px;
      background-color: #f1f5f9;
      border-radius: 6px;
      border: 1px solid #d0d7de;
      font-size: 15px;
      color: #333;
      min-height: 44px;
    }

    .btn-back {
      display: inline-block;
      margin-top: 30px;
      padding: 10px 20px;
      font-size: 15px;
      font-weight: 600;
      color: #198754;
      border: 2px solid #198754;
      border-radius: 6px;
      background-color: transparent;
      text-decoration: none;
      transition: 0.2s ease;
      float: right;
    }

    .btn-back:hover {
      background-color: #198754;
      color: #fff;
    }
    
    .autoResizeDiv {
	  display: block; /* block-level 요소로 기본 설정 */
	  width: 100%;    /* div의 너비는 부모 요소에 맞게 확장 */
	  min-height: 500px; /* 최소 높이는 설정 */
	  max-height: 500px; /* 최대 높이는 설정 (원하는 크기에 맞게 조정 가능) */
	  resize: none;    /* 사용자가 크기 조절할 수 없도록 설정 */
	  overflow-y: auto; /* 내용이 넘칠 경우 스크롤을 표시 */
	  box-sizing: border-box; /* 패딩이나 보더를 포함한 크기 계산 */
	}

    @media (max-width: 768px) {
      .form-group, .form-group-full {
        flex: 0 0 100%;
      }
    }
  </style>
</head>

<body>
  <h1 class="page-title">강의 상세</h1>

  <div class="detail-container">
    <div class="row">
      <div class="form-group">
        <label>타이틀</label>
        <div class="form-control">${cl.cl_title}</div>
      </div>

      <div class="form-group">
        <label>준비물</label>
        <div class="form-control">${cl.cl_item}</div>
      </div>

      <div class="form-group-full">
        <label><b>강의 소개</b></label>
        <div class="form-control autoResizeDiv">${cl.cl_intro}</div>
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
    </div>

    <a href="<c:url value='/admin/requestClass'/>" class="btn-back">목록으로</a>
    <div style="clear: both;"></div>
  </div>
</body>
</html>