<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/template/index_head.jsp"  %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/trade_indexstyle.css">

<script>
$(document).ready(function(){
	$('.slick-track').slick({
		  slidesToShow: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  prevArrow: $('.prev'),
		  nextArrow: $('.next')
		});
		$('.slick-background').slick({
		  slidesToShow: 1,
		  autoplay: true,
		  fade: true,
		  cssEase: 'linear',
		  autoplaySpeed: 2000
		});
	$('.next').click(function(){
		$('.slick-next').click();
	});
	$('.prev').click(function(){
		$('.slick-prev').click();
	});
});
</script>

<title>CHOCOBUY</title>
<%@ include file="/WEB-INF/views/template/index_header.jsp"  %>
<%@ include file="/WEB-INF/views/template/index_menu.jsp"  %>

	<div id="bannerContainer">
		<!-- bannerConBox 2022.05.03 수정 s -->
		<div class="bannerConBox">
			<div class="bannerInner">
				<div class="bannerSlide">
					<button class="arrow next"><span><i class="fas fa-arrow-right"></i></span></button>
					<button class="arrow prev"><span><i class="fas fa-arrow-left"></i></span></button>
					<div class="slick-track">
						<div><img src="${pageContext.request.contextPath}/resources/img/ban/ban1_540_380.png" class = "slideImg"></div>
						<div><img src="${pageContext.request.contextPath}/resources/img/ban/ban2_540_380.png" class = "slideImg"></div>
						<div><img src="${pageContext.request.contextPath}/resources/img/ban/ban3_540_380.png" class = "slideImg"></div>
						<div><a href="/howToUse" target="_blank"><img src="${pageContext.request.contextPath}/resources/img/ban/ban4_540_380.png" class = "slideImg"></a></div>
					</div>
				</div>
			</div>
			<div class="slick-background">
				<div class="banColor ban01">
					<div class="bannerWrap">
					<div class="banTextBox">
						<p class="banText">심부름 마켓 초코바이에서</p> <p class="banText">원하는 모든 서비스를 찾아보세요!</p>
					</div>
					<div class="banSearchBox">
	                <form action="getSearchTradeList">
	                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
	                    <button type="submit" class="searchBtn">검색</button>
	                </form>
	            	</div>
	                </div>	
				</div>
				<div class="banColor ban02">
					<div class="bannerWrap">
					<div class="banTextBox">
						<p class="banText">심부름 마켓 초코바이에서</p> <p class="banText">원하는 모든 서비스를 찾아보세요!</p>
					</div>           
					<div class="banSearchBox">
	                <form action="getSearchTradeList">
	                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
	                    <button type="submit" class="searchBtn">검색</button>
	                </form>
	            	</div>
	           	    </div>
				</div>
				<div class="banColor ban03">
					<div class="bannerWrap">
					<div class="banTextBox">
						<p class="banText">심부름 마켓 초코바이에서</p> <p class="banText">원하는 모든 서비스를 찾아보세요!</p>
					</div>
					<div class="banSearchBox">
	                <form action="getSearchTradeList">
	                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
	                    <button type="submit" class="searchBtn">검색</button>
	                </form>
	            	</div>
	            	</div>
				</div>
				<div class="banColor ban04">
					<div class="bannerWrap">
					<div class="banTextBox">
						<p class="banText">심부름 마켓 초코바이에서</p> <p class="banText">원하는 모든 서비스를 찾아보세요!</p>
					</div>
					<div class="banSearchBox">
	                <form action="getSearchTradeList">
	                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
	                    <button type="submit" class="searchBtn">검색</button>
	                </form>
	                </div>
	            	</div>
				</div>
			</div>
		</div>
		<!-- bannerConBox 2022.05.03 수정 e -->
	</div>
	
    <div class="container content-container">
        <div class="warp">
            <section class="sectionBox">
            	<div class="flexContainer">
            		<c:forEach items="${tradeList}" var="trade">
            			<div  onClick="location.href='/Login/login'"  class="listcontainer border-secondary">
	            			<div class="listContainerhover">
	            				<img src="https://dummyimage.com/280x149/fff/000.png" alt="untitledchoco" class="untitledchoco">
							</div>
							
							<!-- textcontent 2022.05.03 수정 s -->
							<div class="textcontent">
								<h4><span>${trade.trade_title}</span></h4>
								<p class="trade_areaInfo"><i>${trade.trade_area}</i></p>
								<p>${trade.trade_money}원</p>
							</div>
							<!-- textcontent 2022.05.03 수정 e -->
						</div>
					</c:forEach>
				</div>
			</section>
        </div>
        <div style="clear:both"></div>
    </div>
<!-- footer -->
<%@ include file="/WEB-INF/views/template/footer.jsp"  %>
</body>
</html>