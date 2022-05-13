<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
			<input type="text" name="merchant_uid" id="merchant_uid" size="30" value="" placeholder="주문번호를 입력하세요">
			<button id="cancel_module" class="btn btn-danger">결제취소</button><span>&nbsp;&nbsp;※ 결제취소는 꼭 문의글 확인 후 신중하게 진행하세요!</span>
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
						<th>결제상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminPayList }" var="pay">
						<tr>
							<td><input type="checkbox"></td>
							<td><%out.print(num++); %></td>
							<td>${pay.pay_num }</td>
							<td>${pay.pay_ordernum }</td>
							<td>${pay.pay_category }</td>
							<td>${pay.pay_buy }</td>
							<td>${pay.pay_sell }</td>
							<td>${pay.pay_amount }</td>
							<td>${pay.pay_date }</td>
							<td>${pay.pay_method }</td>
							<td>${pay.pay_stat }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		  <div id="btnBox"  style="text-align: center;">
	<div id="pgCnt" class="btn-group">
	<c:if test="${paging.startPage != 1 }">
		<button type="button" class="pageBtn btn btn-success" onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<button type="button" class="btn btn-success" style="color:#fff;">${p }</button>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<button type="button" class="pageBtn btn btn-success" onClick="pageFnc(${p })">${p }</button>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<button type="button" class="pageBtn btn btn-success" onClick="pageFnc(${paging.endPage+1})">&gt;</button>
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

IMP.init('imp76820413');	
$("#cancel_module").click(function () {
	$.ajax({
		url : "/Pay/cancle",
		data : {"mid": $("#merchant_uid").val()},
		method : "POST",
		success : function(val){
			console.log(val);
			if(val==1){
				alert("결제취소 완료");
				location.href='/Pay/deletePay';
			}
			else{
				alert("결제취소 실패");
			}
		},
		error :  function(request, status){
			alert("취소가 실패하였습니다.");
		}
	});
});
</script>
</body>
</html>