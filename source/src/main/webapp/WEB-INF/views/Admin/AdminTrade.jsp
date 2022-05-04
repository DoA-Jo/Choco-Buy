<%@page import="com.chocobuy.biz.admin.AdminTradeVO"%>
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
<script>
	function checkAll() {
		if ($("input:checkbox[id='all_select']").prop("checked")) {
			$("input:checkbox[name='tradeCheckBox']").prop("checked", true);
		} else {
			$("input:checkbox[name='tradeCheckBox']").prop("checked", false);
		}
	};

	function hideTrade(){
		var cnt=$("input[name='tradeCheckBox']:checked").length;
		var arr=new Array();
		$("input[name='tradeCheckBox']:checked").each(function() {
			arr.push($(this).attr('id'));
		});
		if(cnt==0){
			alert("선택된 글이 없습니다.");
		} else {
			$.ajax({
				type: "POST",
				url: "/Admin/hideTrade",
				data: {array: arr},
				dataType: "json",
				success: function(jdata) {
					if(jdata==1) {
						console.log("숨김 처리 완료");
					}
				},
				error: function(){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		setTimeout(() => {
			window.location.href='/Admin/adminTrade'
		}, 500);
	}
	function showTrade(){
		var cnt=$("input[name='tradeCheckBox']:checked").length;
		var arr=new Array();
		$("input[name='tradeCheckBox']:checked").each(function() {
			arr.push($(this).attr('id'));
		});
		if(cnt==0){
			alert("선택된 글이 없습니다.");
		} else {
			$.ajax({
				type: "POST",
				url: "/Admin/showTrade",
				data: {array: arr},
				dataType: "json",
				success: function(jdata) {
					if(jdata==1) {
						console.log("보임 처리 완료");
					}
				},
				error: function(){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		setTimeout(() => {
			window.location.href='/Admin/adminTrade'
		}, 500);
	}
</script>
<title>게시글 관리</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	<%
		int num=1;
	%>
	<div class="container-fluid">
		<nav class="admin-search-bar">
			<form name="fm" action="/Admin/adminTrade" method="post">
				<div><strong>카테고리</strong></div>
				<div class="checkbox-condition">
					<label>
						<input type="checkbox" name="category1" value=1  <%if((String)request.getParameter("category1")!=null) out.print("checked"); %>>
						<span>배달</span>
					</label>
					<label>
						<input type="checkbox" name="category2" value=1  <%if((String)request.getParameter("category2")!=null) out.print("checked"); %>>
						<span>쇼핑</span>
					</label>
					<label>
						<input type="checkbox" name="category3" value=1  <%if((String)request.getParameter("category3")!=null) out.print("checked"); %>>
						<span>청소</span>
					</label>
					<label>
						<input type="checkbox" name="category4" value=1  <%if((String)request.getParameter("category4")!=null) out.print("checked"); %>>
						<span>집안일</span>
					</label>
					<label>
						<input type="checkbox" name="category5" value=1  <%if((String)request.getParameter("category5")!=null) out.print("checked"); %>>
						<span>전문서비스</span>
					</label>
					<label>
						<input type="checkbox" name="category6" value=1  <%if((String)request.getParameter("category6")!=null) out.print("checked"); %>>
						<span>반려동물</span>
					</label>
					<label>
						<input type="checkbox" name="category7" value=1  <%if((String)request.getParameter("category7")!=null) out.print("checked"); %>>
						<span>역할대행</span>
					</label>
				</div>
				<div><strong>신고 여부</strong></div>
					<label>
						<input type="checkbox" name="report1" value=1  <%if((String)request.getParameter("report1")!=null) out.print("checked"); %>>
						<span>정상</span>
					</label>
					<label>
						<input type="checkbox" name="report2" value=1  <%if((String)request.getParameter("report2")!=null) out.print("checked"); %>>
						<span>신고됨</span>
					</label>
				<div><strong>숨김 여부</strong></div>
					<label>
						<input type="checkbox" name="hidden1" value=1  <%if((String)request.getParameter("hidden1")!=null) out.print("checked"); %>>
						<span>보임</span>
					</label>
					<label>
						<input type="checkbox" name="hidden2" value=1  <%if((String)request.getParameter("hidden2")!=null) out.print("checked"); %>>
						<span>숨김</span>
					</label>
				<div class="search text-center">
					<p>총 ${paging.total }건의 검색 결과</p>
					<input type="text" name="searchKeyword" value="" placeholder="검색어를 입력하세요">
					<button class="btn btn-success" onclick="pageFnc('0')">검색</button>
				</div>
				<input type="hidden" name="nowPage">
			</form>
		</nav>
		
		<div class="buttons">
			<button class="btn btn-success" onclick="hideTrade()">숨김 처리</button>
			<button class="btn btn-success" onclick="showTrade()">보임 처리</button>
		</div>
		
		<div class="list">
			<table class="table-bordered">
				<thead>
					<tr>
						<th><input type="checkbox" id="all_select" onclick="checkAll()"></th>
						<th>번호</th>
						<th>글 번호</th>
						<th>카테고리</th>
						<th>글 제목</th>
						<th>글 내용</th>
						<th>날짜</th>
						<th>글쓴이</th>
						<th>금액</th>
						<th>위치</th>
						<th>이미지</th>
						<th>구매자</th>
						<th>리뷰</th>
						<th>신고 여부</th>
						<th>숨김 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminTradeList }" var="trade">
						<tr>
							<td><input type="checkbox" name="tradeCheckBox" id="${trade.trade_seq }"></td>
							<td><%out.print(num++); %></td>
							<td>${trade.trade_seq }</td>
							<td>${trade.trade_category }</td>
							<td><div class="one-line"><a target="_blank" href="/Trade/getTrade?trade_seq=${trade.trade_seq }">${trade.trade_title }</a></div></td>
							<td><div class="one-line">${trade.trade_content }</div></td>
							<td>${trade.trade_date }</td>
							<td>${trade.trade_nick }</td>
							<td>${trade.trade_money }</td>
							<td>${trade.trade_area }</td>
							<td>${trade.trade_img }</td>
							<td>${trade.trade_buyinfo }</td>
							<td>${trade.trade_review }</td>
							<td>
								<c:if test="${trade.trade_reporting == 0}">정상</c:if>
								<c:if test="${trade.trade_reporting == 1}">신고됨</c:if>
							</td>
							<td>
								<c:if test="${trade.trade_hidden == 0}">보임</c:if>
								<c:if test="${trade.trade_hidden == 1}">숨김</c:if>
							</td>
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
	frm.action = "/Admin/adminTrade";
	frm.method = "post";
	frm.submit();
}
</script>
	
</body>
</html>