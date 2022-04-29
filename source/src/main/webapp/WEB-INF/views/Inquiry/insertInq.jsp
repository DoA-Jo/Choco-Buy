<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<body>
<div class="jumbotron">
   <h1>글쓰기</h1>      
</div>
<%@ include file="/WEB-INF/views/template/menu.jsp" %>  
<div class="container-fluid">
  <form action="insertInq" method="post" enctype="multipart/form-data">
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
      <input type="text" class="form-control innm" name="inq_nickname" value="${userName}" readonly>      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">파일선택</span>
      </div>
       <input type="file" class="form-control border" name="inq_uploadFile">      
    </div>
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control" rows="10" id="comment" name="inq_content"></textarea>      
    </div>
    <div id="footer">
	  	<button id="conComplete" type="submit" class="btn btn-primary">새글 등록</button>
		<a class="blackBtn" href="getBoardList">글 목록 가기</a>
	 </div>
  </form>
</div>


</body>
</html>
