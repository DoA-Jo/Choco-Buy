<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 	2022.05.04 추가 수정 start -->
<%@ include file="../template/head.jsp"  %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9fc11080c962f547cb0e64dc54c2fb97&libraries=services"></script>
<!-- 	2022.05.04 추가 수정 end -->
<title>Pay Index Page</title>
<!-- (kakao 지도API)javascript key=9fc11080c962f547cb0e64dc54c2fb97 -->

<%@ include file="../template/header.jsp"  %>
<%@ include file="../template/menu.jsp"  %>
<!-- 2022.05.04 추가 수정 start -->
<!-- <h1>주문서</h1> -->
<!-- 2022.05.04 추가 수정 end -->
	<table class="table bordered-table w-auto mx-auto">
		<tr>
			<td rowspan="3">
			<label>거래희망지역 상세 보기</label>
				<div id="map" style="width:500px;height:350px;"></div>
				<script>
// 				2022.05.04 추가 수정 start
// 				<c:forEach items="${AppointmentList }" var="app">
// 					var p_adrs=${appointment.app_add };
// 				</c:forEach>
// 				2022.05.04 추가 수정 end
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
// 2022.05.04 추가 수정 start
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();
				
				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
// 2022.05.04 추가 수정 end				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
// 				geocoder.addressSearch('반포대로 144', function(result, status) {
// 				2022.05.04 추가 수정 start
				geocoder.addressSearch('${appointment.app_add }', function(result, status) {
// 				2022.05.04 추가 수정 end
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
// 				        2022.05.04 추가 수정 start
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">여기서 만나요!</div>'
				        });
				        infowindow.open(map, marker);
// 				        2022.05.04 추가 수정 end
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>
			</td>
			<td>
				<label>거래희망시간 확인</label><br>
					<!-- 2022.05.04 추가 수정 start -->
					<input type="text" size="20" id="pay_date2" value="${appointment.app_time }" readonly/>
					<!-- 2022.05.04 추가 수정 end -->
			</td>
		</tr>
		<tr>
			<td>
				<label>거래내용 확인</label><br>
				<!-- 2022.05.04 추가 수정 start -->
				판매자: <input type="text" size="10" id="pay_seller" value="${chatroom.trade_nick }" readonly/><br>
				구매자: <input type="text" size="10" id="pay_buyer" value="${chatroom.user_nick }" readonly/><br>
				거래내용: <input type="text" size="3" id="pay_cat" value="${trade.trade_category }" readonly/><input type="text" size="10" id="pay_trade" value="${chatroom.trade_title }" readonly/>
				<!-- 2022.05.04 추가 수정 end -->
			</td>
		</tr>
		<tr>
			<td>
				<label>총 결제 금액</label><br>
				<!-- 2022.05.04 추가 수정 start -->	
				<input type="text" size="10" id="pay_amount" value="${appointment.app_price }" readonly/>원
				<!-- 2022.05.04 추가 수정 end -->
			</td>
		</tr>
	</table>
	<table class="w-auto mx-auto">
		<tr>
			<td>
<!-- 			2022.05.04 추가 수정 start -->
				<a href="/Trade/getTradeList" class="btn btn-light btn-lg" role="button">취소하기</a>
<!-- 			2022.05.04 추가 수정 end -->
			</td>
			<td>
				<button type="button" onclick="location.href='/Pay/Pay?chatroom_seq=${chatroom.chatroom_seq}'" class="btn btn-info btn-lg" role="button">결제하기</a>
			</td>
		</tr>
	</table>
<%@ include file="../template/footer.jsp"  %>
</body>
</html>