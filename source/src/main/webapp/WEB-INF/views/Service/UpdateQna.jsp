<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link href="../css/serviceBoard.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
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
			<h1 style="display: flex; justify-content: center;">자주 묻는 질문 수정페이지</h1>
<!-- 		<div class="panel panel-default"> -->
<!-- 			<div class="panel-heading"></div> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<table class="table table-hover"> -->
	  		  	<div class="input-group mb-3">
		      		<div class="input-group-prepend"></div>
		      	</div>
				<form name="fm" action="/Service/updateQna" method="post">
					<table class="table table-bordered" style="text-align:center">
						<tr>
							<td>번호</td>
							<input type="hidden" name="qna_seq" value="${qna.qna_seq}">
							<td>${qna.qna_seq}</td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="qna_title" value="${qna.qna_title}"></td>
						</tr>
						<tr>
							<td>내용</td>
							
							<td><textarea name="qna_content">${qna.qna_content}</textarea></td>
						</tr>
						<tr>
							<td>작성자</td>
							<input type="hidden" name="qna_writer" value="${qna.qna_writer}">
							<td>${qna.qna_writer}</td>
						</tr>
	<!-- 					<div id="footer"> -->
					</table>
					<div align="left">
					<a href="/Service/QnaController" class="btn btn-primary pull-Right">글 목록</a>
					</div>
					<div align="right">
<!-- 						<a href="/Service/ServiceController.do" class="btn btn-primary pull-Right">글 목록</a> -->
						<button type="submit" class="btn btn-primary pull-Right">수정</button>
						<a href="/Service/deleteQna?qna_seq=${qna.qna_seq}" class="btn btn-primary pull-Right">삭제</a>
<!-- 						<button type="submit" class="btn btn-primary pull-Right">삭제</button> -->
					</div>
				</form>
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>