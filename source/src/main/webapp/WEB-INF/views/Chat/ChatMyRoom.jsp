<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="../template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<title>Insert title here</title>
<style>
	h1 { font-size:27pt;
		 text-align: center; 
		  font-weight: 700;
		}
	h4	{
		  font-size:12pt;
		  font-weight: 400;
	}
</style>
<%@ include file="../template/header.jsp"  %>
<%@ include file="../template/menu.jsp"  %>
<div class="container mt-3 mb-3">
	 <h1>채팅방</h1><br>
	 <c:choose>
   
            <c:when test="${myRoomCount > 0 }"> 
           		 <div class="warp">
	        <section class="">
				<div class="container-fluid">
				<c:forEach items="${myRoomList}" var="myRoom">
				    <div class="media border p-3"onclick="location.href='/Trade/TradeSel?chatroom_seq=${myRoom.chatroom_seq}'">
				    <img src="${pageContext.request.contextPath}/resources/img/img_avatar3.png" alt="John Doe" class="mr-3 rounded-circle" style="width:60px;">
				    <div class="media-body">
				      <h4>${myRoom.user_nick}  <small><i>${myRoom.chatroom_date}</i></small></h4> <br>
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
<%@ include file="../template/footer.jsp"  %>
</body>
</html>