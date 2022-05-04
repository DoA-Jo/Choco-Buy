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
			$("input:checkbox[name='serviceCheckBox']").prop("checked", true);
		} else {
			$("input:checkbox[name='serviceCheckBox']").prop("checked", false);
		}
	};

	function hideService(){
		var cnt=$("input[name='serviceCheckBox']:checked").length;
		var arr=new Array();
		$("input[name='serviceCheckBox']:checked").each(function() {
			arr.push($(this).attr('id'));
		});
		if(cnt==0){
			alert("선택된 글이 없습니다.");
		} else {
			$.ajax({
				type: "POST",
				url: "/Admin/hideService",
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
			window.location.href='/Admin/adminService'
		}, 500);
	}
	
	function showService(){
		var cnt=$("input[name='serviceCheckBox']:checked").length;
		var arr=new Array();
		$("input[name='serviceCheckBox']:checked").each(function() {
			arr.push($(this).attr('id'));
		});
		if(cnt==0){
			alert("선택된 글이 없습니다.");
		} else {
			$.ajax({
				type: "POST",
				url: "/Admin/showService",
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
			window.location.href='/Admin/adminService'
		}, 500);
	}
</script>
<title>고객센터 관리</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	<%int num=1; %>
	<div class="container-fluid">
		<nav class="admin-search-bar">
			<form name="fm" action="/Admin/adminService" method="post">
				<div><strong>말머리</strong></div>
				<div class="checkbox-condition">
					<label>
						<input type="checkbox" name="notice" value=1 <%if((String)request.getParameter("notice")!=null) out.print("checked"); %>>
						<span>공지 사항</span>
					</label>
					<label>
						<input type="checkbox" name="faq" value=1 <%if((String)request.getParameter("faq")!=null) out.print("checked"); %>>
						<span>자주 묻는 질문</span>
					</label>
				</div>
				<div class="search text-center">
					<p>총 ${paging.total }건의 검색 결과</p>
					<input type="text" name="searchKeyword" value="" placeholder="검색어를 입력하세요">
					<button class="btn btn-success" onclick="pageFnc('0')">검색</button>
				</div>
				<input type="hidden" name="nowPage">
			</form>
		</nav>
		
		<div class="buttons">
			<button class="btn btn-success" onclick="window.open('/Service/ServiceWrite')">글쓰기</button>
			<button class="btn btn-success" onclick="hideService()">숨김 처리</button>
			<button class="btn btn-success" onclick="showService()">보임 처리</button>
		</div>
		
		<div class="list">
			<table class="table-bordered">
				<thead>
					<tr>
						<th><input type="checkbox" id="all_select" onclick="checkAll()"></th>
						<th>번호</th>
						<th>글 번호</th>
						<th>말머리</th>
						<th>제목</th>
						<th>내용</th>
						<th>날짜</th>
						<th>조회수</th>
						<th>숨김 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminServiceList }" var="service">
						<tr>
							<td><input type="checkbox" name="serviceCheckBox" id="${service.service_seq }"></td>
							<td><%out.print(num++); %></td>
							<td>${service.service_seq }</td>
							<td>
									<c:if test="${service.service_header == 1}">공지사항</c:if>
									<c:if test="${user.service_header == 2}">자주 묻는 질문</c:if>
							</td>
							<td class="one-line"><a target="_blank" href="/Service/getService?service_seq=${service.service_seq }">${service.service_title }</a></td>
							<td class="one-line">${service.service_content }</td>
							<td>${service.service_date }</td>
							<td>${service.service_cnt }</td>
							<td>
								<c:if test="${service.service_hidden == 0}">보임</c:if>
								<c:if test="${service.service_hidden == 1}">숨김</c:if>
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
	frm.action = "/Admin/adminService";
	frm.method = "post";
	frm.submit();	
}
</script>	

</body>
</html>