<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<title>글 상세</title>
<style>
/* .btn-info {	border-radius: 0;	height: 30px;	padding: 5px;	font-size: 14px;	position: absolute;	top: 91px;	right: 5px;	border-radius: 5px} */
/* table input, table textarea {width: 100%;} */
/* table button {	border: none;	background-color: #fff} */
/* .btn-outline-secondary:hover {background-color : rgba(88,166,166,0.2);} */
body {	margin: 0;	padding: 0;}
.inner {	width: 1000px;	height: 40%;	margin: 100px auto;	padding-bottom: 0px;	position: relative;}
h1 {font-size: 30px; text-align: center;	padding-bottom: 30px;}
table {font-size: 18px;	margin: 60px auto 50px auto;	width: 500px;}
.btn-group {margin: 10px auto 0px auto;	display: flex;	justify-content: center;}
.btn-outline-secondary {background-color:#831616; color: white;}
.btn-outline-secondary:hover {background-color:#4B0E0E; color: white;}
p {font-size: 25px;}
.btn-group{width: 500px;}
</style>
<%@ include file="/WEB-INF/views/template/header.jsp" %>              
<%@ include file="/WEB-INF/views/template/menu.jsp" %>              
	<div class="inner">
		<h1>내 정보 관리</h1>
		<h2>${UserInfo}</h2>
            <table class=" table-hover">
                <tr>
                    <td >휴대폰번호</td>
                    <td><p>${user.user_tel}</p></td>
                </tr>
                <tr>
                    <td >주소</td>
                    <td><p>${user.user_sggNm} &nbsp;${user.user_emdNm}</p></td>
                </tr>
                <tr>
                    <td>닉네임</td>
                    <td><p>${user.user_nick}</p></td>
                </tr>
            </table>
		<hr>
		<div class="btn-group btn-group-sm">
			<button class="btn btn-outline-secondary " type="button" onClick="location.href='/Mypage/getMypageTradeSerch'" >리뷰보기</button>
			<button class="btn btn-outline-secondary " type="button" onClick="location.href='/Mypage/getMypageProfileUpdate'" >내정보 수정</button>
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>



