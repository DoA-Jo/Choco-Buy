<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp" %>	
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/pay.css">
<title>주문서</title>
<!-- (kakao 지도API)javascript key=9fc11080c962f547cb0e64dc54c2fb97 -->
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp" %>	

	<div class="container" align="center">
		<div class="warp">
			<div class="pay_tit">
				<h1>주문서</h1>
			</div>
		
			<table class="table bordered-table w-auto mx-auto pay_table">
				<tr>
					<td rowspan="3">
					<label>거래희망지역 상세 보기</label>
						<div id="map" class="pay_mapBox"></div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9fc11080c962f547cb0e64dc54c2fb97&libraries=services"></script>
						<script>
						<c:forEach items="${AppointmentList }" var="app">
							var p_adrs="${app.app_add }";
						</c:forEach>
						// 채팅에서 설정한 주소(trade_area?)를 당겨와서 아래 주소로 좌표검색 부분에 넣어주면 완성
						
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						
						// 주소로 좌표를 검색합니다
		// 				geocoder.addressSearch('반포대로 144', function(result, status) {
						geocoder.addressSearch(p_adrs, function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">거래장소!</div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>
					</td>
					<td>
						<label>거래희망시간 확인</label><br>
		<!-- 				<input type="text" size="3" id="pay_year" value="" />년 <input type="text" size="2" id="pay_month" value="" />월 <input type="text" size="2" id="pay_day" value="" />일<br> -->
		<!-- 				<input type="text" size="1" id="pay_start_time" value="" />시 ~ <input type="text" size="1" id="pay_end_time" value="" />시 -->
		<!-- 				<input type="text" size="30" id="pay_date" value="" /> -->
						<c:forEach items="${AppointmentList }" var="app">
							<!-- 2022.05.01 추가 수정 start -->
							<input type="text" size="10" id="pay_date2" value="${appointment.app_time }" readonly/>
							<!-- 2022.05.01 추가 수정 end -->
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>
						<label>거래내용 확인</label><br>
		<!-- 				판매자&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" size="4" id="pay_seller" value="" /> 구매자: <input type="text" size="4" id="pay_buyer" value="" /><br> -->
		<!-- 				거래내용: <input type="text" size="30" id="pay_trade" value="" /> -->
						<c:forEach items="${ChatroomList }" var="chat">
						판매자: <input type="text" size="4" id="pay_seller" value="${chat.user_nick1 }" readonly/> 구매자: <input type="text" size="4" id="pay_buyer" value="${chat.user_nick2 }" readonly/><br>
						</c:forEach>
						<c:forEach items="${TradeList }" var="trade">
						거래내용: <input type="text" size="30" id="pay_trade" value="${trade.trade_title }" readonly/>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td>
						<label>총 결제 금액</label><br>
		<!-- 				<input type="text" size="30" id="pay_amount" value="" />원 -->
						<c:forEach items="${AppointmentList }" var="app">		
						<input type="text" size="30" id="pay_amount" value="${app.app_price }" readonly/>원
						</c:forEach>
					</td>
				</tr>
			</table>
			
			
		    <div class="payBtnBox">
		 		<button type="button" class="btn btn-light btn-lg" onclick="location.href='/Trade/getTradeList'">취소하기</button>
				<button type="button" class="btn btn-info btn-lg" onclick="location.href='/Pay/Pay'">결제하기</button>
			</div>
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>