<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		body {
		  font-family: 'Segoe UI', sans-serif;
		  background-color: #f5f7fa;
		  padding: 30px;
		}
		
		.application-box {
		  max-width: 700px;
		  margin: 0 auto;
		  background-color: #fff;
		  border-radius: 12px;
		  box-shadow: 0 4px 12px rgba(0,0,0,0.08);
		  padding: 24px;
		}
		
		.section-title {
		  font-size: 18px;
		  font-weight: bold;
		  margin-bottom: 12px;
		  border-bottom: 1px solid #ddd;
		  padding-bottom: 6px;
		  color: #333;
		}
		
		/* 상단 2열 레이아웃 */
		.top-info {
		  display: grid;
		  grid-template-columns: 160px auto;
		  gap: 20px;
		  margin-bottom: 20px;
		  align-items: flex-start;
		}
		
		.left-photo {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  min-width: 160px; /* 또는 원하는 크기 */
		}

		.right-info {
		  display: grid;
		  grid-template-rows: repeat(4, auto);
		  gap: 10px;
		}
		
		.info-item {
		  display: flex;
		}
		
		.info-label {
		  width: 90px;
		  font-weight: bold;
		  color: #555;
		}
		
		.info-value {
		  flex: 1;
		  color: #333;
		}
		
		.member-photo {
		  width: 160px;
		  height: 160px;
		  object-fit: cover;
		  border-radius: 8px;
		  border: 1px solid #ccc;
		}
		
		/* 하단 1열 레이아웃 */
		.bottom-info {
		  display: grid;
		  grid-template-columns: 1fr 1fr;
		  gap: 12px 20px;
		  margin-bottom: 30px;
		}
		
		/* 지원 정보 */
		.application-info {
		  margin-bottom: 24px;
		}
		
		.info-row {
		  display: flex;
		  margin-bottom: 12px;
		}
		
		.application-content {
		  padding: 12px;
		  background-color: #f9f9f9;
		  border-radius: 8px;
		  color: #444;
		  line-height: 1.6;
		}
		
		/* 반응형 */
		@media (max-width: 600px) {
		  .top-info {
		    grid-template-columns: 1fr;
		    text-align: center;
		  }
		  .left-info {
		    grid-template-rows: none;
		  }
		  .bottom-info {
		    grid-template-columns: 1fr;
		  }
		  .info-item {
		    justify-content: center;
		  }
		  .info-label {
		    text-align: right;
		    margin-right: 8px;
		  }
		}
		
		.action-buttons {
		  display: flex;
		  justify-content: center;
		  gap: 20px;
		  margin-top: 30px;
		}
		
		button {
		  padding: 10px 24px;
		  font-size: 16px;
		  border: none;
		  border-radius: 8px;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		
		.approve-btn {
		  background-color: #4CAF50;
		  color: white;
		}
		
		.approve-btn:hover {
		  background-color: #43a047;
		}
		
		.reject-btn {
		  background-color: #f44336;
		  color: white;
		}
		
		.reject-btn:hover {
		  background-color: #d32f2f;
		}
	</style>
</head>
<body>
	
	<div class="application-box">
	
	  <!-- 회원 정보 -->
	  <div class="section-title">👤 회원 정보</div>
	
	  <div class="top-info">
	
	    <!-- 왼쪽 사진 -->
	    <div class="left-photo">
	      <img src="https://via.placeholder.com/120" alt="회원 사진" class="member-photo">
	    </div>
	    
	    <!-- 오른쪽 텍스트 정보 -->
	    <div class="right-info">
	      <div class="info-item">
	        <div class="info-label">회원 번호</div>
	        <div class="info-value">${rq.rq_me_num}</div>
	      </div>
	      <div class="info-item">
	        <div class="info-label">이름</div>
	        <div class="info-value">${rq.member.me_name}</div>
	      </div>
	      <div class="info-item">
	        <div class="info-label">아이디</div>
	        <div class="info-value">${rq.member.me_id}</div>
	      </div>
	      <div class="info-item">
	        <div class="info-label">닉네임</div>
	        <div class="info-value">${rq.member.me_nick}</div>
	      </div>
	    </div>
	  </div>
	
	  <!-- 이메일 & 폰 번호 -->
	  <div class="bottom-info">
	    <div class="info-item">
	      <div class="info-label">이메일</div>
	      <div class="info-value">${rq.member.me_email}</div>
	    </div>
	    <div class="info-item">
	      <div class="info-label">폰번호</div>
	      <div class="info-value">${rq.member.me_number}</div>
	    </div>
	  </div>
	
	  <!-- 지원 정보 -->
	  <div class="application-info">
	    <div class="section-title">📝 지원 정보</div>
	
	    <div class="info-row">
	      <div class="info-label">지원 번호</div>
	      <div class="info-value">${rq.rq_num}</div>
	    </div>
	
	    <div class="info-row">
	      <div class="info-label" style="align-self: flex-start;">지원 내용</div>
	      <div class="info-value">
	        <div class="application-content">
	          ${rq.rq_content}
	        </div>
	      </div>
	    </div>
	  </div>
	  
	</div>
	<!-- 하단 버튼 영역 -->
	<div class="action-buttons">
		<button class="approve-btn" onclick="handleApprove()">✔ 승인</button>
		<button class="reject-btn" onclick="handleReject()">✖ 반려</button>
	</div>

	<script>
	  function handleApprove() {
	    alert("승인되었습니다!");
	  }
	
	  function handleReject() {
	    alert("반려되었습니다!");
	  }
	</script>

</body>
</html>