<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>글 상세</title>
<style>
body {	margin: 0;	padding: 0;}
.inner {	width: 1000px;	height: 40%;	margin: 100px auto;	padding-bottom: 0px;	position: relative;}
table {font-size: 18px;	margin: 60px auto 50px auto;	width: 500px;}
.btn-outline-secondary {background-color:#831616; color: white;}
.btn-outline-secondary:hover {background-color:#4B0E0E; color: white;}
p {font-size: 25px;}
.mylogo {width: 200px; height: 200px; background: url("/resources/img/img_avatar3.png") no-repeat; background-size: 200px; display: inline-block; margin-top: 15px;}
.btn-group{width: 500px;}
.item-content{background-color: #ddd;}
#aa{font-size: 20px; background-color:#58a6a6 }
.form-group{height: 50px;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/header.jsp" %>              
<div class="inner">
		<div class="container mt-3">
		   <ul class="list-group">
		   		<li class="list-group-item" id="aa">내 정보 관리</li>
			    <li class="list-group-item item-content">
					<div class="row">
					    <div class="col-sm-3"> <img class="mylogo"></div>
				    	<div class="col-sm-9">
							<form action="/Mypage/updateMypageUser" method="post" name="fr">
								<div class="input-group mb-2">
									   <input type="text" id="user_siNm" class="form-control"  name="user_siNm" value="${siNm }"  placeholder="${user.user_siNm}" disabled />
									   <input type="text" id="user_sggNm" class="form-control"  name="user_sggNm" value="${sggNm }" placeholder="${user.user_sggNm}" disabled />
									   <input type="text" id="user_emdNm" class="form-control"  name="user_emdNm" value="${emdNm }" placeholder="${user.user_emdNm}" disabled />
							   		</div>
						   		<div class="form-group">전화번호
						      		<input id="user_tel" class="form-control" type="text"  name="user_tel" value="${user.user_tel}" placeholder="${user.user_tel}"  readonly>
						      		
						    	</div>
						    	<div class="form-group">닉네임
						      		<input id="user_nick" class="form-control" type="text" name="user_nick" value="${user.user_nick}" placeholder="${user.user_nick}" readonly>
						    	</div>
						    	<div class="btn">
							    	<button class="btn btn-outline-secondary " type="button" onClick="location.href='/Mypage/getMypageTradeSerch'" >리뷰보기</button>
									<button class="btn btn-outline-secondary " type="button" onClick="location.href='/Mypage/getMypageProfileUpdate'" >내정보 수정</button>
						    	</div>
					      	</form>
					    </div>
					</div>
			    </li> 
		  	</ul>  
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</html>



