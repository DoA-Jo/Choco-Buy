<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/TradeScript.js"></script>

<title>Trade page</title>
<style>
.container .warp .container-fluid .cardBox{ margin : 0 auto;}
/*  .container .warp .container-fluid .cardBox .card-title::selection{ margin : 0 auto; background : rgba(88,166,166,0.4) ;text-shadow: none; color : #fff;}  */
.container .warp .tradeList {width : 90%; height: 900px; margin : 0 auto; padding : 0 auto;}
.container .warp .tradeList .listcontainer{float:left; padding : 5px;}
.container .warp .tradeList .listcontainer{ border-radius: 50px}
.profileBox .introduceBox {margin-top  : 10px;}
</style>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 
	<div class="container">
		<div class="warp">
			<section class="">
				<div class="container-fluid">
				 	<div class="media p-3 profileBox">
				        <img src="${pagecontext.request.contextPath}/resources/img/profileImg/${trade.trade_profileimg}" alt="Jane Doe" class="align-self-center rounded-circle" style="width:45px;">
				        <div class="introduceBox media-body">
				             <h4> <i class="fas fa-user-friends"></i> ${trade.trade_nick }</h4>
     						 <p><i>${trade.trade_sinm +=trade.trade_sggnm +=trade.trade_emdnm }</i></p>      
				        </div>
					<button type="button" onClick="location.href='/Trade/getTrade?trade_seq=${trade.trade_seq}'"  class="btn btn-outline-info getBackBtn">이전으로 돌아가기</button>
			      	</div>  
				</div>
				
					<div class="tradeList">
			            <c:forEach items="${tradeList}" var="trade" begin="0" end="2">
			            	<div   class="listcontainer border-secondary" >
			            		<div class="listContainerhover">
			            		<img src="${pageContext.request.contextPath}/resources/img/upload/${trade.trade_img}" alt="untitledchoco" class="trade-img" style="width : 280px; heith : 149px;">
								</div>
								<div class="textcontent">
								<h4><span>${trade.trade_title}</span></h4>
								<small><i>${trade.trade_area}</i></small>
								<p>${trade.trade_money}원</p>
								</div>
							</div>
						</c:forEach>
							<div><label id="seeMoreListClick"> + 더보기 </label> </div>
							<div id="seeMoreList" style="display : none;">
							<c:forEach items="${tradeList}" var="trade" begin="2" >
				            	<div class="listcontainer border-secondary" >
				            		<div class="listContainerhover">
					            		<img src="${pageContext.request.contextPath}/resources/img/upload/${trade.trade_img}" alt="untitledchoco" class="trade-img" style="width : 280px; heith : 149px;">
									</div>
										<div class="textcontent">
										<h4><span>${trade.trade_title}</span></h4>
										<small><i>${trade.trade_area}</i></small>
										<p>${trade.trade_money}원</p>
									</div>
								</div>
							</c:forEach>
			   				</div>
						
					</div>
			</section>
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp"%>
</body>
</html>