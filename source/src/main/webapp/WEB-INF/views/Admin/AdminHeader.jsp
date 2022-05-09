<%@page import="com.chocobuy.biz.user.impl.UserServiceImpl"%>
<%@page import="com.chocobuy.biz.user.UserService"%>
<%@page import="com.chocobuy.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/admin.css">
	<div class="admin-nav">
		<span>
			<ul>
				<li><a href="/Admin/adminMain">회원 관리</a></li>
				<li><a href="/Admin/adminTrade">게시글 관리</a></li>
				<li><a href="/Admin/adminChat">채팅창 관리</a></li>
				<li><a href="/Admin/adminPay">결제 관리</a></li>
				<li><a href="/Admin/adminService">고객 센터</a></li>
				<li><a href="/Admin/adminQna">자주 묻는 질문</a></li>
				<li><a href="/Admin/adminInquiry">1:1 문의</a></li>
			</ul>
		</span>
		<span>
			<a target="_blank" href="/Trade/getTradeList">사용자 페이지</a>
			<a href="/Login/logout">로그아웃</a>
		</span>
	</div>