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
            line-height: 50px;
            margin-bottom: 20px; /* 다른 요소와 간격을 두기 위해 margin 추가 */
        }
	</style>
</head>
<body>
	
	<div class="progress mt-3" width="800px">
	    <div class="progress-bar bg-success" style="width:0%">0%</div>
	</div>
	<div class="content-box">
		<div class="box">
			<!-- ajax로 불러올 공간 -->
		</div>
		<div class="btns">
			<button onclick="beforeWindow()" class="btn btn-info btn-before mt-5" style="margin : auto;">이전</button>
			<button onclick="afterWindow()" class="btn btn-info btn-after mt-5" style="margin : auto;">다음</button>
		</div>
	</div>
    <script>
    	let pageNum = 0;
    	let textareaContent = ""; // 입력한 내용을 여기에 저장
    	showBeforeBtn();
    	
    	$(".box").load("/team3/apply/0");
    	
    	function showBeforeBtn(){
	    	if(pageNum === 0) $('.btn-before').hide();
	    	else $('.btn-before').show();    		
    	}
    	
    	function afterWindow() {
   			
	    	const $bar = $('.progress-bar');
	  		const $button = $('.btn-after');
    		const buttonText = $button.text().trim();
   			// 버튼 텍스트가 '제출하기'면 창 닫기
   		    if (buttonText === "제출하기") {
   		  		
				// 체크박스가 체크되었는지 확인
				const isChecked = $(".agreeBtn").is(":checked");
				
				if (!isChecked) {
				    alert("약관에 동의하셔야 제출할 수 있습니다.");
				    return;
				}
   		  		
				$.ajax({
				    url: "/team3/apply/submit",
				    method: "POST",
				    data: { content: textareaContent },
				    success: function(response) {
				    	if(response){
					        alert("제출 완료!");
					        window.close();				    		
				    	} else {
				    		alert("제출 실패!");
				    	}
				    }
				});
   		        return;
   		    }
   		    else{
   		    	
   		  		// 현재 textarea 내용 저장 (2 페이지로 넘어가기 전에만)
   		  		if(pageNum === 1){
	   		        textareaContent = $("textarea").val(); // 페이지에 있던 textarea의 내용
	   		        if(!textareaContent.trim()){
	   		        	alert("내용을 입력하세요.")
	   		        	return;
	   		        }
   		  		}
   		        
    			$(".box").load("/team3/apply/" + ++pageNum, function () {
        		    if (pageNum === 1) {
        		        $("textarea").val(textareaContent);
        		    }
        		});
    			showBeforeBtn();
    			
   	   			// 현재 텍스트에서 숫자만 추출 (예: '30%' → 30)
   	   		    let currentPercent = parseInt($bar.text().trim());
   	   			
   	   			// 50% 증가 (최대 100%로 제한)
   	   		    let newPercent = Math.min(currentPercent + 50, 100);
   	   			
   	   			// 스타일과 텍스트 모두 업데이트
   	   		    $bar.css('width', newPercent + '%');
   	   			$bar.text(newPercent + '%');
   	   		    
   	   			// 100% 도달하면 버튼을 '제출하기'로 변경
   	   		    if (newPercent === 100) {
   	   		        $button.text("제출하기");
   	   		    }
   		    }
    	}
    	
		function beforeWindow() {
   			
	    	const $bar = $('.progress-bar');
	  		const $button = $('.btn-after');
    		const buttonText = $button.text().trim();
    		
    		// 현재 textarea 내용 저장 (0 페이지로 넘어가기 전에만)
	  		if(pageNum === 1){
  		        textareaContent = $("textarea").val(); // 페이지에 있던 textarea의 내용   		  			
	  		}

    		$(".box").load("/team3/apply/" + --pageNum, function () {
    		    if (pageNum === 1) {
    		        $("textarea").val(textareaContent);
    		    }
    		});
			showBeforeBtn();
			$button.text("다음");
			
   			// 현재 텍스트에서 숫자만 추출 (예: '30%' → 30)
   		    let currentPercent = parseInt($bar.text().trim());
   			
   			// 50% 감소 (최소 0%로 제한)
   		    let newPercent = Math.max(currentPercent - 50, 0);
   			
   			// 스타일과 텍스트 모두 업데이트
   		    $bar.css('width', newPercent + '%');
   			$bar.text(newPercent + '%');
    	}
    </script>
</body>
</html>