<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<%@ page contentType="text/html; charset=UTF-8"%>
<body>
	<div class="error-container">
		<div class="alert alert-danger">
			<strong>에러가 발생하였습니다.</strong> <br>내용을 확인해주세요.
		</div>
		<div id="footer">
			<button onclick="location.href='/Trade/getTradeList'" type="button" class="btn btn-primary">홈으로 가기</button>
		</div> 
	</div>
</body>
</html>
