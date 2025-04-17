<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

    <style>
        html {
            scroll-behavior: smooth; /* 부드럽게 스크롤 이동 */
        }

        .horizontal-menu {
            display: flex;
            flex-direction: row;
            justify-content: center;
            gap: 30px;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .horizontal-menu a {
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            color: #333;
        }

        .section {
            padding: 60px 20px;
        }

        /* 입력 필드 스타일 */
        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
        }

        /* 텍스트영역 스타일 */
        textarea {
            height: 150px;
            resize: vertical;
        }

        /* 레이블 스타일 */
        label {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }

        /* 구분선 스타일 */
        .divider {
            border-top: 2px solid #ccc;
            margin-top: 40px;
        }
                /* 버튼 스타일 */
        .btn-submit {
            display: block;
            margin: 40px auto; /* 버튼 중앙 정렬 */
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
    </style>
</head>

<body>
    <form action="<c:url value="/class/insert/${me_num }"/>" method="post">
        <div class="horizontal-menu">
            <a href="#title">클래스 타이틀</a>
            <a href="#intro">클래스 소개</a>
            <a href="#materials">준비물</a>
            <a href="#curriculum">커리큘럼</a>
        </div>

        <div id="title" class="section">
            <label for="cl_title">클래스 타이틀</label>
            <input type="text" id="cl_title" name="cl_title" placeholder="클래스 타이틀을 입력하세요" required />
        </div>

        <div id="intro" class="section">
            <label for="cl_intro">클래스 소개</label>
            <textarea id="cl_intro" name="cl_intro" placeholder="클래스 소개를 입력하세요" required></textarea>
        </div>

        <div id="materials" class="section">
            <label for="cl_materials">준비물</label>
            <textarea id="cl_materials" name="cl_item" placeholder="준비물을 입력하세요" required></textarea>
        </div>
		
		<div id="curriculum" class="section">
            <label for="cl_title">커리큘럼</label>
            
        </div>
        
        <div>구독 비용</div>
        <input type="number" step="1000" name="cl_money">

        <div style="margin-top: 10px;">
            <div>난이도</div>
            <div style="display: flex; gap: 20px; margin-top: 5px;">
                <label><input type="radio" name="cl_level" value="상"> 상</label>
                <label><input type="radio" name="cl_level" value="중"> 중</label>
                <label><input type="radio" name="cl_level" value="하"> 하</label>
            </div>
        </div>

        <div style="margin-top: 20px;">
            <label for="category">카테고리</label><br>
            <select id="category" name="sc_ca_num" required>
                <option value="" disabled selected>-- 선택하세요 --</option>
                <c:forEach items="${list }" var="ca">
                    <option value="${ca.ca_num }">${ca.ca_name }</option>
                </c:forEach>
            </select>
        </div>

        <div style="margin-top: 20px;" >
        	<label for="subcategory">세부카테고리</label><br>
        	<select id="subcategory" name="sc_name" required>
        		<option value="" disabled selected>카테고리를 선택하세요</option>
        	</select>
        </div>
		<button type="submit" class="btn-submit">제출</button>
        <div class="divider"></div> <!-- 구분선 -->
    </form>
    <script type="text/javascript">
    	$("#category").on("change",function(e){
    		const ca_num = $(this).val();
    		$.ajax({
	    		async: true,
	    		url: '<c:url value="/class/subcategoryList"/>',
	    		type: 'GET',
	    		data: { ca_num : ca_num },
	    		success: function (data) {
	    			$("#subcategory").html(data);
	    		}
	    	});
    	})
    </script>
</body>
</html>
