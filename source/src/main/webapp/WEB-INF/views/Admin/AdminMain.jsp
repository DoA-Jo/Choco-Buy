<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/admin.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>회원 관리</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	<%int num=1; %>
	
	<div class="container-fluid">
		<nav class="admin-search-bar">
			<form name="fm" action="/Admin/adminMain" method="post">
				<div><strong>회원 상태</strong></div>
				<div class="checkbox-condition">
					<label>
						<input type="checkbox" name="role100" value=1 <%if((String)request.getParameter("role100")!=null) out.print("checked"); %>>
						<span>관리자</span>
					</label>
					<label>
						<input type="checkbox" name="role0" value=1 <%if((String)request.getParameter("role0")!=null) out.print("checked"); %>>
						<span>정상 회원</span>
					</label>
					<label>
						<input type="checkbox" name="role1" value=1 <%if((String)request.getParameter("role1")!=null) out.print("checked"); %>>
						<span>정지 회원</span>
					</label>
					<label>
						<input type="checkbox" name="role2" value=1 <%if((String)request.getParameter("role2")!=null) out.print("checked"); %>>
						<span>탈퇴 회원</span>
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
			<button class="btn btn-success open" onclick="location.href='/Admin/adminInsertUser'">사용자 추가</button>
		</div>
		
		<div class="list">
			<table class="table-bordered">
				<thead>
					<tr>
						<th><input type="checkbox" id="all_select" ></th>
						<th>번호</th>
						<th>uuid</th>
						<th>전화번호</th>
						<th>닉네임</th>
						<th>주소</th>
						<th>프로필 이미지</th>
						<th>역할</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminUserList }" var="user">
						<tr>
							<td><input type="checkbox"></td>
							<td><%out.print(num++); %></td>
							<td><a href="/Admin/adminGetUser?user_uuid=${user.user_uuid }">${user.user_uuid }</a></td>
							<td>${user.user_tel }</td>
							<td>${user.user_nick }</td>
							<td>${user.user_siNm } ${user.user_sggNm } ${user.user_emdNm }</td>
							<td>${user.user_profileImg }</td>
							<td>
								<p class="role">
									<c:if test="${user.user_role == 0}">정상유저</c:if> 
									<c:if test="${user.user_role == 1}">정지유저</c:if>
									<c:if test="${user.user_role == 2}">탈퇴유저</c:if>
									<c:if test="${user.user_role == 100}">관리자</c:if>
								</p>
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
	frm.action = "/Admin/adminMain";
	frm.method = "post";
	frm.submit();	
}
</script>
		
</body>
</html>