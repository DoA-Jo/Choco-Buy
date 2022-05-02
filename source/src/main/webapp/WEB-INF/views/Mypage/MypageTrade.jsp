<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<title>글 상세</title>
<style>
/* .btn-info {border-radius: 0;height: 30px;padding: 5px;font-size: 14px;position:absolute;top: 91px;right: 5px;border-radius: 5px;} */
/* button {padding:10px;} */
body {margin: 0;padding: 0;}
.inner {width: 1000px;height: 60%;margin: 20px auto; padding-bottom: 20px;	position: relative;}
h1 {font-size: 30px; text-align: center; padding-bottom: 10px; }
/* table {margin: 60px auto 0px auto;width: 500px; } */
/* table input, table textarea {width: 100%;} */
.btn {display: flex;justify-content: left; margin: 5px;}
.btn-outline-secondary {background-color:#831616; color: white;}
.btn-outline-secondary:hover {background-color:#4B0E0E; color: white;}
.mylogo {width: 200px; height: 200px; background: url("/resources/img/img_avatar3.png") no-repeat; background-size: 200px; display: inline-block; margin-top: 15px;}
.btn-group{width: 500px;}
.item-content{background-color: #ddd;}
#aa{font-size: 20px; background-color:#58a6a6 }
.mt-3{height: 500px;}
.form-group { height: 45px;}
.form-control{height: 40px;}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/header.jsp" %>
	<div class="inner">
<%-- 	<h2>${UserInfo}</h2> --%>
<div class="container">
	<div class="inner">
		<div class="container mt-3">
		   <ul class="list-group">
		   		<li class="list-group-item" id="aa">리뷰 작성</li>
			    <li class="list-group-item item-content">
					<div class="row">
					    <div class="col-sm-3"> <img class="mylogo"></div>
				    	<div class="col-sm-9">
							<form action="updateMypageReview" method="post" name="fr" onsubmit="return check();">
							    <div class="form-group">
							    	글 번호:<input type="text" class="form-control" name="trade_seq" value="${trade.trade_seq}" placeholder="${trade.trade_seq}" readonly>
							    </div>
							    <div class="form-group">
							      	작성자:<input type="text" class="form-control" name="trade_nick" value="${trade.trade_nick}" placeholder="${trade.trade_nick}" readonly>
							    </div>
						   		<div class="form-group">
						      		제목:<input id="user_tel" class="form-control" type="text"  name="trade_title" value="${trade.trade_title}" placeholder="${trade.trade_title}" readonly >
						    	</div>
						    	<div class="form-group">
						      		금액:<input id="user_tel" class="form-control" type="text"  name="trade_money" value="${trade.trade_money}" placeholder="${trade.trade_money}" readonly >
						    	</div>
						    	<div class="form-group">
						      		구매자:<input id="user_tel" class="form-control" type="text"  name="trade_buyinfo" value="${trade.trade_buyinfo}" placeholder="${trade.trade_buyinfo}" readonly >
						    	</div>
						    	<div class="form-group">
						      		거래일:<input id="user_tel" class="form-control" type="text"  name="trade_date" value="${trade.trade_date}" placeholder="${trade.trade_date}" readonly >
						    	</div>
						    	<div class="form-group">
						      		리뷰입력:<input id="user_nick" class="form-control" type="text" name="trade_review" value="${trade.trade_review}" placeholder="${trade.trade_review}" maxlength="50" title="8자 까지 입력" required autofocus/>
						    	</div>
						    	<div class="btn">
							    	<input class="btn btn-outline-secondary" type="submit" value="수정완료"/>
			 						<button class="btn btn-outline-secondary" type="button" onClick="javascript:history.back();">취소</button>
						    	</div>
						    	</form>
						    </div>
						</div>
				    </li> 
			  	</ul>  
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>

	
	
	
	
	
	
