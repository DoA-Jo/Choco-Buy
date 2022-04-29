<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>결제 관리</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	<%int num=1; %>
	<div class="container-fluid">
		<nav class="admin-search-bar">
			<form name="fm" action="/Admin/adminPay" method="post">
				<div class="search text-center">
					<p>총 ${paging.total }건의 검색 결과</p>
					<input type="text" name="searchKeyword" value="" placeholder="검색어를 입력하세요">
					<button class="btn btn-success" onclick="pageFnc('0')">검색</button>
				</div>
				<input type="hidden" name="nowPage">
			</form>
		</nav>
		
		<div class="buttons">
		</div>
		
		<div class="list">
			<table class="table-bordered">
				<thead>
					<tr>
						<th><input type="checkbox" id="all_select"></th>
						<th>번호</th>
						<th>글 번호</th>
						<th>주문 번호</th>
						<th>카테고리</th>
						<th>구매자</th>
						<th>판매자</th>
						<th>금액</th>
						<th>결제 날짜</th>
						<th>결제 수단</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminPayList }" var="pay">
						<tr>
							<td><input type="checkbox"></td>
							<td><%out.print(num++); %></td>
							<td>${pay.pay_num }</td>
							<td><a target="_blank" href="/Admin/getPay">${pay.pay_ordernum }</a></td>
							<td>${pay.pay_category }</td>
							<td>${pay.pay_buy }</td>
							<td>${pay.pay_sell }</td>
							<td>${pay.pay_amount }</td>
							<td>${pay.pay_date }</td>
							<td>${pay.pay_method }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		  <div id="btnBox"  style="text-align: center;">
	<div id="pgCnt" class="btn-group">
	<c:if test="${paging.startPage != 1 }">
		<button type="button" class="pageBtn btn btn-primary" onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<button type="button" class="btn btn-primary" style="color:#f00;">${p }</button>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<button type="button" class="pageBtn btn btn-primary" onClick="pageFnc(${p })">${p }</button>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<button type="button" class="pageBtn btn btn-primary" onClick="pageFnc(${paging.endPage+1})">&gt;</button>
	</c:if>
	</div>
  </div><br>
		
	</div>
<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "/Admin/adminPay";
	frm.method = "post";
	frm.submit();	
}
</script>
</body>
</html>