<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div style="display: flex; min-height: 100vh;">
		<div style="width: 200px; background-color: white-space; padding: 20px;">
			<h4>메뉴</h4>
			<ul style="list-style: none; padding-left: 0;">
				<li style="margin-bottom: 10px;"><a href="#" style="color: black; text-decoration: none;" onclick="loadContent('subs')">구독 목록</a></li>				
				<li style="margin-bottom: 10px;"><a href="#" style="color: black; text-decoration: none;" onclick="loadContent('teacher')">강사 신청</a></li>
			</ul>	
		</div>

		<div id="contentArea" style="flex: 1; padding: 20px;">
			<!-- Ajax로 테이블이 여기에 로드됨 -->
		</div>
	</div>

	<script>
	const contextPath = "<%= request.getContextPath() %>";
	
	function loadContent(type) {
		fetch(contextPath + "/user/loadData?type=" + type)
			.then(response => response.text())
			.then(html => {
				document.getElementById("contentArea").innerHTML = html;
			})
			.catch(err => {
				console.error("Ajax 로드 실패:", err);
				document.getElementById("contentArea").innerHTML = "<p>데이터를 불러올 수 없습니다.</p>";
			});
	}

	// 첫 로딩 시 자동 호출
	window.onload = function () {
		loadContent('subs'); // 구독 목록 먼저 보여줄 거면 여기 'subs'
	}
	</script>
	
	
    <script>
        function openNewWindow() {
        	//이미 요청된 지원이 있는지 체크
        	$.ajax({
		        url: "/team3/apply/check",
		        method: "POST",
		        success: function(isNewRequest) {
		            if (isNewRequest) {
		                // 새 창 열기
		                window.open("/team3/apply/applyPage", "apply", "width=1000,height=800");
		            } else {
		                alert("이미 대기중인 요청이 있습니다. 처리 결과를 기다려주세요!");
		                return;
		            }
		        }
		    });
        }
    </script>

</body>
</html>