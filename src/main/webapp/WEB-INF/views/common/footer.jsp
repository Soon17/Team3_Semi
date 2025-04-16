<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<body>
<c:if test="${empty noFooter}">
  <footer style="background-color: #f8f9fa; padding: 20px 0; margin-top: 80px; border-top: 1px solid #ddd; font-size: 13px; color: #666;">
    <div style="max-width: 1200px; margin: 0 auto; padding: 0 20px;">
      <div style="margin-bottom: 6px;">
        <strong style="margin-right: 20px;">ClassKH</strong>
        당신의 재능을 발견하는 곳
        <span style="margin-left: 20px;">© 2025 ClassKH. All rights reserved.</span>
      </div>
      <div>
        <span style="margin-right: 20px;">Email: naim@classkh.com</span>
        <span style="margin-right: 20px;">Phone: 02-1234-5678</span>
        <span>서울특별시 강남구 테헤란로14길 6 남도빌딩 2F</span>
      </div>
    </div>
  </footer>
</c:if>
</body>
</html>