<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.List"%>
<%@ include file="/WEB-INF/views/template/head.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/serviceBoard.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#accordion" ).accordion({
    collapsible: true
  });
} );
</script>
<style>

.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
    border: 1px solid #003eff;
    background: red;
    font-weight: normal;
    color: #ffffff;
}


</style>
<title>초코바이 고객센터</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 
	<h1 align="center">초코바이 고객센터</h1>

	<div class="qnaPage container">
		<div class="warp">
			<div class="qnaBar">
				<ul class="nav flex-column serviceList">
					<li class="nav-item"><a class="nav-link service"
						href="/Service/getServiceList">공지 사항</a></li>
					<li class="nav-item"><a class="nav-link service"
						href="/Service/getQnaList" style="color: red; font-weight: bold">자주
							묻는 질문</a></li>
				</ul>
			</div>
			<div class="qnaTotal">
				<div class="searchTool">
					<!-- 검색 시작 -->
					<form action="/Service/getQnaList" name="fm" method="post">
						<div class="searchTable">
							<select class="searchSelect" name="qna_searchCondition">
								<c:forEach items="${conditionMap}" var="option">
									<option value="${option.value}">${option.key}</option>
								</c:forEach>
							</select> <input type="hidden" name="nowPage"> <input
								class="searchInput" name="qna_searchKeyword" type="text"
								onkeyDown="f_enterLogin()" placeholder="검색어를 입력해주세요." />
							<button class="btn btn-outline-primary searchSubmit" type="button"
								onclick="pageFnc(0)">검색</button>
						</div>
					</form>
					<!-- 검색 종료 -->
				</div>
	
				<!-- 아코디언 처리 (시작)-->
				<%
					pageContext.setAttribute("LF", "\n");
				%>
				<div id="accordion">
					<c:forEach items="${qnaList}" var="qna">
						<div class="titlebg">
							<h3 class="pt-3 pb-3 titleheader">
								<i style="font-size: 24px" class="fa titlefa">Q</i>${qna.qna_title}</h3>
						</div>
						<div style="position: relative;">
							<p class="fa">
								<i style="font-size: 24px" class="fa">A.</i>
							</p>
							<br> <br>
							<p>
								<c:out value="${fn:replace(qna.qna_content, LF, '<br>')}"
									escapeXml="false" />
							</p>
							<c:if test="${ user_role eq 100 }">
								<div class="Qnaeditdelete">
									<button type="button" class="btn btn-primary pull-Right"
										onclick="location.href='/Service/UpdateQna?qna_seq=${qna.qna_seq}'">수정</button>
									<button type="button" onclick="deletebutton(${qna.qna_seq})"
										class="btn btn-primary pull-Right">삭제</button>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</div>
				<!-- 아코디언 처리 (끝)-->
				<div style="text-align: right;">
					<c:if test="${ user_role eq 100 }">
						<!-- 5월3일 수정 -->
						<!-- 5월2일 추가 -->
						<!-- 					<a class="qnawrite"  -->
						<a href="/Service/Qnawrite" class="btn btn-primary pull-Right">글쓰기</a>
					</c:if>
	
				</div>
				<div class="btnBox" style="text-align: center;">
					<div id="pgCnt" class="btn-group">
						<c:if test="${paging.startPage != 1 }">
							<button type="button" class="btn btn-primary"
								onclick="pageFnc(${paging.startPage - 1 })">&lt;</button>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<button type="button" class="btn btn-primary"
										style="color: #f00;">${p }</button>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<button type="button" class="btn btn-primary"
										onclick="pageFnc(${p })">${p }</button>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<button type="button" class="btn btn-primary"
								onclick="pageFnc(${paging.endPage+1})">&gt;</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!-- 61번째 줄  div 닫기 -->
	</div>
	<!-- 50번째 줄  div 닫기 -->
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

function deletebutton(val) {
    if (confirm("정말 삭제하시겠습니까?") == true) {
        location.href="/Service/deleteQna?qna_seq="+val;
    } 

}
</script>
	<%@ include file="/WEB-INF/views/template/footer.jsp"%>
</body>
</html>