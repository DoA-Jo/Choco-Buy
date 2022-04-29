<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- STYLE SHEET -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/User.css">
<title>로그인 | 초코바이</title>
<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/UserLogin.js"></script>
<script>
window.onpageshow = function(event) {
    if ( event.persisted ) {
		//뒤로가기
		$(".user_input").val("");
    } else {
		//앞으로가기
		let addr = location.href;
		if(addr.indexOf('/login') >= 0){
			$(".user_input").val("");
		}else if("${UserInfo}" == null){
			$(".user_input").val("");
		}else {
			$(".user_input").val("");
		}
    }
}
</script>
</head>
<body>
<div class="login_inner inner">
	<h1 class="title">chocobuy</h1>
	<div class="content login_content">
		<form id="login_tel" name="login_tel">
			<div class="desc"> 
				<h2>로그인을 위해 <br>휴대폰번호를 인증해주세요.</h2>
			</div>
			<div class="val_area clearfix">
				<input type="text" id="phone" class="tel_input user_input" name="user_tel" title="전화번호 입력" required/> 
				<button type="button" id="phoneChk" class="doubleChk val_btn input_btn">인증번호 보내기</button>
			</div>
			<div class="val_area clearfix"> 
				<input type="text" id="phone2" class="tel_input user_input" name="phone2" title="인증번호 입력" disabled required/> 
				<button type="button" id="phoneChk2" class="doubleChk val_btn input_btn" disabled>인증하기</button>
			</div> 
			<div>
				<span class="point successPhoneChk"></span> 
				<input type="hidden" id="phoneDoubleChk"/> 
			</div>
			<div class="login_btn_area">
				<button type="button" class="login_next_btn next_btn" disabled>로그인</button> 
			</div>		
		</form>
		<div class="join_btn_area">
			<span>아직 회원이 아니신가요?</span> <a href="/Join/joinAgree" class="join_btn">회원가입</a>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/LJ_footer.jsp"  %>
</body>
</html>