<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link href="../css/serviceBoard.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/serviceBoard.css">
<!-- <script src="../WebContent/resources/jquery-3.5.1.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<meta charset="UTF-8">
<title>고객센터 내용 상세보기</title>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
	<div class="container">
		<div class="">
			<h1 style="display: flex; justify-content: center;">공지내용 상세페이지</h1>
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"></div> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<table class="table table-hover"> -->
	  		  	<div class="input-group mb-3">
		      		<div class="input-group-prepend"></div>
		      	</div>
				<form name="fm" action="updateService"><!-- POST방식 -->
					<table class="table table-bordered" style="text-align:center">
						<tr>
							<td>번호</td>
							<input type="hidden" name="service_seq" value="${service.service_seq}">
							<td>${service.service_seq}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>${service.service_title}</td>
						</tr>
						<tr>
							<td>내용</td>
							
							<td><div style="white-space:pre;"><c:out value="${service.service_content}" /></div></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${service.service_writer}</td>
						</tr>
	<!-- 					<div id="footer"> -->
					</table>
					<div align="left">
					<a href="/Service/getServiceList" class="btn btn-primary pull-Right">글 목록</a><!--GET방식  -->
					</div>
					<div align="right">
					<c:if test="${ user_role eq 100 }">			<!-- 5월2일 추가 -->  <!-- 5월 3일 수정 -->
<!-- 						<a href="/Service/ServiceController.do" class="btn btn-primary pull-Right">글 목록</a> -->
						<button type="submit" class="btn btn-primary pull-Right">수정</button>
						<a href="/Service/deleteService?service_seq=${service.service_seq}" class="btn btn-primary pull-Right">삭제</a>
<!-- 						<button type="submit" class="btn btn-primary pull-Right">삭제</button> -->
					</c:if>
					</div>
				</form>
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>