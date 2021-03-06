<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp" %>   
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/mypage.css">
<title>글 상세</title>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%-- 	<h2>${UserInfo}</h2> --%>
<div class="container mt-3">
	<div class="warp myTrade_wrap">
	   <ul class="list-group">
	   		<li class="list-group-item" id="aa">리뷰 작성</li>
		    <li class="list-group-item item-content">
				<div class="row">
				    <div class="col-sm-3"> <img src="${pageContext.request.contextPath}/resources/img/profileImg/${user.user_profileImg}" ></div>
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
					      		리뷰입력:<input id="user_nick" class="form-control" type="text" name="trade_review" value="${trade.trade_review}" maxlength="50"  required autofocus/>
					    	</div>
						    <div class="mypage_btnBox">
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
<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
</html>

	
	
	
	
	
	
