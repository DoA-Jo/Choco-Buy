<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/serviceBoard.css">
<title>고객센터 내용 상세보기</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 
	<div class="container">
		<div class="warp">
			<div class="contentcolor">
				<h1 style="display: flex; justify-content: center;">자주 묻는 질문 상세페이지</h1>
	<!-- 		<div class="panel panel-default"> -->
	<!-- 			<div class="panel-heading"></div> -->
	<!-- 			<div class="panel-body"> -->
	<!-- 				<table class="table table-hover"> -->
		  		  	<div class="input-group mb-3">
			      		<div class="input-group-prepend"></div>
			      	</div>
					<form name="fm" action="/Service/UpdateQna"><!-- POST방식 -->
						<table class="table table-bordered serviceContent" style="text-align:center">
							<thead>
							<tr>
								<td class ="th01">번호</td>
								<input type="hidden" name="qna_seq" value="${qna.qna_seq}">
								<td>${qna.qna_seq}</td>
							</tr>
							<tr>
								<td class ="th02">제목</td>
								<td>${qna.qna_title}</td>
							</tr>
							<tr>
								<td class ="th03">내용</td>
								
								<td><div style="white-space:pre;"><c:out value="${qna.qna_content}" /></div></td>
							</tr>
							<tr>
								<td class ="th04">작성자</td>
								<td>관리자</td>
							</tr>
							</thead>
		<!-- 					<div id="footer"> -->
						</table>
						<div align="left">
						<a href="/Service/getQnaList" class="btn btn-primary pull-Right">글 목록</a><!--GET방식  -->
						</div>
						<div class="editdelete">
						<c:if test="${ user_role eq 100 }"> <!-- 5월3일 수정 -->															<!-- 5월2일 추가 -->
							<button type="submit" class="btn btn-primary pull-Right">수정</button>
							<a href="/Service/deleteQna?service_seq=${qna.qna_seq}" class="btn btn-primary pull-Right">삭제</a>
	<!-- 						<button type="submit" class="btn btn-primary pull-Right">삭제</button> -->
						</c:if>
						</div>
					</form>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>