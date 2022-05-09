<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/template/head.jsp" %>   
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/mypage.css">
<title>글 목록</title>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<div class="container">
	<div class="warp myTrade_wrap">
		<h1>거래내역 보기</h1>
<%-- 	<h2>${UserInfo}</h2> --%>
		<div class="search">
			<form action="getMypageTradeSerch" name="fm" method="post">
		  		<select class="search2" name="searchMypageCondition">
					<c:forEach items="${searchMypageConditionMap}" var="option">
						<option value="${option.value}"<c:if test="${tradeVO.searchMypageCondition eq option.value}">selected</c:if>>${option.key}</option>
					</c:forEach>
		    	</select>
    			<input class="search2" id="inpbox" type="text" name="searchMypageKeyword" value="${tradeVO.searchMypageKeyword}" placeholder="검색어를 입력하세요.">
				<input  type="hidden" name="nowPage">
    			<button class="btn btn-success" type="button" onclick="pageFnc('0')">검색</button>
	  		</form>
  		</div>
		<table class="table table-hover">
	    	<thead class="btn-primary">
	      		<tr>
	        		<th>제목</th>
	        		<th>작성자</th>
	        		<th>등록일</th>
	        		<th>거래상대</th>
	       			<th>리뷰</th>
	        		<th>리뷰작성</th>
	      		</tr>
	   		</thead>
	    	<tbody>
				<c:forEach items="${tradeList}" var="trade">
					<tr >
		 				<td>${trade.trade_title}</td>
		 				<td>${trade.trade_nick}</td>
		  				<td>${trade.trade_date}</td>
		  				<td>${trade.trade_buyinfo}</td>
		  				<td>${trade.trade_review}</td>
		  				<td><input class="btn btn-success" type="button" onclick="location.href='getMypageTrade?trade_seq=${trade.trade_seq}'" value="리뷰작성"></td>
		  			</tr>
				</c:forEach>
	    	</tbody>
	  	</table>
		<button class="btn btn-outline-secondary" id="backbtn" type="button" onClick="location.href='getMypageUser'" >마이페이지 메인</button>
		<div id="btnBox">	
			<div id="pgCnt" >
				<c:if test="${paging.startPage != 1 }">
					<button class="pgbtn" type="button"  onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
						</c:if>
							<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
								<c:choose>
									<c:when test="${p == paging.nowPage }">
										<button class="pgbtn" type="button">${p }</button>
									</c:when>
									<c:when test="${p != paging.nowPage }">
										<button class="pgbtn" type="button" onClick="pageFnc(${p })">${p }</button>
									</c:when>
								</c:choose>
							</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
					<button type="button" onClick="pageFnc(${paging.endPage+1})">&gt;</button>
				</c:if>
			</div>
	  	</div>
	 </div>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>
<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "/Mypage/getMypageTradeSerch";
	frm.method = "post";
	frm.submit();	
}
</script>

</body>
</html>