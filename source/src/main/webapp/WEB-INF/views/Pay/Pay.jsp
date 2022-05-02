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
<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>	
<title>결제</title>

<script>
var p_amount=null;
<c:forEach items="${AppointmentList }" var="app">
	p_amount=${app.app_price };
</c:forEach>
var p_email="chocobuy@250.ml";
var p_buyer=null;
// <c:forEach items="${ChatroomList }" var="chat">
// 	p_buyer=${chat.user_nick2 };
// </c:forEach>
	p_buyer="구매자";
var p_tel="010-8888-8888";
var p_addr="반포대로 144";
var p_postcode="06595";
var chk = false;
$(document).ready(function(){
	var IMP=window.IMP;
// 	IMP.init('${impKey}'); // 가맹점 식별코드
	IMP.init('imp76820413'); // 가맹점 식별코드
	// 카드
	$("#pay_card").click(function () {
		IMP.request_pay({
			pg: "html5_inicis",
			pay_method: "card",
			merchant_uid: "CHOCOBUY-A" + new Date().getTime(),
			name: "초코바이 도움비",
			// 테스트용 금액정보
// 			amount: 400,
// 			2022.05.01 추가 수정 start
			// 실사용 금액정보
			amount: p_amount, // 테스트시엔 0원 결제 불가능
			// 기타정보 
			buyer_email: p_email,
			buyer_name: p_buyer,
			buyer_tel: "010-1111-1111",
			buyer_addr: "반포대로 144",
			buyer_postcode: '06595',
// 			2022.05.01 추가 수정 end
			m_redirect_url: "http://localhost:8090/Pay/PayComplete"
		}, function (rsp) {
			console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
    
	// 계좌이체
	$("#pay_trans").click(function () {
		IMP.request_pay({
			pg: "html5_inicis",
			pay_method: "trans",
			merchant_uid: "CHOCOBUY-B" + new Date().getTime(),
			name: "초코바이 도움비",
			// 테스트용 금액정보
// 			amount: 400,
// 			2022.05.01 추가 수정 start
			// 실사용 금액정보
			amount: p_amount,
			// 기타정보 
			buyer_email: p_email,
			buyer_name: p_buyer,
			buyer_tel: "010-2222-2222",
			buyer_addr: "강남대로 405 통영빌딩",
			buyer_postcode: '06595',
// 			2022.05.01 추가 수정 end
			m_redirect_url: "http://localhost:8090/Pay/PayComplete"
		}, function (rsp) {
			console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
// 휴대폰 소액결제
	$("#pay_phone").click(function () {
		IMP.request_pay({
			pg: "html5_inicis",
			pay_method: "phone",
			merchant_uid: "CHOCOBUY-C" + new Date().getTime(),
			name: "초코바이 도움비",
			// 테스트용 금액정보
// 			amount: 400,
// 			2022.05.01 추가 수정 start
			// 실사용 금액정보
			amount: p_amount,
			// 기타정보 
			buyer_email: p_email,
			buyer_name: p_buyer,
			buyer_tel: "010-3333-3333",
			buyer_addr: "강남대로 405 통영빌딩",
			buyer_postcode: '06595',
// 			2022.05.01 추가 수정 end
			m_redirect_url: "http://localhost:8090/Pay/PayComplete"
		}, function (rsp) {
			console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
    
// 카카오페이  
	$("#pay_kakao").click(function () {
		IMP.request_pay({
			pg: "kakaopay",
			pay_method: "card",
			merchant_uid: "CHOCOBUY-D" + new Date().getTime(),
			name: "초코바이 도움비",
			// 테스트용 금액정보
// 			amount: 400,
// 			2022.05.01 추가 수정 start
			// 실사용 금액정보
			amount: p_amount,
			// 기타정보 
			buyer_email: "email@email.com",
			buyer_name: p_buyer,
			buyer_tel: "010-5555-5555",
			buyer_addr: "강남대로 405 통영빌딩",
			buyer_postcode: '06595',
// 			2022.05.01 추가 수정 end
			m_redirect_url: "http://localhost:8090/Pay/PayComplete"
		}, function (rsp) {
			console.log(rsp);
				if(rsp.success){
					var msg = '결제가 완료되었습니다.';
					chk = true;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				if(chk==true) orderList();
		});
	});
});
		
function orderList(){
	let fm=document.fm;
	fm.action="/Pay/Payment";
	fm.method="post";
	fm.submit();
}
	
</script>

</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

<!-- 2022.05.01 추가 수정 start -->
<form name="fm">
	<h1>결제방법 선택</h1>
	<table class="w-auto mx-auto">
	<tr>
		<td>
<%-- 				<input name="pay_ordernum" type="hidden" value="${merchant_uid }"/> --%>
<!-- 				<input name="pay_sell" type="hidden" value="판매자"/> -->
<!-- 				<input name="pay_buy" type="hidden" value="구매자"/> -->
<!-- 				<input name="pay_category" type="hidden" value="배달"/> -->
<!-- 				<input name="pay_date" type="hidden" value="2022-05-01 09:38"/> -->
<%-- 				<input name="pay_amount" type="hidden" value="${amount }"/> --%>
<%-- 				<input name="pay_method" type="hidden" value="${pay_method }"/> --%>
				<input name="pay_ordernum" type="hidden" value="주문번호test"/>
				<input name="pay_sell" type="hidden" value="판매자test"/>
				<input name="pay_buy" type="hidden" value="구매자test"/>
				<input name="pay_category" type="hidden" value="배달test"/>
				<input name="pay_date" type="hidden" value="2022-05-01 09:38"/>
				<input name="pay_amount" type="hidden" value="5000"/>
				<input name="pay_method" type="hidden" value="cardtest"/>
<!-- 2022.05.01 추가 수정 end -->				
			<button id="pay_card" class="btn btn-info btn-lg" type="button">카드결제</button>
			<button id="pay_trans" class="btn btn-info btn-lg" type="button">실시간 계좌이체</button>
			<button id="pay_phone" class="btn btn-info btn-lg" type="button">휴대폰 소액결제</button>
			<button id="pay_kakao" class="btn btn-info btn-lg" type="button">카카오페이</button>
		</td>
	</tr>
	</table>
	<table class="w-auto mx-auto">
	<tr>
		<td>
			<br>
			<a href="/Pay/PayIndex" class="btn btn-light btn-lg" role="button">취소하기</a>
		</td>
	</tr>
	</table>
</form>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>