<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp" %>	
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/pay.css">
<title>결제완료</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

	<div class="container" align="center">
		<div class="warp">
			<div class="pay_tit">
				<h1>결제내역</h1>
			</div>
			
			<table class="table table-hover w-auto mx-auto pay_table">
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
			
			
		    <div class="payBtnBox">
		 		<button type="button" class="btn btn-light btn-lg" onclick="location.href='/Trade/getTradeList'">메인으로</button>
				<button type="button" class="btn btn-info btn-lg" onclick="location.href='/Mypage/getMypageUser'">마이페이지</button>
			</div>
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>