<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/serviceBoard.css">
<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "/Service/QnaController";
	frm.method = "post";
	frm.submit();	
}
</script>
<style>
/* menuBar */
.serviceBar {margin-left :140px; display : flex; position : relative;} 
.serviceBar .serviceList{ position : absolute; left : 0px; } 

/* listcontainer */
.listContainer {width: 1200px;margin : 0 auto; }
.listContainer .searchBox { display : flex; justify-content:right }
</style>
<title>초코바이 고객센터</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %>
	<h1 align="center">초코바이 고객센터</h1>
<div class="qnaPage">
    <div class="serviceBar">
       <ul class="nav flex-column serviceList">
    <li class="nav-item">
      <a class="nav-link service" href="/Service/getServiceList">공지 사항</a>
    </li>
    <li class="nav-item">
      <a class="nav-link service" href="/Service/getQnaList">자주 묻는 질문</a>
    </li>
  </ul>
     </div>
	<div class="listContainer">
		<div class="serviceTotal">
		<div class="searchTool" >
			<!-- 검색 시작 -->
			<form action="/Service/QnaController" name="fm" method="post">
				<table>
					<tr>
						<td>
						<select class="searchSelect" name="qna_searchCondition"	>
							<c:forEach items="${conditionMap}" var="option">
								<option value="${option.value}">${option.key}</option>
							</c:forEach>
							</select>
							<input class="searchInput" name="qna_searchKeyword" type="text" placeholder="검색어를 입력해주세요."/>
						<input class="btn btn-outline-primary searchSubmit" type="submit" value="검색" />
						</td>
					</tr>
				</table>
			</form>
			<!-- 검색 종료 -->
		</div>
			<table class="table table-bordered" style="text-align:center">
				
				<thead>
				
					<tr>
						<th style="width: 10%; background-color: #eeeeee; text-align: center;">글번호</th>
						<th style="width: 75%; background-color: #eeeeee; text-align: center;">제목</th>
						<th style="width: 15%; background-color: #eeeeee; text-align: center;">작성자</th>
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
			<a href="/Service/Qnawrite" class="btn btn-primary pull-Right">글쓰기</a>
		</div>
		</div>
			
					<div class="btnBox"  style="text-align: center;">
		<div id="pgCnt" class="btn-group">
		<c:if test="${paging.startPage != 1 }">
			<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<button type="button" class="btn btn-primary" style="color:#f00;">${p }</button>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<button type="button" class="btn btn-primary" onClick="pageFnc(${p })">${p }</button>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.endPage+1})">&gt;</button>
		</c:if>
		</div>
  </div>
  <br>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>