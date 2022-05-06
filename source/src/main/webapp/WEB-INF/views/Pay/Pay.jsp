<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 	2022.05.04 추가 수정 start -->
<%@ include file="../template/head.jsp"  %>
<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- jQuery -->
<!-- 	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<!-- 	2022.05.04 추가 수정 end -->
<title>Pay Page</title>

<script>
//2022.05.04 추가 수정 start
var curDate = new Date();
var curTime = curDate.getFullYear() + "-" + (curDate.getMonth() + 1) + "-" + curDate.getDate() + " " + curDate.getHours() + ":" + curDate.getMinutes() + ":" + curDate.getSeconds();
//2022.05.04 추가 수정 end

// 2022.05.04 추가 수정 start
var p_amount=null;
	p_amount=${appointment.app_price };
var p_email="chocobuy@250.ml";
var p_buyer=null;
	p_buyer='${chatroom.user_nick}';
var p_tel="010-8888-8888";
var p_addr='${appointment.app_add }';
var p_postcode="00000";
var mid = "CHOCOBUY-" + new Date().getTime();
var method=null; // 4개의 결제방식에 맞추어 바뀌어야 함..
	method="card";
// 2022.05.04 추가 수정 end
var chk = false;

$(document).ready(function(){
	var IMP=window.IMP;
// 	IMP.init('${impKey}'); // 가맹점 식별코드
	IMP.init('imp76820413'); // 가맹점 식별코드
	
	// 카드
	$("#pay_card").click(function () {
		IMP.request_pay({
			pg: "html5_inicis",
			pay_method: method,
			merchant_uid: mid,
			name: "초코바이 도움비",
			// 테스트용 금액정보
// 			amount: 400,
// 			2022.05.01 추가 수정 start
			// 실사용 금액정보
			amount: p_amount, // 테스트시엔 0원 결제 불가능
			// 기타정보
			// 2022.05.04 추가 수정 start 
			buyer_email: p_email,
			buyer_name: p_buyer,
			buyer_tel: p_tel,
			buyer_addr: p_addr,
			buyer_postcode: p_postcode,
			// 2022.05.04 추가 수정 end
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
			pay_method: method,
			merchant_uid: mid,
			name: "초코바이 도움비",
			// 테스트용 금액정보
// 			amount: 400,
// 			2022.05.01 추가 수정 start
			// 실사용 금액정보
			amount: p_amount,
			// 기타정보 
			// 2022.05.04 추가 수정 start 
			buyer_email: p_email,
			buyer_name: p_buyer,
			buyer_tel: p_tel,
			buyer_addr: p_addr,
			buyer_postcode: p_postcode,
			// 2022.05.04 추가 수정 end
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
			pay_method: method,
			merchant_uid: mid,
			name: "초코바이 도움비",
			// 테스트용 금액정보
// 			amount: 400,
// 			2022.05.01 추가 수정 start
			// 실사용 금액정보
			amount: p_amount,
			// 기타정보 
			// 2022.05.04 추가 수정 start 
			buyer_email: p_email,
			buyer_name: p_buyer,
			buyer_tel: p_tel,
			buyer_addr: p_addr,
			buyer_postcode: p_postcode,
			// 2022.05.04 추가 수정 end
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
			pay_method: method,
			merchant_uid: mid,
			name: "초코바이 도움비",
			// 테스트용 금액정보
// 			amount: 400,
// 			2022.05.01 추가 수정 start
			// 실사용 금액정보
			amount: p_amount,
			// 기타정보 
			// 2022.05.04 추가 수정 start 
			buyer_email: p_email,
			buyer_name: p_buyer,
			buyer_tel: p_tel,
			buyer_addr: p_addr,
			buyer_postcode: p_postcode,
			// 2022.05.04 추가 수정 end
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
// 	2022.05.04 추가 수정 start
	fm.pay_ordernum.value=mid;
	fm.pay_date.value=curTime;
	fm.pay_amount.value=p_amount;
	fm.pay_method.value=method;
// 	2022.05.04 추가 수정 end
	fm.action="/Pay/Payment";
	fm.method="post";
	fm.submit();
}
	
</script>


<!-- 2022.05.04 추가 수정 start -->
<%@ include file="../template/header.jsp"  %>
<%@ include file="../template/menu.jsp"  %>
<!-- 2022.05.04 추가 수정 end -->

<!-- 2022.05.01 추가 수정 start -->
<form name="fm">
<!-- 	2022.05.04 추가 수정 start -->
<!-- 	<h1>결제방법 선택</h1> -->
<!-- 	2022.05.04 추가 수정 end -->
	<table class="w-auto mx-auto">
	<tr>
		<td>
<!-- 		2022.05.04 추가 수정 start -->
				<input name="pay_ordernum" type="hidden" />
				<input name="pay_sell" type="hidden" value="${chatroom.trade_nick }"/>
				<input name="pay_buy" type="hidden" value="${chatroom.user_nick }"/>
				<input name="pay_category" type="hidden" value="${trade.trade_category }"/>
				<input name="pay_date" type="hidden" />
				<input name="pay_amount" type="hidden" />
				<input name="pay_method" type="hidden" />
				
<!-- 				<input name="pay_ordernum" type="hidden" value="주문번호test"/> -->
<!-- 				<input name="pay_sell" type="hidden" value="판매자test"/> -->
<!-- 				<input name="pay_buy" type="hidden" value="구매자test"/> -->
<!-- 				<input name="pay_category" type="hidden" value="배달test"/> -->
<!-- 				<input name="pay_date" type="hidden" value="2022-05-01 09:38"/> -->
<!-- 				<input name="pay_amount" type="hidden" value="5000"/> -->
<!-- 				<input name="pay_method" type="hidden" value="cardtest"/> -->
<!-- 		2022.05.04 추가 수정 start -->
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
<!-- 			2022.05.04 추가 수정 start -->
<!-- 			<a href="/Pay/PayIndex" class="btn btn-light btn-lg" role="button">취소하기</a> -->
			<button type="button" onclick="location.href='/Pay/PayIndex?chatroom_seq=${chatroom.chatroom_seq}'" class="btn btn-light btn-lg" role="button">취소하기</a>
<!-- 			2022.05.04 추가 수정 end -->
		</td>
	</tr>
	</table>
</form>
<!-- 2022.05.04 추가 수정 start -->
<%@ include file="../template/footer.jsp"  %>
<!-- 2022.05.04 추가 수정 end -->
</body>
</html>