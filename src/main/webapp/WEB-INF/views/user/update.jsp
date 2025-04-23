<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>개인 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-bs4.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <style>
		.file-label {
		  position: relative;
		  width: 150px;
		  height: 200px;
		}
		
		.base-img,
		.sel-img {
		  position: absolute;
		  top: 0;
		  left: 0;
		  width: 150px;
		  height: 200px;
		  object-fit: cover;
		  border: 2px solid black;
		}
		
		.base-img {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  font-size: 50px;
		  background-color: #f4f4f4;
		  cursor: pointer;
		}
		
		.file-label input {
		  display: none;
		}
    </style>
</head>
<body>
    <h1>개인 정보 수정</h1>
    <form action="<c:url value='/user/update'/>" method="post" enctype="multipart/form-data">
        <!-- 기본 회원 정보 -->
        <div class="form-group mt-3">
            <label>이름</label>
            <input type="text" class="form-control" name="me_name" value="${member.me_name}" readonly>
        </div>
        <div class="form-group mt-3">
            <label>아이디</label>
            <input type="text" class="form-control" name="me_id" value="${member.me_id}" readonly>
        </div>
        <div class="form-group mt-3">
            <label>닉네임</label>
            <input type="text" class="form-control" name="me_nick" value="${member.me_nick}">
        </div>
        <div class="form-group mt-3">
            <label>이메일</label>
            <input type="email" class="form-control" name="me_email" value="${member.me_email}" readonly>
        </div>

        <!-- 비밀번호 변경 -->
        <div class="form-group mt-3">
            <label>현재 비밀번호</label>
            <input type="password" class="form-control" name="me_pw" required>
        </div>
        <div class="form-group mt-3">
            <label>새 비밀번호</label>
            <input type="password" class="form-control" name="me_newPassword">
        </div>

      <div class="form-group mt-3">
         <div class="form-label">첨부파일</div>
			<div class="d-flex">
			  <label class="file-label mr-3">
			  
			    <!-- + 버튼 -->
				<span class="base-img" style="<c:if test='${not empty member.me_profile}'>display: none;</c:if>">+</span>
				
				<!-- 기존 이미지 -->
			    <img id="current-img" class="sel-img" 
			         src="<c:if test='${not empty member.me_profile}'><c:url value='/profile/${member.me_profile}'/></c:if>" 
			         style="<c:choose>
			                   <c:when test='${not empty member.me_profile}'>display: block;</c:when>
			                   <c:otherwise>display: none;</c:otherwise>
			                </c:choose>"
			    />
				
				<!-- 프리뷰 이미지 -->
    <img id="preview-img" class="sel-img" style="display: none;" />

    <input type="file" class="form-control" name="file" accept="image/*" />
			  </label>
			</div>

      </div>
        <button type="submit" class="btn btn-outline-success mt-3 col-12">개인 정보 수정</button>
    </form>
    <script>
      $(document).on("change", "[name=file]", function(){
    	  const file = this.files[0];
    	    
    	    if(file){
    	        const reader = new FileReader();
    	        reader.onload = function(e){
    	            $("#preview-img").attr("src", e.target.result).show(); // 프리뷰 이미지 보여줌
    	            $("#current-img").hide(); // 기존 이미지 숨김
    	            $(".base-img").hide();
    	        };
    	        reader.readAsDataURL(file);
    	    } else {
    	        $("#preview-img").hide();
    	        $("#current-img").show();
    	        $(".base-img").show();
    	    }
      });
   </script>
</body>
</html>
