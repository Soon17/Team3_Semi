<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인 정보 수정</title>
    <style>
        h1 {
            text-align: center;
            margin-top: 30px;
            font-size: 2rem;
            color: #000000;
        }

        .form-group label {
            font-weight: bold;
            color: #495057;
        }

        .form-control {
            border-radius: 0.5rem;
            border: 1px solid #ced4da;
            box-shadow: none;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
        }

        .btn-outline-success {
            border-radius: 0.5rem;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            transition: background-color 0.3s;
        }

        .btn-outline-success:hover {
            background-color: #218838;
        }

        .file-label {
            position: relative;
            width: 150px;
            height: 200px;
            border-radius: 0.5rem;
            overflow: hidden;
            cursor: pointer;
            background-color: #f1f1f1;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px dashed #007bff;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .file-label:hover {
            background-color: #e9ecef;
            border-color: #0056b3;
        }

        .file-label input {
            display: none;
        }

        .base-img,
        .sel-img {
            position: absolute;
            top: 0;
            left: 0;
            width: 150px;
            height: 200px;
            object-fit: cover;
        }

        .base-img {
            font-size: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f4f4f4;
            color: #888;
            z-index: 1;
        }

        .sel-img {
            display: none;
            z-index: 2;
        }

        .form-group.mt-3 {
            margin-top: 1.5rem;
        }

        .d-flex {
            display: flex;
            justify-content: flex-start;
        }

        .d-flex .file-label {
            margin-right: 15px;
        }

        @media (max-width: 768px) {
            .file-label {
                width: 120px;
                height: 160px;
            }
        }
    </style>
</head>
<body>
    <h1>개인 정보 수정</h1>

    <form action="<c:url value='/user/update'/>" method="post" enctype="multipart/form-data">
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

        <div class="form-group mt-3">
            <label>현재 비밀번호</label>
            <input type="password" class="form-control" name="me_pw" required>
        </div>

        <div class="form-group mt-3">
            <label>새 비밀번호</label>
            <input type="password" class="form-control" name="me_newPassword">
        </div>

        <!-- 이미지 업로드 -->
        <div class="form-group mt-3">
            <div class="form-label">프로필 사진</div>
            <div class="d-flex">
                <label class="file-label">
                    <c:choose>
                        <c:when test="${not empty member.me_profile}">
                            <span class="base-img" style="display: none;">+</span>
                            <img id="defaultImg" class="sel-img" src="<c:url value='/profile/${member.me_profile}'/>" />
                        </c:when>
                        <c:otherwise>
                            <span class="base-img">+</span>
                            <img id="defaultImg" class="sel-img" style="display: none;" />
                        </c:otherwise>
                    </c:choose>
                    <img id="previewImg" class="sel-img" style="display: none;" />
                    <input type="file" name="file" accept="image/*">
                </label>
            </div>
        </div>

        <button type="submit" class="btn btn-outline-success mt-3 col-12">개인 정보 수정</button>
    </form>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).on("change", "[name='file']", function () {
            const file = this.files[0];
            const $label = $(this).closest('.file-label');
            const $previewImg = $label.find('#previewImg');
            const $defaultImg = $label.find('#defaultImg');
            const $baseImg = $label.find('.base-img');

            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $previewImg.attr("src", e.target.result).show();
                    $defaultImg.hide();
                    $baseImg.hide();
                };
                reader.readAsDataURL(file);
            } else {
                $previewImg.hide();
                $defaultImg.show();
                $baseImg.show();
            }
        });
    </script>
</body>
</html>
