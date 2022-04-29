<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/serviceBoard.css">
<title>title 삽입해주세요</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 

	<div class="container">
		<div class="jumbotron">
			<h1 align="left">고객센터 글쓰기 상세페이지</h1>
		</div>
			
		<div id="popBox">
		</div>
		<div class="">
	  		<form name="fm" action="/Service/insertQna">
			    <div class="input-group mb-3">
		      		<div class="input-group-prepend">
			        	<span class="input-group-text">제목</span>
			      	</div>
			      	<input type="text" class="form-control innm" name="qna_title" value="${qna.qna_tilte}">      
			    </div>
			    <div class="input-group mb-3">
			      	<div class="input-group-prepend">
			      	  <span class="input-group-text">작성자</span>
			      	</div>
			      	<input type="text" class="form-control innm" name="qna_writer" value="${qna.qna_writer}">      
			    </div>
			    <div class="input-group mb-3">
			      	<div class="input-group-prepend">
			        	<span class="input-group-text">내용</span>
	     	 		</div>
			      	<textarea class="form-control innm" rows="10" id="comment" name="qna_content"> ${qna.qna_content}</textarea>      
			    </div> 
		   
			    <div class="input-group mb-3">
		     		<div class="input-group-prepend">
			        	<span class="input-group-text">등록일</span>
			     	</div>
			      	<input type="text" class="form-control innm" name="qna_date" value="" readonly >      
			    </div>     
			    <div id="footer">
			    	<div style="text-align: center;">
						<a href="/Service/QnaController" class="btn btn-primary pull-Right">글 목록</a>
					</div>
				  	<div style="text-align: right;">
						<button type="submit" class="btn btn-primary pull-Right">글등록</button>
					</div>
				</div>
		  	</form>  
	    </div>
	</div>
<%@ include file="../template/footer.jsp" %>
</body>
</html>
