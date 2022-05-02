<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,com.chocobuy.biz.inquiry.InqVO" %>
<%@ page import="java.util.*,com.chocobuy.biz.user.UserVO" %>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<%	
// 	로그인 시 가져오는 닉네임
	String nick= (String) request.getAttribute("nick_ck");
	System.out.println("nick(insert) : " + nick);
%>

<title>Inquiry page</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 


	<div class="container" align="center">
		<div class="warp">
			<div class="inq_tit">
			   <h1>1:1 문의 작성하기</h1>      
			</div>
			
			
			<form action="/Inquiry/InsertInq" method="post" enctype="multipart/form-data">
				<div class="inqInfoBox">
				    <div class="input-group mb-3">
					    <div class="input-group-prepend">
					        <span class="input-group-text">제목</span>
					    </div>
					    <input type="text" class="form-control" name="inq_title" placeholder="제목을 입력하세요." required>      
				    </div>
				    <div class="input-group mb-3">
					    <div class="input-group-prepend">
					        <span class="input-group-text">작성자</span>
					    </div>
					    <input type="text" class="form-control innm" name="inq_nickname" value="<%=nick %>" readonly>      
				    </div>
				    <div class="input-group mb-3">
					    <div class="input-group-prepend">
					        <span class="input-group-text">파일선택</span>
					    </div>
					     <input type="file" class="inquiry_fileBtn" name="inq_uploadFile">      
				    </div>
				    <div class="input-group mb-3">
					    <div class="input-group-prepend">
					        <span class="input-group-text">내용</span>
					    </div>
					    <textarea class="form-control" rows="10" id="comment" name="inq_content"></textarea>      
				    </div>
				    <div class="inqBtnBox">
				 		<button id="conComplete" type="submit" class="btn btn-inqWrite">문의글 작성완료</button>
						<button type="button" class="btn btn-success" onclick="location.href='/Inquiry/GetInqList'">목록가기</button>
					</div>
				</div>
			</form>
		</div>
	</div>


<%@ include file="/WEB-INF/views/template/footer.jsp" %>

</body>
</html>
