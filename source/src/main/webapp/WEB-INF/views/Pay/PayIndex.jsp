<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp" %>	
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/pay.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7936f38a9850536e84a2e9f3579d56b3&libraries=services"></script>
<title>Pay Index Page</title>
<!-- (kakao 지도API-real)javascript key=7936f38a9850536e84a2e9f3579d56b3 -->
<%@ include file="/WEB-INF/views/template/header.jsp" %>	

	<div class="container" align="center">
		<div class="warp">
			<div class="pay_tit">
				<h1>주문서</h1>
			</div>
		
			<table class="table bordered-table w-auto mx-auto pay_table">
				<tr>
					<td rowspan="3">
					<label><b>거래희망지역 상세 보기</b></label>
						<div id="map" class="pay_mapBox"></div>
						<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new kakao.maps.MapTypeControl();
				
				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
				
				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${appointment.app_add }', function(result, status) {

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
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">여기서 만나요!</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>
					</td>
					<td>
						<label><b>거래희망시간 확인</b></label><br>
							${appointment.app_time }
					</td>
				</tr>
				<tr>
					<td>
						<label><b>거래내용 확인</b></label><br>
						판매자 : ${chatroom.trade_nick }<br>
						구매자 : ${chatroom.user_nick }<br><br>
						거래내용 : "${trade.trade_category }" 카테고리<br>
						-> ${chatroom.trade_title }
					</td>
				</tr>
				<tr>
					<td>
						<label><b>총 결제 금액</b></label><br>
						${appointment.app_price }원
					</td>
				</tr>
			</table>
			
			
		    <div class="payBtnBox">
		 		<button type="button" class="btn btn-light btn-lg" onclick="location.href='/Trade/getTradeList'">취소하기</button>
				 <button type="button" onclick="location.href='/Pay/Pay?chatroom_seq=${chatroom.chatroom_seq}'" class="btn btn-info btn-lg" role="button">결제하기</button>
			</div>
			
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>