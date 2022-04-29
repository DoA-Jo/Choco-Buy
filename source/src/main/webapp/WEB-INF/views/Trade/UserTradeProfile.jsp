<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<title>Trade page</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 
	<div class="container">
		<div class="warp">
			<section class="">
				<div class="container-fluid">
					<div class="card cardBox mt-4" style="width: 400px">
						<img class="card-img-top" src="${pagecontext.request.contextPath}/resources/img/img_avatar1.png" alt="Card image" style="width: 100%">
						<div class="card-body">
							<h4 class="card-title">${trade.trade_nick }</h4>
							<p class="card-text"><i class="fa-regular fa-people-group"></i></p>
						</div>
						<div class="container">
							<p></p>						
							  <i class="fas fa-user-friends"></i><!--${trade.trade_area}   리뷰리뷰리뷰리뷰 forEach 문으로 한줄 리뷰 넣기 select review where nick=() -->
						<button type="button" onClick="location.href='/Trade/getTrade.do?trade_seq=${trade.trade_seq}'"  class="btn btn-outline-info">이전으로 돌아가기</button>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
<%@ include file="/WEB-INF/views/template/footer.jsp"%>
</body>
</html>