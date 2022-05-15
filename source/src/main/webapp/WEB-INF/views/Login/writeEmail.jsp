<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이메일 문의 | 초코바이</title>
<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- STYLE SHEET -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/User.css">
<!-- JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/UserLogin.js"></script>
</head>
<body>
<div class="email_inner inner">
	<h1 class="title"><a href="/index">chocobuy</a></h1>
	<div class="content email_content">
		<form name="send_email" id="send_email"> 
			<div class="desc"> 
				<h2>문의하기</h2>
				<p>답변받으실 <bold>이메일 주소</bold>와 <bold>휴대폰 번호</bold>를 <br>정확하게 기재해주세요.</p>
				<span>접수량에 따라 답변이 지연될 수 있으며,</span> <br>
				<span>신속히 답변될 수 있도록 최선을 다하겠습니다.<br> (평균 소요 기간: 1~3일)</span>
			</div>
			<div>
				<input type="hidden" name="senderName" class="senderName" value="user"><br>
				<input type="hidden" name="senderMail" class="senderMail" value="hello7hm@gmail.com"><br>
				<input type="hidden" name="receiveMail" class="receiveMail" value="hello7hm@gmail.com"><br>
				<span class="mail_sub_t">제목</span>
				<input name="subject" class="mail_sub" required><br>
				<span class="mail_message_t">내용</span>
				<textarea name="message" class="mail_message" required>
답변 받으실 이메일 주소:
휴대폰 번호:

문의 내용:
				</textarea>
				<br>
				<button type="button" class="send_email_btn next_btn">전송</button> 
			</div>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/LJ_footer.jsp"  %>
</body>
</html>