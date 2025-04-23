<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 서브카테고리 옵션만 출력 --%>
<option value="" disabled selected>-- 선택하세요 --</option>
<c:forEach items="${list}" var="sc">
    <option value="${sc.sc_name}">${sc.sc_name}</option>
</c:forEach>
