<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- STYLE SHEET -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/User.css">
<script src="https://kit.fontawesome.com/5661832475.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<title>회원가입 | 초코바이</title>
<style>
.logoBox{width: 400px; height: 120px; background: url("/resources/img/common/logo.svg") no-repeat; background-size: contain; display: inline-block; text-indent: -9999px;}
.fail_content{width:500px;height:500px;margin:0 auto;text-align: center; padding:50px;}
.fail_content h1{width: 400px;} 
.fail_content .icon{width:80px;height:80px;color:#58a6a6;margin:0 auto;padding:10px;line-height:50px;font-size: 50px;border:4px solid #58a6a6; border-radius: 50%;}
.fail_content .auto_redirect_desc{display:block;margin: 50px 0;}
.fail_content .fail_btn_area a {display:inline-block;height:50px;border:1px solid #ccc;line-height:50px;background-color:#333;color:#fff;text-decoration: none;}
.fail_content .fail_btn_area a:hover{background-color: #111;}
.fail_content .fail_btn_area .goJoinAgree{width: 186px; margin-right:20px;}
.fail_content .fail_btn_area .goMain{width: 100px;}
</style>
<script>
function init(){
    document.querySelector('.auto_redirect_desc').innerHTML="5초 후에 메인으로 자동 이동합니다.";
}
window.onload=function(){
    var time=5;
    init();
    setInterval(function(){
        time=time-1;
        document.querySelector('.auto_redirect_desc').innerHTML=time+"초 후에 메인으로 자동 이동합니다.";
        if(time==0){
            clearInterval();
            location.href="/index";
        }
    },1000);
}
</script>
</head>
<body>
	<div class="logoBox">
	    <a href="/Trade/getTradeList" class="logo">CHOCO-BUY logo</a>
	</div>
	<div class="fail_content">
	        <div class="icon"><i class="fas fa-exclamation"></i></div>
	        <h1>웹페이지가 만료되었습니다.</h1>
            <span class="auto_redirect_desc"></span>
	        <div class="fail_btn_area">
	            <a class="goJoinAgree" href="/Join/joinAgree">회원가입으로 돌아가기</a>
	            <!-- <a class="goMain" href="/index">메인으로</a> -->
	    </div>
	</div>
</body>
</html>