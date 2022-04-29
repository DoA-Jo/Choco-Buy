<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/TradeScript.js"></script>
<title>TradeInsert</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 
    <div class="container">
        <div class="warp">
            <section class="">
				<div class="container-fluid">
<!-- 					<form action="insertTrade.do" method="post" > -->
					<form id="insertTrade_do" method="post" enctype="multipart/form-data">
						<div class="imgBox mb-3 mt-3">
							<img src="${pageContext.request.contextPath}/resources/img/eee.png">
								 <label for="chooseFile">👉 CLICK HERE! 👈    </label>
									<input type="file" class="form-control border" name="trade_uploadImg" value="trade_img">      
						</div>
							<div class="media p-3">
								<img src="${pageContext.request.contextPath}/resources/img/img_avatar3.png" alt="John Doe" class="mr-3 rounded-circle" style="width: 60px;">
								
								<div class="media-body" id="proBox">
								
									<h4><input type="text" name="trade_nick" value="${user_nick}" readonly></h4>
									<p><small><input type="text" name="trade_area" value="${siNm += sggNm += emdNm}" readonly></small></p>
									</div>
								</div>
						<div class="input-group">
							<input type="text" class="form-control" id="td_title" name="trade_title"	placeholder="제목을 입력하세요...">
						</div>
							<div class="input-group ">
							
							
							  <select class="custom-select" id="td_category" name="trade_category">
							    <option selected>Categories...</option>
							    <option value="배달">배달</option>
							    <option value="쇼핑">쇼핑</option>
							    <option value="청소">청소</option>
							    <option value="집안일">집안일</option>
							    <option value="전문서비스">전문서비스</option>
							    <option value="반려동물">반려동물</option>
							    <option value="역할대행">역할대행</option>
							  </select>
							</div>
						<div class="input-group">
							<textarea class="form-control" rows="10" id="td_content" name="trade_content" placeholder = "내용을 입력하세요" ></textarea>
						</div>
						<div class="input-group mb-3 ">
							<input type="text" class="form-control innm"  id ="td_money" name="trade_money" placeholder = "금액...">
						</div>
							<button id="insertTradeBtn" type="button" class="btn btn-Basic">새글 등록</button>
							<button onClick="location.href='getTradeList'" id="conList" type="button" class="btn btn-Basic">글목록</button>
					</form>
				</div>
			</section>
        </div>
    </div>
<%@ include file="/WEB-INF/views/template/footer.jsp"  %>
</body>
</html>