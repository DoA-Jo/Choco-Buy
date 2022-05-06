<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 	2022.05.04 추가 수정 start -->
<%@ include file="../template/head.jsp"  %>
<!-- 	2022.05.04 추가 수정 end -->
<style type="text/css">
	table{
		text-align:center;
	}
</style>
<!-- 2022.05.04 추가 수정 start -->
<title>Pay Complete Page</title>

<%@ include file="../template/header.jsp"  %>
<%@ include file="../template/menu.jsp"  %>
<!-- 	<h1>결제내역</h1> -->
<!-- 2022.05.04 추가 수정 end -->
	<table class="table table-hover w-auto mx-auto">
		<tr>
			<th colspan="4"><font size="30">결제가 완료되었습니다!</font></th>
		</tr>
		<!-- 2022.05.01 추가 수정 start -->
		<tr>
			<th size="250">주문번호</th>
			<th size="150">결제일시</th>
			<th size="100">결제금액</th>
			<th size="150">결제방법</th>
		</tr>
		<tr>
			<td>${pay.pay_ordernum }</td>
			<td>${pay.pay_date }</td>
			<td>${pay.pay_amount }</td>
			<td>${pay.pay_method }</td>
		<!-- 2022.05.01 추가 수정 end -->
		</tr>
		
	</table>
	<br><br>
	<table class="w-auto mx-auto">
		<tr>
<!-- 		2022.05.04 추가 수정 start -->
			<td>
				<a href="/Trade/getTradeList" class="btn btn-light btn-lg" role="button">메인으로</a>
			</td>
			<td>
				<a href="/Mypage/getMypageUser" class="btn btn-info btn-lg" role="button">마이페이지</a>
			</td>
<!-- 		2022.05.04 추가 수정 end -->
		</tr>
	</table>
<!-- 2022.05.04 추가 수정 start -->
<%@ include file="../template/footer.jsp"  %>
<!-- 2022.05.04 추가 수정 end -->
</body>
</html>