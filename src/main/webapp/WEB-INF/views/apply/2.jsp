<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		.custom-checkbox {
		  display: inline-flex;
		  width : 300px;
		  align-items: center;
		  padding: 8px 12px;
		  border: 2px solid #ccc;   /* ✅ 테두리 */
		  border-radius: 6px;       /* ✅ 살짝 둥글게 */
		  cursor: pointer;
		}

		/* 숨김 처리한 실제 체크박스 */
		.custom-checkbox input[type="checkbox"] {
		  display: none;
		}
		
		/* 가짜 체크박스 */
		.custom-checkbox .checkmark {
		  display: inline-block;
		  width: 18px;
		  height: 18px;
		  border: 2px solid #999;
		  border-radius: 4px;
		  position: relative;
		  margin-right: 8px;
		  vertical-align: middle;
		}
		
		/* 체크됐을 때 표시될 체크마크 */
		.custom-checkbox input[type="checkbox"]:checked + .checkmark::after {
		  content: '';
		  position: absolute;
		  left: 4px;
		  top: 0px;
		  width: 6px;
		  height: 12px;
		  border: solid #333;
		  border-width: 0 2px 2px 0;
		  transform: rotate(45deg);
		}
	</style>
</head>
<body>
	<h3>크리에이터 지원을 위한 개인정보 수집 및 이용 안내</h3><br>
	<div class="text-left apply-content">
		<b>1. 개인정보 수집 및 이용목적</b><br>
		 - 상품 제작을 위한 크리에이터 본인 확인, 상담 및 문의 처리를 위한 의사소통 경로 확보<br>
		<b>2. 수집하는 개인정보 항목</b><br>
		 - 현재(크리에이터 지원 시) 로그인 된 이메일 주소, 휴대폰 번호 및 기타 연락처, 닉네임과 본명<br>
		<b>3. 보유 및 이용기간</b><br>
		 - 지원 양식 제출 시점부터 1년<br>
		<b>4. 안내사항</b><br>
		 - 개인정보 수집 및 이용에 대해 거부하실 수 있으며, 거부 시 해당 절차가 진행되지 않습니다.<br>
		 - 미동의 시, 양식을 제출하시더라도 크리에이터 지원은 진행되지 않습니다.<br>
		 	크리에이터 지원을 희망하신다면 동의해 주세요.<br>
		 - 작성해주신 크리에이터님의 개인정보는 상품 제작을 위해 연락하는 이외의 목적으로는 사용되지 않습니다.<br>
		 - 클래스 <u>오픈 심사 후</u> 담당자가 직접 연락드리도록 하겠습니다.<br>
		 <br>
		<label class="custom-checkbox">
		  <input type="checkbox" class="agreeBtn">
		  <span class="checkmark"></span>
		  동의합니다.
		</label>
	</div>
</body>
</html>