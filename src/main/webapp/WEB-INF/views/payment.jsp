<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
  body {
    margin: 0;
    background-color: #f9f9f9;
    font-family: 'Apple SD Gothic Neo', 'sans-serif';
  }

  .payment-wrap {
    display: flex;
    justify-content: center;
    margin-top: 80px;
  }

  .payment-box {
    padding: 30px 40px;
    background: white;
    border-radius: 12px;
    box-shadow: 0 6px 24px rgba(0, 0, 0, 0.08);
    text-align: center;
    width: 700px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 500px; 
  }

  .payment-box h2 {
    font-size: 20px;
    margin-bottom: 12px;
    color: #444;
  }

  .payment-box .class-title {
    font-size: 20px;
    margin-bottom: 14px;
  }

  .payment-box .price {
    font-size: 26px;
    font-weight: bold;
    color: #111;
    margin-bottom: 24px;
  }

  .btn-kakao {
    background-color: #FEE500;
    color: #000;
    border: none;
    padding: 14px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 8px;
    width: 100%;
    cursor: pointer;
    transition: background 0.3s;
  }

  .btn-kakao:hover {
    background-color: #ffd600;
  }
</style>
</head>
<body>

<div class="payment-wrap">
  <div class="payment-box">
    <h2>카카오페이 결제</h2>
    <div class="class-title">${classTitle}</div>
    <div class="price">${classPrice}원</div>

    <input type="hidden" id="cl_num" value="${cl_num}">
    <input type="hidden" id="class_title" value="${classTitle}" />
    <input type="hidden" id="user_email" value="${userEmail}" />
    <input type="hidden" id="user_name" value="${userName}" />
    <input type="hidden" id="user_tel" value="${userTel}" />
    <input type="hidden" id="class_price" value="${classPrice}" />

    <button class="btn-kakao" onclick="requestPay()">카카오페이로 결제하기</button>
  </div>
</div>

<script>
  const contextPath = "${pageContext.request.contextPath}";

  function requestPay() {
    IMP.init("${impCode}");

    const clNum = document.getElementById("cl_num").value;
    const classTitle = document.getElementById("class_title").value;
    const classPrice = document.getElementById("class_price").value;
    const userEmail = document.getElementById("user_email").value;
    const userName = document.getElementById("user_name").value;
    const userTel = document.getElementById("user_tel").value;

    IMP.request_pay({
      pg: "kakaopay",
      pay_method: "card",
      merchant_uid: "order_" + new Date().getTime(),
      customer_uid: "customer_" + new Date().getTime(),
      name: classTitle,
      amount: classPrice,
      buyer_email: userEmail,
      buyer_name: userName,
      buyer_tel: userTel
    }, function (rsp) {
      if (rsp.success) {
    	  location.href = contextPath + "/order/payComplete"
    	    + "?imp_uid=" + rsp.imp_uid
    	    + "&merchant_uid=" + rsp.merchant_uid
    	    + "&cl_num=" + clNum
    	    + "&customer_uid=" + rsp.customer_uid; 
      } else {
        alert("결제 실패: " + rsp.error_msg);
      }
    });
  }
</script>

</body>
</html>