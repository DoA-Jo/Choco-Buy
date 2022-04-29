<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>글 상세</title>
<style>
/* .btn-info {border-radius: 0;height: 30px;padding: 5px;font-size: 14px;position:absolute;top: 91px;right: 5px;border-radius: 5px;} */
/* button {padding:10px;} */
body {margin: 0;padding: 0;}
.inner {width: 1000px;height: 60%;margin: 50px auto; padding-bottom: 20px;	position: relative;}
h1 {font-size: 30px; text-align: center; padding-bottom: 10px; }
table {margin: 60px auto 0px auto;width: 500px; }
table input, table textarea {width: 100%;}
.btn {display: flex;justify-content: left; margin: 5px;}
.btn-outline-secondary:hover { background-color: #712A2A;} 
.mylogo {width: 200px; height: 200px; background: url("/resources/img/img_avatar3.png") no-repeat; background-size: 200px; display: inline-block; text-indent: -9999px;}
.container{width: 1000px;}
.item {display: inline-block;vertical-align: top; }
.MylogoBox{margin-top: 50px;margin-left: 150px;width: 24%;}
.itemBox{width: 50%;}
</style>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %>
	<div class="inner">
		<h1>리뷰 작성</h1>
<%-- 		<h2>${UserInfo}</h2> --%>
		<div class="container">
		    	<div class="item MylogoBox">
		        	<a href="getTradeList" class="mylogo">logo</a>
		      	</div>
	      		<div class="item itemBox">
					<form action="updateMypageReview" method="post" name="fr" onsubmit="return check();">
				            <table>
				                <tr>
				                    <td >글번호:</td>
				                    <td><p>${trade.trade_seq}</p><input type="hidden" name="trade_seq" value="${trade.trade_seq}" ></td>
							        </tr>
					                <tr>
					                    <td >작성자:</td>
					                    <td><p>${trade.trade_nick}</p></td>
					                </tr>
					                <tr>
					                    <td >제목:</td>
					                    <td><p>${trade.trade_title}</p></td>
					                </tr>
					                <tr>
					                    <td >금액:</td>
					                    <td><p>${trade.trade_money}</p></td>
					                </tr>
					                <tr>
					                    <td >구매자:</td>
					                    <td><p>${trade.trade_buyinfo}</p></td>
					                </tr>
					                <tr>
					                    <td >거래일:</td>
					                    <td><p>${trade.trade_date}</p></td>
					                </tr>
					                <tr> 
				                		<td>리뷰입력: </td>
					                <td> 
					                	<input id="user_nick" type="text" name="trade_review" value="${trade.trade_review}" placeholder="${trade.trade_review}" maxlength="50" title="8자 까지 입력" required autofocus/> 
					                </td> 
				                </tr>
				            </table>
			            <hr>
			 		<div class="btn">
			 			<input class="btn btn-outline-secondary" type="submit" value="수정완료"/>
			 			<button class="btn btn-outline-secondary" type="button" onClick="javascript:history.back();">취소</button>
			 		</div>
					</form>
	      		</div>
			</div>
		</div>
		<c:set var="name" value="샘"/>
		<c:choose> 
   			 <c:when test="${name eq '새박'}">
        		<a href="" class="mylogo">logo</a>
   			 </c:when>
   			 <c:when test="${name eq '샘샘'}">
        		<a>저의 이름은 샘샘입니다.</a>
    		</c:when>
    		<c:when test="${name eq '박샘'}">
       			<a>저의 이름은 박샘입니다.</a>
   		 	</c:when>
    		<c:otherwise>
        		<a>내이름은 무엇인가</a>
    		</c:otherwise>
		</c:choose>
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
	</body>
</html>

	
	
	
	
	
	
