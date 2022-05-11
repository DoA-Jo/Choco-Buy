<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/chat.css">
<title>Insert title here</title>
<%@ include file="../template/header.jsp"  %>
<%@ include file="../template/menu.jsp"  %>
<div class="container mt-3 mb-3">
	<div class="warp">
		 <h1 class="chat_h1">채팅방</h1><br>
		 <c:choose>
	   
	            <c:when test="${myRoomCount > 0 }"> 
	           		 <div class="warp">
		        <section class="">
					<div class="container-fluid">
					<c:forEach items="${myRoomList}" var="myRoom">
					    <div class="media border p-3 chat_listBox"onclick="location.href='/Trade/TradeSel?chatroom_seq=${myRoom.chatroom_seq}'">
					    <img src="${pageContext.request.contextPath}/resources/img/img_avatar3.png" alt="John Doe" class="mr-3 rounded-circle" style="width:60px;">
					    <div class="media-body">
					      <h4 class="chat_h4">${myRoom.user_nick}  <span><i>${myRoom.chatroom_date}</i></span></h4>
					      <p>${myRoom.trade_title}</p>      
					    </div>
					  </div>
					</c:forEach>
				</div>
			</section>
		</div>
	            </c:when>
	           
	            <c:otherwise>
					해당 글에대한 거래요청이 존재하지 않습니다.
	            </c:otherwise>
		</c:choose>
	</div>
	        
</div>
<%@ include file="../template/footer.jsp"  %>
</body>
</html>