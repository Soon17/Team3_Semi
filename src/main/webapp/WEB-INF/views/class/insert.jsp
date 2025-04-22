<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8"/>
  <title>클래스 등록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    html { scroll-behavior: smooth; }
    .tab-bar { display: flex; border-bottom:2px solid #eee; margin:20px 0; background:#f9f9f9; justify-content:center; }
    .tab-bar .nav-link { font-weight:600; padding:12px 18px; color:#000; border-bottom:3px solid transparent; cursor:pointer; }
    .tab-bar .nav-link.active { border-bottom:3px solid #000; }
    .section { padding:60px 20px; max-width:800px; margin:auto; }
    label { font-size:18px; font-weight:bold; }
    input[type="text"], input[type="number"], textarea, select {
      width:100%; padding:10px; margin:10px 0 20px; border:1px solid #ccc; border-radius:5px; font-size:16px;
    }
    textarea { height:150px; resize:vertical; }
    .btn-submit {
      display:block; margin:40px auto; padding:15px 30px; background:#4CAF50; color:#fff; border:none; border-radius:5px;
      font-size:18px; cursor:pointer; transition:background 0.3s;
    }
    .btn-submit:hover { background:#45a049; }
  </style>
</head>
<body>

  <!-- 탭바 -->
  <ul class="nav nav-tabs tab-bar" id="classTab">
    <li><a class="nav-link active" href="#title">클래스 타이틀</a></li>
    <li><a class="nav-link" href="#intro">클래스 소개</a></li>
    <li><a class="nav-link" href="#materials">준비물</a></li>
    <li><a class="nav-link" href="#curriculum">커리큘럼</a></li>
  </ul>

  <!-- 클래스 등록 폼 -->
  <form id="classForm"
        action="<c:url value='/class/insert/${me_num}'/>"
        method="post"
        enctype="multipart/form-data">

    <!-- 1. 타이틀 -->
    <div id="title" class="section">
      <label for="cl_title">클래스 타이틀</label>
      <input type="text" id="cl_title" name="cl_title" required/>
    </div>

    <!-- 2. 소개 -->
    <div id="intro" class="section">
      <label for="cl_intro">클래스 소개</label>
      <textarea id="cl_intro" name="cl_intro" required></textarea>
    </div>

    <!-- 3. 준비물 -->
    <div id="materials" class="section">
      <label for="cl_materials">준비물</label>
      <textarea id="cl_materials" name="cl_item" required></textarea>
    </div>

	<div id="curriculum" class="section">
	    <label>커리큘럼</label>
	    <div id="curriculum-list">
	        <!-- 커리큘럼 아이템들이 여기에 추가됨 -->
	    </div>
	    <button type="button" class="btn-submit" style="background-color:#2196F3;" id="add-curriculum">+ 커리큘럼 추가</button>
	</div>

    <!-- 5. 비용/난이도/카테고리 -->
    <div class="section">
      <label for="cl_money">구독 비용</label>
      <input type="number" step="1000" name="cl_money"/>

      <div>
        <label><input type="radio" name="cl_level" value="상"/> 상</label>
        <label><input type="radio" name="cl_level" value="중"/> 중</label>
        <label><input type="radio" name="cl_level" value="하"/> 하</label>
      </div>

      <label for="category">카테고리</label>
      <select id="category" name="sc_ca_num" required>
        <option value="" disabled selected>-- 선택하세요 --</option>
        <c:forEach items="${list}" var="ca">
          <option value="${ca.ca_num}">${ca.ca_name}</option>
        </c:forEach>
      </select>

      <label for="subcategory">세부카테고리</label>
      <select id="subcategory" name="sc_name" required>
        <option value="" disabled selected>카테고리를 먼저 선택하세요</option>
      </select>
    </div>

    <!-- 6. 썸네일 -->
    <div class="section">
      <label>썸네일</label>
      <input type="file" name="file"/>
    </div>

    <!-- 제출 버튼 -->
    <button type="submit" class="btn-submit">제출</button>
  </form>

  <script>
  $(function(){

    // 탭 클릭 → 스크롤
    $('#classTab .nav-link').on('click', function(e){
      e.preventDefault();
      $('#classTab .nav-link').removeClass('active');
      $(this).addClass('active');
      var target = $(this).attr('href');
      $('html,body').animate({ scrollTop: $(target).offset().top - 80 }, 500);
    });
    let curriculumCount = 0;
    let index =0;
    function createCurriculumTemplate(index) {
        return '' +
            '<div class="curriculum-item" style="border:1px solid #ddd; padding:20px; margin-top:20px; border-radius:10px;">' +
                '<label>커리큘럼명</label>' +
                '<input type="text" name="list[' + index + '].cr_title" placeholder="예: 챕터 1 - 기본 개념"/>' +

                '<div class="video-list" data-index="' + index + '">' +
                    '<!-- 영상 항목이 추가될 공간 -->' +
                '</div>' +
                '<button type="button" class="btn-submit add-video" data-index="' + index + '" style="margin-top:10px; background-color:#9C27B0;">+ 강의 영상 추가</button>' +
            '</div>';
    }

    function createVideoTemplate(curriculumIndex, videoIndex) {
        return '' +
            '<div class="video-item" style="margin-top:15px;">' +
                '<label>강의영상명</label>' +
                '<input type="text" name="list[' + curriculumIndex + '].list[' + videoIndex + '].vd_name" placeholder="예: 개요 설명"/>' +
                '<label>강의영상 업로드</label>' +
                '<input type="file" name="list[' + curriculumIndex + '].list[' + videoIndex + '].vd_file"/>' +
            '</div>';
    }

    $(document).ready(function () {
        $("#curriculum-list").append(createCurriculumTemplate(curriculumCount));
        curriculumCount++;

        // 커리큘럼 추가
        $("#add-curriculum").on("click", function () {
            index = curriculumCount++;
            $("#curriculum-list").append(createCurriculumTemplate(index));
        });

        // 동적으로 추가된 버튼에도 이벤트 바인딩
        $("#curriculum-list").on("click", ".add-video", function () {
            const index = $(this).data("index");
            const videoList = $(this).siblings(".video-list");
            const videoCount = videoList.children().length;
            videoList.append(createVideoTemplate(index, videoCount));
        });
    });
</script>

</body>
</html>
