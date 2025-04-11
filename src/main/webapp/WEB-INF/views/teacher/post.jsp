<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="noFooter" value="true" scope="request" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- Summernote CSS/JS -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

  <style>
    /* 공통 제거 */
    nav.navbar.navbar-expand.navbar-light,
    #overlay,
    footer {
      display: none !important;
    }

    html, body {
      margin: 0;
      padding: 0;
      font-family: '맑은 고딕', sans-serif;
      background-color: #f2f2f2;
      min-height: 100vh;
    }

    /*  헤더 */
    .simple-header {
      width: 99.5vw;
      margin-left: calc(-50vw + 50%);
      padding: 5px 30px;
      background-color: #fafafa;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-sizing: border-box;
      border-bottom: 1px solid #ccc;
    }

    .simple-header .logo {
      font-size: 20px;
      font-weight: bold;
    }

	.save-btn {
	  padding: 8px 15px;
	  font-size: 15px;
	  font-weight: bold;
	  background-color: #fff;
	  color: #000;
	  border: 2px solid #000;
	  border-radius: 6px;
	  cursor: pointer;
	  transition: all 0.2s ease-in-out;
	}
	
	.save-btn:hover {
	  background-color: #000;
	  color: #fff;
	}
	
    /* 에디터 wrapper */
    .editor-wrapper {
      width: 100%;
      max-width: 840px;
      margin: 0 auto;
      background-color: #ffffff;
      box-sizing: border-box;
    }

    /* 툴바: 전체 확장 */
    .note-toolbar.card-header {
      width: 99.5vw !important;
      margin-left: calc(-50vw + 50%);
      background-color: #fafafa !important;
      border-bottom: 1px solid #ddd;
      box-sizing: border-box;
      padding: 5px 30px !important;
    }

    /* 리사이즈 바 막기 */
    .note-resizebar {
      display: none !important;
    }

    /* Summernote 높이 고정 해제 */
    .note-editor.note-frame.card {
      border-top: none !important;
      border-bottom: none !important;
      height: auto !important;
    }

    .note-editable {
      min-height: calc(100vh - 115px);
      overflow-y: hidden !important;  
  	  overflow-x: hidden !important;
      height: auto !important;
      max-height: none !important;
      overflow: visible !important;
      resize: none !important;
      padding: 30px !important; 
    }
    .note-placeholder {
	  padding: 30px !important;
	  color: #999;
	  font-size: 14px;
	}
  </style>

  <script>
  $(document).ready(function () {
    // Summernote 설정
    $.extend($.summernote.options.icons, {
      'bold': 'fa fa-bold',
      'italic': 'fa fa-italic',
      'underline': 'fa fa-underline',
      'clear': 'fa fa-eraser',
      'color': 'fa fa-paint-brush',
      'fontname': 'fa fa-font',
      'fontsize': 'fa fa-text-height',
      'ul': 'fa fa-list-ul',
      'ol': 'fa fa-list-ol',
      'paragraph': 'fa fa-paragraph',
      'table': 'fa fa-table',
      'link': 'fa fa-link',
      'picture': 'fa fa-picture-o',
      'video': 'fa fa-video-camera'
    });

    $('#content').summernote({
      placeholder: '내용을 입력하세요.',
      tabsize: 2,
      height: null,
      lang: 'ko-KR',
      fontNames: ['맑은 고딕', '굴림', '돋움', '바탕'],
      fontNamesIgnoreCheck: ['맑은 고딕', '굴림', '돋움', '바탕'],
      toolbar: [
        ['style', ['style']],
        ['font', ['fontname', 'fontsize']],
        ['fontstyle', ['bold', 'italic', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']]
      ]
    });

    $('.save-btn').on('click', function () {
      var content = $('#content').val();
      if (!content || content.trim() === '') {
        alert('내용을 입력하세요!');
        return;
      }
      $('form').submit();
    });
  });
</script>

</head>
<body>

  <!-- 전체 가로 헤더 -->
  <div class="simple-header">
    <div class="logo">로고이미지~</div>
    <button class="save-btn">저장</button>
  </div>

  <!-- 에디터 -->
  <div class="editor-wrapper">
    <form action="<c:url value='/teacher/savePost' />" method="post">
	  <textarea id="content" name="content"></textarea>
	</form>
  </div>

</body>
</html>
