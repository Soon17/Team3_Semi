<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
    <style>
        html {
            scroll-behavior: smooth;
        }

        .tab-bar {
            display: flex;
            border-bottom: 2px solid #eee;
            margin: 20px 0;
            background-color: #f9f9f9;
            justify-content: center;
        }

        .tab-bar .nav-link {
            font-weight: 600;
            padding: 12px 18px;
            color: #000;
            background: none;
            border-bottom: 3px solid transparent;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .tab-bar .nav-link.active {
            border-bottom: 3px solid black;
        }

        .section {
            padding: 60px 20px;
            max-width: 800px;
            margin: auto;
        }

        label {
            font-size: 18px;
            font-weight: bold;
        }

         .section input[type="text"],
      .section input[type="number"],
      .section textarea,
      .section select {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        textarea {
            height: 150px;
            resize: vertical;
        }

        .btn-submit {
            display: block;
            margin: 40px auto;
            padding: 15px 30px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #45a049;
        }
        .check-error,.error,.file-error{
        color: red;
        font-size: 20px;
        margin-top: 5px;
      }
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
<form  id="class-insert" action="<c:url value='/class/insert/${me_num}'/>" method="post" enctype="multipart/form-data">

    <div id="title" class="section">
        <label for="cl_title">클래스 타이틀</label>
        <input type="text" id="cl_title" name="cl_title" />
    </div>

    <div id="intro" class="section">
        <label for="cl_intro">클래스 소개</label>
        <textarea id="cl_intro" name="cl_intro" required></textarea>
    </div>

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

    <div class="section">
        <label for="cl_money">구독 비용</label>
        <input type="number" step="1000" name="cl_money">

        <div style="margin-top: 20px;">
            <div style="font-size: 18px; font-weight: bold;">난이도</div>
            <label><input type="radio" name="cl_level" value="상"> 상</label>
            <label><input type="radio" name="cl_level" value="중"> 중</label>
            <label><input type="radio" name="cl_level" value="하"> 하</label>
        </div>

        <div style="margin-top: 20px;">
            <label for="category">카테고리</label>
            <select id="category" name="sc_ca_num" required>
                <option value="" disabled selected>-- 선택하세요 --</option>
                <c:forEach items="${list }" var="ca">
                    <option value="${ca.ca_num }">${ca.ca_name }</option>
                </c:forEach>
            </select>
        </div>

        <div style="margin-top: 20px;">
            <label for="subcategory">세부카테고리</label>
            <select id="subcategory" name="sc_name" required>
                <option value="" disabled selected>카테고리를 선택하세요</option>
            </select>
        </div>
    </div>
   <div class="form-group" style="margin-top: 20px;">
      <label>썸네일</label>
      <input type="file" class="form-control" name="file"/>
   </div>
    <button type="submit" class="btn-submit">제출</button>
</form>

<script>
	function checkFiles(){
	   let count = 0;
	   $(".file-error").remove();
	   $("input[type=file]").each(function(){
	      if(!$(this).val()){
	         count++;
	         $(this).after(`<div class="error file-error">파일을 선택하세요.</div>`)
	      }
	   })
	   if(count >= 1){
	      return false;
	   }
	   return true;
	}
	function checkCurris(obj){
		var $next = obj.next();
		if($next && $next.hasClass("check-error"))  {
			$next.remove();
			
		} 
		//$(".curri-error").remove();
		   
      	if(obj.val() == ""){
	        obj.after(`<div class="check-error">필수 항목 입니다.</div>`)
			return false;
		}
		return true;
		   
		   
	}
	$(document).on("input",".curriculums, .videos",function(){
		   checkCurris($(this))
			
	   });
   $("input[type=file]").on("input",function(e){
	   if(!checkFiles()){
		   e.preventDefault();
	   }
   });
	   
	
   $("#class-insert").on("submit", function (e) { 
	   if(!checkFiles()){
		   e.preventDefault();
	   }
	});
   $("#class-insert").validate({
       rules: {
    	 cl_title: { required: true, regex: /^(?=.*\S).{3,50}$/ },
    	 cl_intro: { required: true},
    	 cl_item: { required: true},
    	 cl_money: { required: true,min: 1000,max: 100000},
    	 cl_level: { required: true},
    	 sc_ca_num: { required: true},
    	 sc_name: { required: true},
       },
       messages: {
    	 cl_title: { required: "필수 항목입니다.", regex: "클래스 타이틀은 3~50자입니다." },
    	 cl_intro: { required: "필수 항목입니다."},
    	 cl_item: { required: "필수 항목입니다."},
    	 cl_money: { required: "필수 항목입니다.", min:"최소 금액은 1000원입니다",max:"최대 금액은 100000원입니다" },
    	 cl_level: { required: "필수 항목입니다."},
    	 sc_ca_num: { required: "필수 항목입니다."},
    	 sc_name: { required: "필수 항목입니다."},
       },
       submitHandler: function () { 
    	   console.log(1)
    	   let res = true;
    	   $(".curriculums, .videos").each(function(){
    		   if (!checkCurris($(this))) {
    			   res = false;
    	        }
    		})
    		if (!checkFiles()) {
		        res = false;
		    }
    	   	return res;
    	   },
     });
     $.validator.addMethod("regex", function (value, element, regex) {
       var re = new RegExp(regex);
       return this.optional(element) || re.test(value);
     }, "정규표현식을 확인하세요.");
    $(document).ready(function () {
        $('#classTab .nav-link').on('click', function (e) {
            e.preventDefault();

            $('#classTab .nav-link').removeClass('active');
            $(this).addClass('active');

            const target = $(this).attr('href');
            const offsetTop = $(target).offset().top - 80; // 상단 여백 보정

            $('html, body').animate({
                scrollTop: offsetTop
            }, 500);
        });

        // 카테고리 AJAX
        $("#category").on("change", function () {
            const ca_num = $(this).val();
            $.ajax({
                async: true,
                url: '<c:url value="/class/subcategoryList"/>',
                type: 'GET',
                data: { ca_num: ca_num },
                success: function (data) {
                    $("#subcategory").html(data);
                }
            });
        });
    });
    let curriculumCount = 0;
    let index =0;
    function createCurriculumTemplate(index) {
        return '' +
            '<div class="curriculum-item" style="border:1px solid #ddd; padding:20px; margin-top:20px; border-radius:10px;">' +
                '<label>커리큘럼명</label>' +
                '<input type="text" class="curriculums" name="list[' + index + '].cr_title" placeholder="예: 챕터 1 - 기본 개념"/>' +

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
                '<input type="text" class="videos"  name="list[' + curriculumIndex + '].list[' + videoIndex + '].vd_name" placeholder="예: 개요 설명"/>' +
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
   
     // 탭 클릭 시 active 처리 + 스크롤 이동
</script>

</body>
</html>