<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp" %>   
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/mypage.css">
<title>글 상세</title>
<%@ include file="/WEB-INF/views/template/header.jsp" %>              
	<div class="container mt-3">
		<div class="warp mypage_wrap">
		   <ul class="list-group">
		   		<li class="list-group-item" id="aa">내 정보 관리</li>
			    <li class="list-group-item item-content">
					<div class="row">
					<div class="col-sm-3"> <img src="${pageContext.request.contextPath}/resources/img/profileImg/${user.user_profileImg}" ></div>
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
						    	<div class="mypage_btnBox">
							    	<button class="btn btn-outline-secondary " type="button" onClick="location.href='/Mypage/getMypageTradeSerch'" >리뷰내용 보기</button>
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



