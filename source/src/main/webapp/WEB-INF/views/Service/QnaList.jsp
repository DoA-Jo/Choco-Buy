<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/serviceBoard.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/inquiry.css">
<!-- <script src="../WebContent/resources/jquery-3.5.1.js"></script> -->
<title>초코바이 고객센터</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/header.jsp"  %>
	<%@ include file="/WEB-INF/views/template/menu.jsp" %>
	<h1 align="center">초코바이 고객센터</h1>

	<div class="qnaPage container">
   <div class="qnaBar">
      <ul class="nav flex-column serviceList">
   	<li class="nav-item"> <a class="nav-link service" href="/Service/getServiceList">공지 사항</a> </li>
    <li class="nav-item">
      <a class="nav-link service" href="/Service/getQnaList" style="color: red; font-weight: bold">자주 묻는 질문</a>
    </li>
		</ul>
   </div>
<div class="qnaTotal">
			<div class="searchTool" >
				<!-- 검색 시작 -->
				<form action="/Service/getQnaList" name="fm" method="post">
					<div class="searchTable">
						<select class="searchSelect" name="qna_searchCondition"	>
							<c:forEach items="${conditionMap}" var="option">
								<option value="${option.value}">${option.key}</option>
							</c:forEach>
						</select>
						<input type="hidden" name="nowPage">
						<input class="searchInput" name="qna_searchKeyword" type="text" onkeyDown="f_enterLogin()" placeholder="검색어를 입력해주세요."/>
						<button class="btn btn-outline-primary searchSubmit" type="button" onclick="pageFnc(0)">검색</button>
					</div>
				</form>
				<!-- 검색 종료 -->
			</div>
			<table class="table table-bordered qnaTable" style="text-align:center">
				<thead>
					<tr>
						<th class="th01">글번호</th>
						<th class="th02">제목</th>
						<th class="th03">작성자</th>
					</tr>
				</thead>
				<c:forEach items="${qnaList}" var="qna">
				<tr>
					<td>${qna.qna_seq }</td>
					<td><a href="/Service/getQna?qna_seq=${qna.qna_seq }">${qna.qna_title}</a></td>
					<td>${qna.qna_writer }</td>
				</tr>
				</c:forEach>
				<tbody>
				</tbody>
			</table>
			<div style="text-align: right;">
				<c:if test="${ UserInfo eq '7172be7a-c20a-11ec-a2b8-a8a1594f3c92' }">			<!-- 5월2일 추가 -->
				<a href="/Service/Qnawrite" class="btn btn-primary pull-Right">글쓰기</a>
				</c:if>
			</div>
<div class="btnBox"  style="text-align: center;">
			<div id="pgCnt" class="btn-group">
			<c:if test="${paging.startPage != 1 }">
				<button type="button" class="btn btn-primary" onclick="pageFnc(${paging.startPage - 1 })">&lt;</button>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<button type="button" class="btn btn-primary" style="color:#f00;">${p }</button>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<button type="button" class="btn btn-primary" onclick="pageFnc(${p })">${p }</button>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<button type="button" class="btn btn-primary" onclick="pageFnc(${paging.endPage+1})">&gt;</button>
			</c:if>
			</div>
</div>
						</div><!-- 61번째 줄  div 닫기 -->
 					 <br>
		</div><!-- 50번째 줄  div 닫기 -->
<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "/Service/getQnaList";
	frm.method = "post";
	frm.submit();	
}
//엔터키 로 검색
function f_enterLogin() {
	//이벤트 키코드
    if(window.event.keyCode == 13){
    	pageFnc(0); 
	}
}
</script>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>