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
        .file-label .base-img {
            display: block;
            width: 100%; height: 100%;
            border: 3px solid black;
            text-align: center;
            line-height: 190px;
            font-size: 50px;
            background-color: #f4f4f4;
        }
        .file-label img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .file-label input {
            display: none;
        }
        .base-img {
		    width: 150px;
		    height: 200px;
		    object-fit: cover;
		    border: 3px solid black;
		    cursor: pointer;
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
					<c:choose>
		                <c:when test="${not empty member.me_profile}">
		                    <span class="base-img" style="display: none">+</span>
							<img id="file" class="sel-img" src="<c:url value='/profile/${member.me_profile}'/>"  width="150" height="200"/>
							<img class="sel-img" width="150" height="200"  style="display: none">
		                </c:when>
		                <c:otherwise>
		                	<span class="base-img">+</span>
		                	<img class="sel-img" width="150" height="200"  style="display: none">
		                </c:otherwise>
		            </c:choose>
					<input type="file" class="form-control" name="file" accept="image/*">
				</label>
			</div>
		</div>
        <button type="submit" class="btn btn-outline-success mt-3 col-12">개인 정보 수정</button>
    </form>
    <script>
		$(document).on("change", "[name=file]", function(e){
			const $this = $(this);
			const file = this.files[0];
			
			if(file){
				const reader = new FileReader();
				reader.onload = function(e){
					$this.prev().attr("src", e.target.result).show();
					$("#file").hide();
				}
				reader.readAsDataURL(file);
			}else{
				$this.prev().hide();
				$("#file").show();
			}
		});
	</script>
</body>
</html>
