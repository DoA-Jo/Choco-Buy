<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/serviceBoard.css">
<style>
/* .qnaPage {width: 1200px; margin : 0 auto;} */


/* menuBar */
.serviceBar {margin-left :140px; display : flex; position : relative;} 
.serviceBar .serviceList{ position : absolute; left : 0px; } 

/* listcontainer */
.listContainer { display : flex; width: 1200px; margin : 0 auto; }
.listContainer .searchBox {   }
.listContainer .searchBox .searchTable{ }
.listContainer .searchBox .searchTable .searchSelect{ height: 30px; }
.listContainer .searchBox .searchTable .searchInput{ height: 30px; }
.listContainer .searchBox .searchTable .searchSubmit{ height: 30px; }
/* service table */
.serviceTable { margin : 10px auto; width: 900px; }
.serviceTable thead { background-color: #eee;  text-align: center;}
.serviceTable thead .th01{width: 100px; } 
.serviceTable thead .th02{width: 450px; } 
.serviceTable thead .th03{width: 100px; } 
.serviceTable thead .th04{width: 150px; } 
.serviceTable thead .th05{width: 100px; } 


</style>
<title>초코바이 고객센터</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 

	<h1 align="center">초코바이 고객센터</h1>

<div class="qnaPage"  >
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
			<form action="/Service/getServiceList" name="fm" method="post">
				<div class="searchTable">

						<select class="searchSelect" name="service_serachCondition"	>
						<c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key}</option>
						</c:forEach>
						</select>
						<input type="hidden" name="nowPage">
						<input class="searchInput" name="service_searchKeyword" type="text" placeholder="검색어를 입력해주세요."/>
						<input class="btn btn-outline-primary searchSubmit" type="submit" value="검색" />

				</div>
			</form>
			<!-- 검색 종료 -->
		</div>
		<table class="table table-bordered serviceTable" style="text-align:center">
			<thead>
				<tr>
					<th class="th01">글번호</th>
					<th class="th02">제목</th>
					<th class="th03">작성자</th>
					<th class="th04">날짜</th>
					<th class="th05">조회수</th>
				</tr>
			</thead>
			<c:forEach items="${serviceList }" var="service">
			<tr>
				<td>${service.service_seq }</td>
				<td><a href="/Service/getService?service_seq=${service.service_seq }">${service.service_title }</a></td>
				<td>${service.service_writer }</td>
				<td>${service.service_date }</td>
				<td>${service.service_cnt }</td>
			</tr>
			</c:forEach>
			<tbody>
				
			</tbody>
		</table>
		<div style="text-align: right;">
			<a href="/Service/Servicewrite" class="btn btn-primary pull-Right">글쓰기</a>
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
			<button type="button" class="btn btn-primary " onClick="pageFnc(${paging.endPage+1})">&gt;</button>
		</c:if>
		</div>
  </div>
  <br>
	</div>
</div>
<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "/Service/ServiceController";
	frm.method = "post";
	frm.submit();	
}
</script>
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>