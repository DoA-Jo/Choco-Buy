<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/error.css">
<body>
	<div class="error-container">
		<div class="error-wrap">
			<div class="error-alert alert alert-danger">
				<span class="error-message"><strong>에러가 발생하였습니다.</strong> <br>내용을 확인해주세요.</span>
			</div>	
			<div id="footer" class="error-footer">
				<button onclick="location.href='/Trade/getTradeList'" type="button" class="btn btn-info">홈으로 가기</button>
			</div> 
		</div>
	</div>
</body>
</html>
