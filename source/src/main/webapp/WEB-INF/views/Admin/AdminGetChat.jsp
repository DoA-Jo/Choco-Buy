<%@page import="com.chocobuy.biz.admin.AdminChatRoomVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="chat" value="${adminChatRoom }"></c:set>
<!DOCTYPE html>
<html>
<head>
<style>
	table, table td { border: solid; border-collapse: collapse; }
	td:nth-child(1) { min-width: 150px; }
	td:nth-child(2) { min-width: 150px; }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>채팅방 상세</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	<div class="container-fluid">
		<div class="chat">
			<div class="container-fluid">
				<table class="table-bordered">
					<tbody>
						<tr>
							<td>채팅방 번호</td>
							<td>${chat.chatroom_seq }</td>
							<td>게시글 번호</td>
							<td><a target="_blank" href="/Trade/getTrade?trade_seq=${chat.trade_seq }">${chat.trade_seq }</a></td>
							<td>거래 위치</td>
						</tr>
						<tr>
							<td>글 제목</td>
							<td>${chat.trade_title }</td>
							<td>채팅방 개설 날짜</td>
							<td>${chat.chatroom_date }</td>
							<td rowspan="4">${chat.trade_area }</td>
						</tr>
						<tr>
							<td>글쓴이 정보</td>
							<td>${chat.trade_nick }</td>
							<td colspan="2">${chat.trade_uuid }</td>
						</tr>
						<tr>
							<td>상대방 정보</td>
							<td>${chat.user_nick }</td>
							<td colspan="2">${chat.user_uuid }</td>
						</tr>
						<tr>
							<td>약속 여부</td>
							<td>${chat.chatroom_app }</td>
							<td>신고여부</td>
							<td>${chat.chatroom_report }</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="list">
				<c:forEach items="${adminMsgList }" var="msg">
					<br>
					<div class="<c:if test="${chat.trade_nick eq msg.user_nick}">left-chat</c:if><c:if test="${chat.trade_nick ne msg.user_nick}">right-chat</c:if>">
						<div class="chat-content">
							<div class="msg-writer">
								<label>${msg.user_nick }</label>
							</div>
							<span class="msg-content">${msg.msg_content }</span>
							<span class="msg-time">${msg.msg_date }</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>