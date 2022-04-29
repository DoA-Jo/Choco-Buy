<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Ddiv HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.ddiv">
<html>
<head>
<meta charset="UTF-8">
<!-- STYLE SHEET -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/User.css">
<title>회원가입 | 초코바이</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/UserJoin.js"></script>
<script>
function init(){
	if('${inputYn}'=='Y'){
		$('.area_next_btn').removeAttr('disabled');
	}
	document.querySelector('.progress_container > #sixty').setAttribute('checked',true);
}
</script>
</head>
<body onload="init()">
<div class="area_inner inner">
	<h1 class="title">chocobuy</h1>
	<div class="content area_content">
		<!-- progress bar -->
		<%@ include file="/WEB-INF/views/template/ProgressBar.jsp"  %>
		<!-- progress bar -->
		<div class="desc area_desc"> 
			<h2>주소를 인증해주세요.</h2>
		</div>
		<form name="form2" method="post">
			<input type="hidden" id="confmKey" name="confmKey" value=""/>
			<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
			<input type="hidden" id="resultType" name="resultType" value=""/>
		</form>
		
		<form id="form" name="form" > 

			<div id="list"></div>
			<div id="callBackDiv">
				<div>
					<input type="text" id="user_siNm" class="area_input" name="user_siNm" value="${siNm }" disabled />
					<input type="text" id="user_sggNm" class="area_input" name="user_sggNm" value="${sggNm }" disabled />
					<input type="text" id="user_emdNm" class="area_input" name="user_emdNm" value="${emdNm }" disabled />
					<input type="button" class="auth_btn" onClick="goPopup();" value="인증하기"/>
				</div>
				<div class="next_btn_area">
					<button type="button" class="area_next_btn next_btn" disabled>다음</button>
				</div>
			</div>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/LJ_footer.jsp"  %>
</body>
<script>

</script>
</html>