<%@page import="com.chocobuy.biz.admin.AdminUserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	form>div {
		display: block;
	}
	.container-fluid {
		clear: both;
	}
	.buttons {
		display: flex;
		justify-content: center;
	}
</style>
<title>회원 정보</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	
	<%
		AdminUserVO vo = (AdminUserVO)request.getAttribute("adminUser");
	%>
	<div class="container-fluid">
		<div class="user-spec">
			<form class="user-spec" action="/Admin/adminUpdateUser" method="POST" id="update_user">
				<div>
					<label for="uuid">UUID</label>
					<input type="text" id="uuid" name="user_uuid" value="<%=vo.getUser_uuid() %>" title="고유 uuid">
				</div>
				<div>
					<label for="tel">전화 번호</label>
					<input type="text" id="tel" name="user_tel" value="<%=vo.getUser_tel() %>" title="전화 번호">
				</div>
				<div>
					<label for="nick">닉네임</label>
					<input type="text" id="nick" name="user_nick" value="<%=vo.getUser_nick() %>" title="닉네임">
				</div>
				<div>
					<label for="siNm">시도</label>
					<input type="text" id="siNm" name="user_siNm" value="<%=vo.getUser_siNm() %>" title="시도">
				</div>
				<div>
					<label for="sggNm">군구</label>
					<input type="text" id="sggNm" name="user_sggNm" value="<%=vo.getUser_sggNm() %>" title="군구">
				</div>
				<div>
					<label for="emdNm">동</label>
					<input type="text" id="emdNm" name="user_emdNm" value="<%=vo.getUser_emdNm() %>" title="동">
				</div>
				<div>
					<label for="profileImg">프로필 이미지</label>
					<input type="text" id="profileImg" name="user_profileImg" value="<%=vo.getUser_profileImg() %>" title="프로필 이미지">
				</div>
				<div>
					<label for="role">역할</label>
					<select name="user_role" id="role" form="update_user">
						<option value="0" <%if (vo.getUser_role()==0) out.print("selected"); %> >활동 유저</option>
						<option value="1" <%if (vo.getUser_role()==1) out.print("selected"); %>>정지 유저</option>
						<option value="2" <%if (vo.getUser_role()==2) out.print("selected"); %>>탈퇴 유저</option>
						<option value="100" <%if (vo.getUser_role()==100) out.print("selected"); %>>관리자</option>
					</select>
					
				</div>
				<div class="buttons">
					<input type="submit" value="변경">
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>