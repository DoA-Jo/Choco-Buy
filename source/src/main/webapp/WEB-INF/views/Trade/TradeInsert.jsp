<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/TradeScript.js"></script>
<title>TradeInsert</title>
<style>

</style>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 
    <div class="container">
        <div class="warp">
            <section class="">
				<div class="container-fluid">
					<!-- 20220502 김혜린 수정 -->
					<form id="insertTrade_do" method="post" enctype="multipart/form-data">
						<div class="imgBox mb-3 mt-3">
							<label id="chooseFile" for="chooseFile"> 사진 올리기! </label>
							<input id="uploadBtn" type="file" class="form-control border" name="trade_uploadImg" accept="image/*" onChange="loadFile(this)" value="trade_img" hidden>      
						</div>
						<div id="imageShow" class="mb-3 tradeImgBox"></div>
					<!-- 20220502 김혜린 수정 -->
							<div class="media p-3">
								<img src="${pageContext.request.contextPath}/resources/img/profileImg/${user.user_profileImg}" alt="profileImg" class="mr-3 rounded-circle" style="width: 60px;">
								<div class="media-body" id="proBox">
									<h4>${user.user_nick}<input type="hidden" name="trade_nick" value="${user.user_nick}" ></h4>
									<p><small>${user.user_siNm += user.user_sggNm += user.user_emdNm}</small></p>
									<input type="hidden" name="trade_sinm" value="${user.user_siNm}" >
									<input type="hidden" name="trade_sggnm" value="${user.user_sggNm}" >
									<input type="hidden" name="trade_emdnm" value="${user.user_emdNm}" >
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