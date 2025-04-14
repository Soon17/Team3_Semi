<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
	<style>
		.content-box {
			display: flex;
			flex-direction: column;     /* 세로 정렬 */
			align-items: center;        /* 수평 가운데 정렬 */
			justify-content: center;    /* 수직 가운데 정렬 */
            width: 800px;
			height: auto;
            background-color: #f0f0f0;
            padding: 20px;
            box-sizing: border-box;
			margin: 50px auto; /* 수평 중앙 정렬용 */
        }

        .box {
            width: 100%;
            height: auto;
            text-align: center;
            line-height: 100px;
            margin-bottom: 20px; /* 다른 요소와 간격을 두기 위해 margin 추가 */
        }

		.btn-next {
		
		}
	</style>
</head>
<body>
	<div class="progress mt-3">
	    <div class="progress-bar bg-success" style="width:40%">100%</div>
	</div>
	<div class="content-box">
		<div class="box">
			<h2>클래스101에 지원하고 싶어요!</h2><br>
			<h6 class="text-left apply-content">
				안녕하세요, 크리에이터님! 클래스101입니다.<br><br>
				지금은 아쉽게도 클래스101 내에서 크리에이터님이 직접 클래스를 개설하고 판매하시기는 어렵습니다.<br><br>
				담당자 배정을 희망하신다면 아래 양식을 통해 어떤 클래스를 열고 싶으신지,<br><br>
				크리에이터님이 어떤 분이신지 알려주세요.<br><br>
				저희가 꼼꼼히 살펴본 후, 클래스 오픈이 가능한 경우에 담당자가 직접 연락드리도록 하겠습니다.<br><br>
				(클래스 오픈이 불가한 경우 별도 연락을 드리지 않습니다.)
			</h6>
		</div>
		<button onclick="nextWindow()" class="btn btn-info btn-next mt-5" style="margin : auto;">다음</button>
	</div>
    <script>
    	function nextWindow() {
    		if($('.progress-bar').text()=="100%") window.close();
    		else alert(1);
    	}
    </script>
</body>
</html>