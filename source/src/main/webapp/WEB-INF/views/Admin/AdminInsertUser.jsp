<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<style>
	.addUser {
		clear: both;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="AdminHeader.jsp"%>
	
	
	<div class="addUser container">
		<form action="/Admin/adminInsertUser" method="POST" id="add_user">
			<div>
				<label for="tel">전화번호</label>
				<input id="tel" type="text" name="user_tel" title="전화번호" required> 
			</div>			
			<div>
				<label for="tel">닉네임</label>
				<input id="tel" type="text" name="user_nick" title="닉네임" required> 			
			</div>				
			<div>
				<label for="tel">시도</label>
				<input id="tel" type="text" name="user_siNm" title="시도" required> 
			</div>		
			<div>
				<label for="tel">구군</label>
				<input id="tel" type="text" name="user_sggNm" title="구군" required>
			</div>		
			<div>
				<label for="tel">동</label>
				<input id="tel" type="text" name="user_emdNm" title="동" required>
			</div>				 
			<div>
				<label for="tel">프로필 이미지</label>
				<input id="tel" type="text" name="user_profileImg" title="프로필 이미지" required>
			</div>
			<div>
				<label for="add_select">역할</label>
				<select name="user_role" id="role" form="add_user" id="add_select">
					<option value="0">활동 유저</option>
					<option value="1">정지 유저</option>
					<option value="2">탈퇴 유저</option>
					<option value="100">관리자</option>
				</select>
			</div>
			<div>
				<input type="submit" value="등록">
				<input type="reset" value="취소">
			</div>
		</form>
	</div>
  
	
</body>
</html>