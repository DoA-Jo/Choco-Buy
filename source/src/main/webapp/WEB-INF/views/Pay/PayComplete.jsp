<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- BootStrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css.reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css.style.css">
<style type="text/css">
	table{
		text-align:center;
	}
</style>
<title>결제완료</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
	<h1>결제내역</h1>
	<table class="table table-hover w-auto mx-auto">
		<tr>
			<th colspan="2"><font size="30">결제가 완료되었습니다!</font></th>
		</tr>
		<!-- 2022.05.01 추가 수정 start -->
		<tr>
			<th size="250">주문번호</th>
			<th size="150">결제일시</th>
			<th size="100">결제금액</th>
			<th size="150">결제방법</th>
		</tr>
		<tr>
<%-- 		<c:forEach items="${PayList }" var="pay"> --%>
			<td>${pay.pay_ordernum }</td>
			<td>${pay.pay_date }</td>
			<td>${pay.pay_amount }</td>
			<td>${pay.pay_method }</td>
<%-- 		</c:forEach> --%>
		<!-- 2022.05.01 추가 수정 end -->
		</tr>
		
	</table>
	<br><br>
	<table class="w-auto mx-auto">
		<tr>
			<td>
				<a href="WEB-INF/index.jsp" class="btn btn-light btn-lg" role="button">메인으로</a>
			</td>
			<td>
				<a href="/MyPage/MypageMain.jsp" class="btn btn-info btn-lg" role="button">마이페이지</a>
			</td>
		</tr>
	</table>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>