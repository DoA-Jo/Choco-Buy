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
				
					<form action="updateTrade" method="post">
						<div class="imgBox mb-3 mt-3">
							<img src="${pageContext.request.contextPath}/resources/img/upload/${trade.trade_img}">
						</div>
							<div class="media p-3" >
								<img src="${pageContext.request.contextPath}/resources/img/img_avatar3.png" alt="John Doe" class="mr-3 rounded-circle" style="width: 60px;">
									<div class="media-body" id="proBox" onClick="location.href='/Trade/getTradeProfile'">
									<input type="hidden" name="trade_nick" value="${trade.trade_nick}">
									
										<h3>${trade.trade_nick}</h3>
										<p><small>${trade.trade_area}</small></p>
									</div>
									    <button type="button" class="btn btn-outline-info" onclick="location.href='/Chat/ChatMyRoom?trade_seq=${trade.trade_seq}'">채팅으로 거래하기</button>
							</div>
						<div class="input-group">
							<input type="text" class="form-control" name="trade_title"	value="${trade.trade_title }">
						</div>
						<div class="input-group">
							<textarea class="form-control" rows="10" id="comment" name="trade_content" >${trade.trade_content }</textarea>
						</div>
						<div class="input-group mb-3">
							<input type="text" class="form-control innm" name="trade_money" value="${trade.trade_money }">
						</div>
					<!-- 본인일 때 에만 수정 삭제 가능 -->
					<c:if test="${trade.trade_nick eq user_nick}">
							<button id="conComplete" type="submit" class="btn btn-Basic">수정</button>
							<button onClick="location.href='deleteTrade'"id="conComplete" type="button" class="btn btn-Basic">삭제</button>
					</c:if>
							<button onClick="location.href='getTradeList'" id="conList" type="button" class="btn btn-Basic">글목록</button>
					</form>
					<!-- 본인이 아닐때 만 신고 가능 -->
					<c:if test="${trade.trade_uuid ne UserInfo}">
							<button onClick="location.href='updateReporting'" type="button" class="btn btn-Basic">유저 신고</button>
					</c:if>
					
				</div>
			</section>
           
        </div>
    </div>
<%@ include file="/WEB-INF/views/template/footer.jsp"  %>
</body>
</html>