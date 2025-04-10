<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
	<style>
		.content-box {
            position: relative; /* 자식 요소가 절대적으로 위치할 수 있게 설정 */
            height: 90vh; /* 화면 높이 100% */
            background-color: #f0f0f0;
            padding: 20px;
        }

        .box {
            width: 100%;
            height: 100%;
            background-color: lightblue;
            text-align: center;
            line-height: 100px;
            margin-bottom: 20px; /* 다른 요소와 간격을 두기 위해 margin 추가 */
        }

        .btn-next {
            position: absolute; /* 부모 요소 내에서 절대 위치 지정 */
            bottom: 20px; /* 부모 요소의 아래에서 20px 떨어진 위치 */
            left: 50%; /* 수평 중앙 정렬 */
            transform: translateX(-50%); /* 정확히 수평 중앙에 위치하도록 */
            padding: 10px 20px;
            background-color: lightcoral;
            border: none;
            cursor: pointer;
        }
	</style>
</head>
<body>
	<div class="progress mt-3">
	    <div class="progress-bar bg-success" style="width:40%">40%</div>
	</div>
	<div class="content-box">
		<div class="box">
			<h2>클래스101에 지원하고 싶어요!</h2><br>
			<h3>안녕하세요, 크리에이터님! 클래스101입니다.<br>
			지금은 아쉽게도 클래스101 내에서 크리에이터님이 직접 클래스를 개설하고 판매하시기는 어렵습니다.<br>
			담당자 배정을 희망하신다면 아래 양식을 통해 어떤 클래스를 열고 싶으신지,<br>
			크리에이터님이 어떤 분이신지 알려주세요.
			저희가 꼼꼼히 살펴본 후, 클래스 오픈이 가능한 경우에 담당자가 직접 연락드리도록 하겠습니다.<br>
			(클래스 오픈이 불가한 경우 별도 연락을 드리지 않습니다.)</h3>
		</div>
		<button onclick="closeWindow()" class="btn btn-primary btn-next" style="margin : auto;">현재 창 닫기</button>
	</div>
    <script>
        function closeWindow() {
            window.close();  // 현재 창을 닫는다.
        }
    </script>
</body>
</html>