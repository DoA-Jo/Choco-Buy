<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 | 초코바이</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/User.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/UserJoin.js"></script>
<script>
window.onload=function(){
	document.querySelector('.progress_container > #eighty').setAttribute('checked',true);
}
</script>
</head>
<body>
<div class="nick_inner inner">
	<h1 class="title">chocobuy</h1>
	<div class="content nick_content">
		<!-- progress bar -->
		<%@ include file="/WEB-INF/views/template/ProgressBar.jsp"  %>
		<!-- progress bar -->
		<form id="join_nick" name="join_nick">
			<div class="desc nick_desc"> 
				<h2>사용할 별명을 입력하고<br>프로필 사진을 선택해주세요.</h2>
			</div>
			<div class="val_area">
				<div>
					<input type="hidden" name="user_uuid" value="${user1.user_uuid} ">
					<input type="text" id="user_nick" class="user_input nick_input" name="user_nick" placeholder="별명을 입력하세요" maxlength="16" title="8자 까지 입력" required/> 
					<button type="button" id="dup_btn" class="nick_dup_btn input_btn">중복확인</button>
					<span class="successNameChk">별명을 2자 이상 8자 이하로 설정해주시기 바랍니다.</span> 
					<input type="hidden" id="nameDoubleChk"/>
				</div>
			</div>
			<div class="pImg">
				<h2 class="pImg_title">프로필사진 선택</h2>
                <div class="pImg_select_area">
                    <div class="pImg_default" >
                    	<input type="text" class="pImg_name" name="user_profileImg" value="pImg01.svg" hidden/>
                    </div>
                    <div class="pImg_edit_btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
	                        <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
	                        <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
                        </svg>
                    </div>
                </div>
				<div class="pImg_box">
					<div class="pImg_list">
						<ul class="clearfix">
							<li><img id="pImg01.svg" name="pImg01.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg01.svg"></li>
							<li><img id="pImg02.svg" name="pImg02.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg02.svg"></li>
							<li><img id="pImg03.svg" name="pImg03.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg03.svg"></li>
							<li><img id="pImg04.svg" name="pImg04.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg04.svg"></li>
							<li><img id="pImg05.svg" name="pImg05.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg05.svg"></li>
                        </ul>
                        <ul class="clearfix">
                            <li><img id="pImg06.svg" name="pImg06.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg06.svg"></li>
							<li><img id="pImg07.svg" name="pImg07.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg07.svg"></li>
							<li><img id="pImg08.svg" name="pImg08.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg08.svg"></li>
							<li><img id="pImg09.svg" name="pImg09.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg09.svg"></li>
							<li><img id="pImg10.svg" name="pImg10.svg" src="${pageContext.request.contextPath}/resources/img/profileImg/pImg10.svg"></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="next_btn_area">
				<button type="button" class="nick_next_btn next_btn" disabled>다음</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/LJ_footer.jsp"  %>
</body>
</html>