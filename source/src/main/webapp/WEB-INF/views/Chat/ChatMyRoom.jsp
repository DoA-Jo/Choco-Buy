<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<title>Insert title here</title>
	<style>
		h1 { text-align: center; }
	</style>
</head>

<body>
  <h1>채팅방</h1><br>
<c:forEach items="${myRoomList}" var="myRoom">
	<div class="container mt-3" onclick="location.href='/Trade/TradeSel?chatroom_seq=${myRoom.chatroom_seq}'">
    <div class="media border p-3">
    <img src="${pageContext.request.contextPath}/resources/img/img_avatar3.png" alt="John Doe" class="mr-3 mt-3 rounded-circle" style="width:60px;">
    <div class="media-body">
      <h4>${myRoom.user_nick}<small><i>${myRoom.chatroom_date}</i></small></h4>
      <p>${myRoom.trade_title}</p>      
    </div>
  </div>
</div>
</c:forEach>

</body>
</html>