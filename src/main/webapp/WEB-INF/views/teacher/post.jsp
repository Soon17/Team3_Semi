<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
  <meta charset="UTF-8">
  <title>게시글 작성</title>
  <!-- Bootstrap CSS (4.x or 5.x 상관없음) -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Summernote CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
  <style>
  
    body {
      background-color: #f8f9fa;
      font-family: 'Noto Sans KR', sans-serif;
    }

    /* 전체 컨테이너 */
    .post-wrapper {
      max-width: 1000px;
      margin: 40px auto;
      background-color: #fff;
      border-radius: 12px;
      box-shadow: 0 0 10px rgba(0,0,0,0.05);
      overflow: hidden;
      display: flex;
      flex-direction: column; /* 상단 → 하단 순서 */
    }

    /* 에디터 영역 감싸는 부분 */
    .editor-body {
      padding: 32px;
    }
    /* 하단 푸터(버튼 영역) */
    .editor-footer {
      display: flex;
      justify-content: flex-end; /* 버튼을 오른쪽 정렬 */
      align-items: center;
      border-top: 1px solid #eee;
      padding: 16px 32px;
    }

    /* 버튼 스타일 */
    .btn-draft, .btn-publish {
      padding: 8px 16px;
      border: none;
      border-radius: 6px;
      font-size: 14px;
      cursor: pointer;
      margin-left: 8px; /* 버튼 간격 */
    }
    .btn-draft {
      background-color: #eee;
      color: #444;
    }
    .btn-publish {
      background-color: #00c73c;
      color: white;
    }

    /* Summernote 영역 */
    .note-editor.note-frame {
      border: none;
      box-shadow: none;
    }
    .note-editing-area {
      min-height: 400px; /* 에디터 높이 원하는 만큼 */
    }
  </style>
</head>
<body>

  <div class="post-wrapper">
    <!-- 에디터 본문 -->
    <div class="editor-body">
      <textarea id="summernote"></textarea>
    </div>

    <!-- 하단 버튼 -->
    <div class="editor-footer">
      <button class="btn-publish">저장</button>
    </div>
  </div>

  <!-- 필요한 스크립트들 -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

  <!-- Summernote 초기화 스크립트 -->
 <script>
  $(document).ready(function () {
    $('#summernote').summernote({
      height: 500,
      lang: 'ko-KR',
      placeholder: '내용을 입력하세요',
      disableResizeEditor: true, // ← 이거 추가
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ['view', ['fullscreen', 'codeview', 'help']]
      ]
    });
  });
</script>
</body>
</html>