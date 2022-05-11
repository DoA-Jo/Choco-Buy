<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- delete CACHE -->
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<!-- STYLE SHEET -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/User.css">
<title>회원가입 | 초코바이</title>
<!-- JQUERY -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/UserJoin.js"></script>
<script>
window.onload=function(){
	document.querySelector('.progress_container > #onehundred').setAttribute('checked',true);
};
window.onpageshow=function(event){
	if(event.persisted || (window.performance&&window.performance.navigation.type==2))	{
		document.join_done.action='/Join/joinFail';
		document.join_done.method='post';
		document.join_done.submit();
	}

};
</script>
</head>
<body>
<div class="done_inner inner">
	<h1 class="title">chocobuy</h1>
	<div class="content done_content">
		<div class="done_done">
			<!-- progress bar -->
			<%@ include file="/WEB-INF/views/template/ProgressBar.jsp"  %>
			<!-- progress bar -->
			<span class="done_welcome">WELCOME TO CHOCOBUY!</span>
		</div>
		<form id="join_done" name="join_done">
			<div class="desc done_desc"> 
				<div class="textcontainer">
   					<h2 class="particletext confetti">회원가입이 <br>완료되었습니다!</h2>
				</div>
				<span>로그인 후에 초코바이의 모든 서비스를 이용해보세요</span>
			</div>
			<div class="next_btn_area">
				<button type="button" class="done_next_btn next_btn">로그인하기</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/LJ_footer.jsp"  %>
</body>
<script>
$(document).ready(function(){
	
	
function initparticles() {
	confetti();
}

function confetti() {
   $.each($(".particletext.confetti"), function(){
      var confetticount = ($(this).width()/50)*10;
      for(var i = 0; i <= confetticount; i++) {
         $(this).append('<span class="particle c' + $.rnd(1,2) + '" style="top:' + $.rnd(10,50) + '%; left:' + $.rnd(0,100) + '%;width:' + $.rnd(6,8) + 'px; height:' + $.rnd(3,4) + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
      }
   });
}

jQuery.rnd = function(m,n) {
    m = parseInt(m);
    n = parseInt(n);
    return Math.floor( Math.random() * (n - m + 1) ) + m;
}

initparticles();


})

</script>
</html>