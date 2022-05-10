<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- STYLE SHEET -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/User.css">
<title>회원가입 | 초코바이</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/UserJoin.js"></script>
<script>
window.onload=function(){
	document.querySelector('.progress_container > #forty').setAttribute('checked',true);
}
window.onpageshow=function(event){
	if(event.persisted || (window.performance&&window.performance.navigation.type==2))	{
		alert("from jointel");
		document.join_tel.action='/Join/joinFail';
		document.join_tel.method='post';
		document.join_tel.submit();
	}

};
</script>
</head>
<body>
<div class="tel_inner inner">
	<h1 class="title">chocobuy</h1>
	<div class="content tel_content">
		<!-- progress bar -->
		<%@ include file="/WEB-INF/views/template/ProgressBar.jsp"  %>
		<!-- progress bar -->
		<form id="join_tel" name="join_tel">
			<div class="desc tel_desc"> 
				<h2>휴대폰 번호를 입력하세요</h2>
			</div>
			<div class="val_area clearfix">
				<input type="text" id="phone" class="tel_input user_input" name="user_tel" title="전화번호 입력" autofocus required/> 
				<button type="button" id="phoneChk" class="doubleChk val_btn input_btn">인증번호 보내기</button>
			</div>
			<div class="val_area clearfix"> 
				<input type="text" id="phone2" class="tel_input user_input" name="phone2" title="인증번호 입력" disabled required/> 
				<button type="button" id="phoneChk2" class="doubleChk val_btn input_btn" disabled>본인인증</button>
			</div> 
			<div>
				<span class="point successPhoneChk"></span> 
				<input type="hidden" id="phoneDoubleChk"/> 
			</div>
			<div class="next_btn_area">
				<button type="button" class="tel_next_btn next_btn" disabled>다음</button> 
			</div>		
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/LJ_footer.jsp"  %>
</body>
</html>