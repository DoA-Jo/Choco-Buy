<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 

    <div class="container content-container">
        <div class="warp">
            <section class="sectionBox">
	            <div class="flexContainer">
	            
					<c:if test="${countTrade ne 0 }">      
					<c:if test="${trade.trade_hidden eq 0 }">           
		            <c:forEach items="${tradeList}" var="trade">
		            	<div onClick="location.href='getTrade?trade_seq=${trade.trade_seq}'"  class="listcontainer border-secondary" >
		            		<div class="listContainerhover">
		            			<img src="${pageContext.request.contextPath}/resources/img/upload/${trade.trade_img}" alt="untitledchoco" class="trade-img" style="width : 280px; heith : 149px;">
							</div>
							<div class="textcontent">
								<h4><span>${trade.trade_title}</span></h4>
								<p class="trade_areaInfo"><i>${trade.trade_sinm +=trade.trade_sggnm +=trade.trade_emdnm }</i></p>
								<p>${trade.trade_money}원</p>
							</div>
						</div>
					</c:forEach>
					</c:if>
					</c:if>
					<c:if test="${countTrade eq 0 }">
		            	<div class="listcontainer border-secondary" >
		            		<div class="listContainerhover">
		            			표시할 컨텐츠가 없습니다.
							</div>
						</div>
					</c:if>
	            </div>
			</section>
        </div>
        <div style="clear:both"></div>
    </div>
<%@ include file="/WEB-INF/views/template/footer.jsp"  %>
</body>
</html>