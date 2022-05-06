<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*,com.chocobuy.biz.inquiry.InqVO" %>
<%@ page import="java.util.*,com.chocobuy.biz.user.UserVO" %>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<%	
// 	로그인 시 가져오는 닉네임
	String nick= (String) request.getAttribute("nick_ck");
	int role= (Integer) request.getAttribute("role_ck");
	System.out.println("nick : " + nick);
	System.out.println("role : " + role);
%>

<title>Inquiry page</title>
<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<%@ include file="/WEB-INF/views/template/menu.jsp" %> 

	<div class="container" align="center">
		<div class="warp">
			<div class="inq_tit">
			   <h1>1:1 문의사항</h1>      
			</div>
			<nav class="inquiry_searchBox">
			  <form class="" name="fm" action="/Inquiry/GetInqList" method="post">
			  	<select class="inqSearchSelect" id="sel1" name="inq_searchCondition">
					<c:forEach items="${inqConditionMap}" var="option">
						<option value="${option.value}" <c:if test="${inqVo.inq_searchCondition eq option.value}">selected</c:if>>${option.key}</option>
					</c:forEach>
			    </select>
			    <input class="inqSearchInput" type="text" name="inq_searchKeyword" value="${inqVo.inq_searchKeyword}" placeholder="검색어를 입력하세요.">
			<!--     <button class="btn btn-success" type="submit">검색</button> -->
				<input type="hidden" name="nowPage">
			    <button class="btn btn-success" type="button" onclick="pageFnc('0')">검색</button>
			    <button class="btn btn-inqWrite" type="button" onclick="location.href='/Inquiry/InsertInq'">새 문의글 작성</button>
			  </form>
			</nav>
			
			<div class="inqListTable">
			  <table class='table table-bordered'>
			  	<colgroup>
			  		<col width="8%">
			  		<col width="">
			  		<col width="12%">
			  		<col width="12%">
			  		<col width="10%">
			  	</colgroup>
			    <thead>
			      <tr>
			        <th>번호</th>
			        <th>제목</th>
			        <th>작성자</th>
			        <th>등록일</th>
			        <th>답변여부</th>
			      </tr>
			    </thead>
			    <tbody>
					<c:forEach items="${inqList}" var="inq">
<%-- 						<c:if test="${nick ne inq.inq_nickname}"></c:if> --%>
						<tr>
						  <td>${inq.inq_num}</td>
						  <td class="title"><a id="inq_contLink" onClick="mypage_check('<%=nick%>','${inq.inq_nickname}','${inq.inq_num}','<%=role %>');">${inq.inq_title}</a></td>
<%-- 						  <td class="title"><a class="inq_contLink" href="GetInq?inq_num=${inq.inq_num}">${inq.inq_title}</a></td> --%>
						  <td>${inq.inq_nickname}</td>
						  <td>${inq.inq_date}</td>
						  <td>
						      <c:if test="${inq.inq_completeCK == 0}">답변 대기 중</c:if>
							  <c:if test="${inq.inq_completeCK == 1}">답변 완료</c:if>
						  </td>
						</tr>
					</c:forEach>
			    </tbody>
			  </table><br><br>
			  
			  <div id="btnBox" class="inq_pgBtnBox">
				<div id="pgCnt" class="btn-group">
				<c:if test="${paging.startPage != 1 }">
					<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.startPage - 1 })">&lt;</button>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<button type="button" class="btn btn-primary">${p }</button>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<button type="button" class="btn btn-primary" onClick="pageFnc(${p })">${p }</button>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage}">
					<button type="button" class="btn btn-primary" onClick="pageFnc(${paging.endPage+1})">&gt;</button>
				</c:if>
				</div>
			  </div><br>
			  
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
    <div id="inq_myModal" class="inq_modal">
 
      <!-- Modal content -->
      <div class="inq_modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">&lt; 안내 &gt;</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br />해당 내용은 작성자와 관리자만 볼수있습니다.</p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
        <!--End Modal-->
		
<%@ include file="/WEB-INF/views/template/footer.jsp" %>

<script>
	function pageFnc(np){
		let frm = document.fm;
		frm.nowPage.value = np;
		frm.action = "GetInqList";
		frm.method = "post";
		frm.submit();	
	}
	
	function mypage_check(usernick, inqContnick, inqListnum, userRole){ 
	// 	alert(usernick + inqContnick + inqListnum);
		
	     if(usernick == inqContnick){ 
	    	 location.href = "/Inquiry/GetInq?inq_num="+inqListnum;
	     }else if(userRole == 100){
	    	 location.href = "/Inquiry/GetInq?inq_num="+inqListnum;
	     }else{
	        $('#inq_myModal').show();
	     	$('#inq_myModal').addClass("active");
	     	$("body").addClass("scrollbar_hide");
	     }
	}   
	function close_pop(flag) {
	     $('#inq_myModal').hide();
	     $('#inq_myModal').removeClass("active");
	};
</script>

</body>
</html>
