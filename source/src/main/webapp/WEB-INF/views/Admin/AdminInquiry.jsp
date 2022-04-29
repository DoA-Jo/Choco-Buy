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
			$("input:checkbox[name='inqCheckBox']").prop("checked", true);
		} else {
			$("input:checkbox[name='inqCheckBox']").prop("checked", false);
		}
	};

	function hideInquiry(){
		var cnt=$("input[name='inqCheckBox']:checked").length;
		var arr=new Array();
		$("input[name='inqCheckBox']:checked").each(function() {
			arr.push($(this).attr('id'));
		});
		if(cnt==0){
			alert("선택된 글이 없습니다.");
		} else {
			$.ajax({
				type: "POST",
				url: "/Admin/hideInquiry",
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
			window.location.href='/Admin/adminInquiry';
		}, 500);
	}
	function showInquiry(){
		var cnt=$("input[name='inqCheckBox']:checked").length;
		var arr=new Array();
		$("input[name='inqCheckBox']:checked").each(function() {
			arr.push($(this).attr('id'));
		});
		if(cnt==0){
			alert("선택된 글이 없습니다.");
		} else {
			$.ajax({
				type: "POST",
				url: "/Admin/showInquiry",
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
			window.location.href='/Admin/adminInquiry';
		}, 500);
	}
	function doneInquiry(){
		var cnt=$("input[name='inqCheckBox']:checked").length;
		var arr=new Array();
		$("input[name='inqCheckBox']:checked").each(function() {
			arr.push($(this).attr('id'));
		});
		if(cnt==0){
			alert("선택된 글이 없습니다.");
		} else {
			$.ajax({
				type: "POST",
				url: "/Admin/doneInquiry",
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
			window.location.href='/Admin/adminInquiry';
		}, 500);
	}
	function undoneInquiry(){
		var cnt=$("input[name='inqCheckBox']:checked").length;
		var arr=new Array();
		$("input[name='inqCheckBox']:checked").each(function() {
			arr.push($(this).attr('id'));
		});
		if(cnt==0){
			alert("선택된 글이 없습니다.");
		} else {
			$.ajax({
				type: "POST",
				url: "/Admin/undoneInquiry",
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
			window.location.href='/Admin/adminInquiry';
		}, 500);
	}
</script>
<title>1대1문의 관리</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	<%int num=1; %>
	<div class="container-fluid">
		<nav class="admin-search-bar">
			<form name="fm" action="/Admin/adminInquiry" method="post">
				<div><strong>문의 상태</strong></div>
				<div class="checkbox-condition">
					<label>
						<input type="checkbox" name="done0" value="1" <%if((String)request.getParameter("done0")!=null) out.print("checked"); %>>
						<span>미완료</span>
					</label>
					<label>
						<input type="checkbox" name="done1" value="1" <%if((String)request.getParameter("done1")!=null) out.print("checked"); %>>
						<span>완료</span>
					</label>
				</div>
				<div><strong>숨김 여부</strong></div>
				<div class="checkbox-condition">
					<label>
						<input type="checkbox" name="display0" value="1" <%if((String)request.getParameter("display0")!=null) out.print("checked"); %>>
						<span>보임</span>
					</label>
					<label>
						<input type="checkbox" name="display1" value="1" <%if((String)request.getParameter("display1")!=null) out.print("checked"); %>>
						<span>숨김</span>
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
			<button class="btn btn-primary delete-button" onclick="hideInquiry()">숨김</button>
			<button class="btn btn-primary delete-button" onclick="showInquiry()">보임</button>
			<button class="btn btn-primary done-button" onclick="doneInquiry()">완료 처리</button>
			<button class="btn btn-primary done-button" onclick="undoneInquiry()">미완료 처리</button>
		</div>
		
		<div class="list">
			<table class="table-bordered">
				<thead>
					<tr>
						<th><input type="checkbox" id="all_select" onclick="checkAll()"></th>
						<th>번호</th>
						<th>글 번호</th>
						<th>글쓴이</th>
						<th>제목</th>
						<th>내용</th>
						<th>날짜</th>
						<th>첨부 파일</th>
						<th>답변 상태</th>
						<th>숨김 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminInquiryList }" var="inq">
						<tr>
							<td><input type="checkbox" name="inqCheckBox" id="${inq.inq_num }"></td>
							<td><%out.print(num++); %></td>
							<td>${inq.inq_num }</td>
							<td>${inq.inq_nickname }</td>
							<td><a target="_blank" href="/Inquiry/getInq?inq_num=${inq.inq_num }">${inq.inq_title }</a></td>
							<td>${inq.inq_content }</td>
							<td>${inq.inq_date }</td>
							<td>${inq.inq_filename }</td>
							<td>
								<c:if test="${inq.inq_completeCK == 0}">미완료</c:if>
								<c:if test="${inq.inq_completeCK == 1}">완료</c:if>
							</td>
							<td>
								<c:if test="${inq.inq_hiddenCK == 0}">보임</c:if>
								<c:if test="${inq.inq_hiddenCK == 1}">숨김</c:if>
							</td>
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
</body>

<script>
function pageFnc(np){
	let frm = document.fm;
	frm.nowPage.value = np;
	frm.action = "/Admin/adminInquiry";
	frm.method = "post";
	frm.submit();	
}
</script>

</html>