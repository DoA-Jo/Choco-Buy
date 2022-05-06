<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,com.chocobuy.biz.inquiry.InqVO" %>
<%@ page import="java.util.*,com.chocobuy.biz.user.UserVO" %>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<%	
	String sts = ""; 
	String hide = "";
	String replyHide = "";
	String rehide = "";
	UserVO userVo = (UserVO) request.getAttribute("vo_ck"); 
	int role = userVo.getUser_role(); 
	String nick= userVo.getUser_nick();
	
	InqVO inqVo = (InqVO) request.getAttribute("inq");
	String inqNick= inqVo.getInq_nickname();
	
%>
<c:if test="${vo_ck.user_nick ne inq.inq_nickname }"><% sts = "disabled"; %></c:if>	<!-- 작성자가 로그인회원이랑 다를 때 컨트롤 못하게 disabled (= 작성자만보기) -->
<c:if test="${vo_ck.user_nick ne inq.inq_nickname }"><% hide = "hidden"; %></c:if>	<!-- 작성자가 로그인회원이랑 다를 때 숨기기 hidden (= 작성자만보기) -->
<%
	if(role != 100 && !nick.equals(inqNick)){
		replyHide="hidden";
	}
%>


<title>Inquiry page</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 

	<div class="container" align="center">
		<div class="warp">
			<div class="inq_tit">
			   <h1>1:1 문의 작성하기</h1>      
			</div>
			
			<form name="fm" action="/Inquiry/UpdateInq" method="post" enctype="multipart/form-data">
				<div class="inqInfoBox">
					<input type="hidden" name="inq_num" value="${inq.inq_num}">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">제목</span>
						</div>
						<input type="text" class="form-control innm" name="inq_title" value="${inq.inq_title}" <%=sts %>>      
					</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">작성자</span>
					    </div>
					    <input type="text" class="form-control innm" name="inq_nickname" value="${inq.inq_nickname}" readonly <%=sts %>>      
					</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">내용</span>
					    </div>
					    <textarea class="form-control innm" rows="10" id="comment" name="inq_content" <%=sts %>>${inq.inq_content}</textarea>      
					</div> 
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">파일보기</span>
					    </div>
					    <div class="inq_fileNameText">
						  	<span id="imgShow">${inq.inq_filename}</span>
							<c:choose>
								<c:when test="${empty inq.inq_filename}">파일없음</c:when>
								<c:otherwise><button type="button" class="btn btn-info" onclick="downloadFile('${inq.inq_filename}')">파일다운</button></c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">등록일</span>
					    </div>
					    <input type="text" class="form-control innm" name="regDate" value="${inq.inq_date}" readonly <%=sts %>>      
					</div>
					<div class="inqBtnBox">
						<button type="submit" class="btn btn-primary" <%=hide %>>수정완료</button>
					 	<button type="button" class="btn btn-inqWrite"  onclick="location.href='/Inquiry/InsertInq'">새 문의글 작성</button>
						<button type="button" class="btn btn-danger"  onclick="location.href='/Inquiry/DeleteInq?inq_num=${inq.inq_num}'" <%=hide %>>삭제하기</button>
						<button type="button" class="btn btn-inqList"  onclick="location.href='/Inquiry/GetInqList'">목록가기</button>
					</div>
				</div>
			 </form>  
  
  
		 	<!-- 댓글 -->
		 	<div class="inqReplyBox" <%=replyHide %>>
		 		<h4>댓글</h4>
		 		<form action="/Inquiry/InsertInqReply" method="post" enctype="multipart/form-data">
					<div class="inqInfoBox">
						<div class="input-group mb-3 hidden">
						    <div class="input-group-prepend">
						    	<span class="input-group-text">작성글번호</span>
						    </div>
						    <input type="text" class="form-control innm" name="inqRe_bno" value="${inq.inq_num}" >      
						</div>
						
						<div class="input-group mb-3 hidden">
						    <div class="input-group-prepend">
						    	<span class="input-group-text">댓글번호</span>
						    </div>  
						</div>
						
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						    	<span class="input-group-text">작성자</span>
						    </div>
						    <input type="text" class="form-control innm" name="inqRe_nickname" value="${vo_ck.user_nick}" readonly>      
						</div>
						<div class="input-group mb-3">
						    <div class="input-group-prepend">
						    	<span class="input-group-text">내용</span>
						    </div>
						    <textarea class="form-control" rows="10" id="comment" name="inqRe_content"></textarea>      
						</div>
						<div class="inqBtnBox ta_r">
							<button id="conComplete" type="submit" class="btn btn-primary">답변등록</button>
						</div>
					</div>
				</form>
				
				
			 		

				<!-- 등록된 댓글목록 -->
				<div class="inqInfoBox">
					<div id="inqReply">
						<ol class="inqReplyList">
							<c:forEach items="${inqReplyList}" var="getInqReply">
								<c:if test="${vo_ck.user_nick ne getInqReply.inqRe_nickname }"><% rehide = "hidden"; %></c:if>
								<c:if test="${vo_ck.user_nick eq getInqReply.inqRe_nickname }"><% rehide = ""; %></c:if>
								<li>
									<div class="input-group mb-3">
									    <div class="input-group-prepend">
									    	<span class="input-group-text">작성자</span>
									    </div>
									    <input type="text" class="form-control innm" name="inqRe_nickname" value="${getInqReply.inqRe_nickname}" readonly>      
									</div>
									<div class="input-group mb-3">
									    <div class="input-group-prepend">
									    	<span class="input-group-text">작성 날짜</span>
									    </div>
									    <input type="text" class="form-control innm" name="inqRe_date" value="${getInqReply.inqRe_date}" readonly>      
									</div>
									<div class="input-group mb-3">
									    <div class="input-group-prepend">
						    				<span class="input-group-text">내용</span>
									    </div>
				    					<textarea class="form-control innm" rows="10" id="comment" name="content" readonly>${getInqReply.inqRe_content}</textarea>
									</div>
									<div class="inqBtnBox ta_r" <%=rehide %>>
										<button type="button" class="btn btn-danger" onclick="location.href='/Inquiry/DeleteInqReply?bno=${getInqReply.inqRe_bno}&rno=${getInqReply.inqRe_rno}'">답변삭제</button>
									</div>
								</li>
							</c:forEach>   
						</ol>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/views/template/footer.jsp" %>

<script type="text/javascript">
function downloadFile(inq_filename){
    window.location ='/Inquiry/inqDownload?inq_filename='+inq_filename;
}

</script>

</body>
</html>
