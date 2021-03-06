<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/head.jsp"  %>
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/trade_style.css">
<link rel="stylesheet" href="${pagecontext.request.contextPath}/resources/css/chat.css">
<title>Chat page</title>
<script>
var timerId = null;
var subCnt = 0;
var confCnt = 0;

window.onload = function(){
	getChatBox();
	startInterval();
	
	<c:if test="${chatRoom.chatroom_app eq 'Y'}">
	$("#appBtnName").empty();
	$("#appBtnName").append('<button type="button" id="appBtn" class="btn btn-outline-info" data-toggle="modal" data-target="#appointment">약속수정</button>');
	$("#appsave").empty();
	$("#appsave").append('<button type="button" class="btn btn-success" data-dismiss="modal" id="appCorrection">수정</button>');
	$("#msgbox").empty();
	let str = '<div class="alert alert-success">';
		str +='<strong>☞약속☜</strong> [ 약속날짜 : ${appointment.app_time} ] [ 약속장소 :   ${appointment.app_add} ] [ 약속금액 :  ${appointment.app_price} ] </div>'; 
	$("#msgbox").append(str);
	$("#app_add").val("${appointment.app_add}");
	$("#app_price").val("${appointment.app_price}");
	</c:if>
	
	<c:if test="${chatRoom.chatroom_report eq 'Y'}">
	$("#reportBtn").empty();
	$("#reportBtn").append('<button type="button" id="reportBtn" class="btn btn-outline-danger" data-toggle="modal" data-target="#notify" disabled>신고하기</button>');
	$("#appBtnName").empty();
	$("#appBtnName").append('<button type="button" id="appBtn" class="btn btn-outline-info" data-toggle="modal" data-target="#appointment" disabled>약속수정</button>');
	$("#reportPay").empty();
	$("#reportPay").append('<button type="button" class="btn btn-outline-warning ml-3 mr-3" disabled>결제하기</button>');
	$("#msg_content_btn").empty();
	
	str = '<div class="alert alert-warning">';
	str +='<strong>Warning!</strong> 신고가 된 채팅방으로 더 이상 채팅이 불가합니다.<br>';
		str +='자세한 사항은 <a href="/Inquriy/GetInqList?chatroom_seq=${chatroom.chatroom_seq}" class="alert-link">1:1 문의</a>를 통해 가능합니다.</div>'; 
		
	$("#msg_content_btn").append(str);
	</c:if>
	
	$("#chatSubmitBtn").click(function(){
		var formData = {
				"chatroom_seq": $("#chatroom_seq").val(),
				"trade_title": $("#trade_title").val(),
				"user_uuid" : $("#user_uuid").val(),	
				"user_nick" : $("#user_nick").val(),	
				"msg_content" : $("#msg_content").val()
		};
		
		$.ajax({
	        method:"POST", 
	        url : "/Chat/MsgInsert",
	        data: formData,
	        success : function(result) {
	        	if(result > 0 ){
	        		getChatBox();
				$("#msg_content").val("");
	        	}else {
	        		alert("데이터 로드 실패");       
	        	}
	        },
	        error:function(request,status){
	            alert("오류가 발생했습니다.");
	        }
	    });
	});
	

	$("#appSaveBtn").click(function(){
		
		$.ajax({
	        method:"POST", 
	        url : "/Chat/App",
	        data: { 
	        		"chatroom_seq": $("#chatroom_seq").val(),
	        		"app_time": $("#app_time").val(),
	        		"app_add": $("#app_add").val(),
	        		"app_price": $("#app_price").val()
	        },
	        cache :  false,
	        success : function(result) {
	        	alert("약속되었습니다!");
	        	if(result > 0 ){
	        		
	        		$("#msgbox").empty();
	        		
	        		str = '<div class="alert alert-success">';
	        		str +='<strong>☞약속☜</strong> [ 약속날짜 : ${appointment.app_time} ] [ 약속장소 :   ${appointment.app_add} ] [ 약속금액 :  ${appointment.app_price} ] </div>'; 
	        			
	        		$("#msgbox").append(str);
	        				
	        	}
	        	location.reload();
	        },
	        error : function(result) {
	        	alert("연결실패");
	        }
		}); 
		
	});
	
$("#appCorrection").click(function(){
		
		$.ajax({
	        method:"POST", 
	        url : "/Chat/UpdateApp",
	        data: { 
	        		"chatroom_seq": $("#chatroom_seq").val(),
	        		"app_time": $("#app_time").val(),
	        		"app_add": $("#app_add").val(),
	        		"app_price": $("#app_price").val()
	        },
	        cache :  false,
	        success : function(result) {
	        	alert("약속이 변경 되었습니다!");
	        	if(result > 0 ){
	        		
	        		$("#msgbox").empty();
	        		
	        		str = '<div class="alert alert-success">';
	        		str +='<strong>☞약속☜</strong> [ 약속날짜 : ${appointment.app_time} ] [ 약속장소 :   ${appointment.app_add} ] [ 약속금액 :  ${appointment.app_price} ] </div>'; 
	        			
	        		$("#msgbox").append(str);
	        				
	        	}
	        	location.reload();
	        },
	        error : function(result) {
	        	alert("연결실패");
	        }
		}); 
		
	});
	

$("#reportSaveBtn").click(function(){
	
	if (confirm("신고하시겠습니까?")) {
		$.ajax({
	        method:"POST", 
	        url : "/Chat/Report",
	        data: { 
	        		"chatroom_seq": $("#chatroom_seq").val(),
	        		"chatroom_report_content": $("#chatroom_report_content").val(),
	        },
	        cache :  false,
	        success : function(result) {
	        	if(result > 0 ){
	        		alert("신고되었습니다.") ; 
	        		$("#msg_content_btn").empty();
	        		
	        		str = '<div class="alert alert-warning">';
	        		str +='<strong>Warning!</strong> 신고가 된 채팅방으로 더 이상 채팅이 불가합니다.<br>';
	        			str +='자세한 사항은 <a href="/Inquriy/GetInqList?chatroom_seq=${chatroom.chatroom_seq}" class="alert-link">1:1 문의</a>를 통해 가능합니다.</div>'; 
	        			
	        		$("#msg_content_btn").append(str);
	        	}
	        	location.reload();
	        },
	        error : function(result) {
	        	alert("연결실패");
	        }
		}); 
    }
	
});

}


function getChatBox(){
	$.ajax({
        method:"POST", 
        url : "/Chat/MsgList",
        data: {"chatroom_seq": $("#chatroom_seq").val()},
        cache :  false,
        success : function(result) {
        	if(result.code == 'OK' ){
        		$("#chatBox").empty();
        		
        		$.each(result.msgList , function (index, item) {
        			let newClass = '';
        			let chatTag = '';
        			if(item.user_uuid === '${userUser.user_uuid}'){
        				newClass = 'speech-bubble-right';
        				chatTag += "<div style='width:100%;text-align:right;'>" ;
            			chatTag += "<span class='"+newClass+"'>" + item.msg_content + "</span>" ;
        				chatTag += "<span> " + item.user_nick + "</span></div><br>";
        	
        			}else {
        				newClass = 'speech-bubble-left';
        				chatTag += "<div style='width:100%;text-align:left;'><span>" + item.user_nick + " </span>";
            			chatTag += "<span class='"+newClass+"'>" + item.msg_content + "</span></div><br>" ;
        			}
        			
        			$("#chatBox").append(chatTag);
        			
        		});
        		
        	}else {
        		alert("데이터 로드 실패");
        	}
        	
        },
        error:function(request,status){
            alert("오류가 발생했습니다.");
        }
    });
}

        	
function startInterval(){
	timerId = window.setInterval("getChatBox()", 1000);
}


function stopInterval(){
	if(timerId != null) {
        clearInterval(timerId);
    }
}

function enterkey() {
    if (window.event.keyCode == 13) {
         $("#chatSubmitBtn").click();
    }
}

</script>

<%@ include file="/WEB-INF/views/template/header.jsp"  %>
<%@ include file="../template/menu.jsp"  %>
   <div class="container">
        <div class="warp">
            <section class="chat_contBox">
				<div class="container-fluid">
				
					<form action="/Trade/updateTrade" method="post">
						<div class="imgBox mb-3 mt-3">
							<img src="${pageContext.request.contextPath}/resources/img/upload/${trade.trade_img}">						</div>
							<div class="media p-3" >
									<img src="${pageContext.request.contextPath}/resources/img/profileImg/${trade.trade_profileimg}" alt="John Doe" class="mr-3 rounded-circle" style="width: 60px;">
									<div class="media-body" id="proBox" onClick="location.href='/Trade/getTradeProfile?trade_nick=${tradeUser.trade_nick}'" style="cursor : pointer;" >
										<input type="hidden" id="chatroom_seq" value="${chatRoom.chatroom_seq}">
										<input type="hidden" id="user_nick" value="${userUser.user_nick}">
										<input type="hidden" id="trade_uuid" value="${chatRoom.trade_uuid}">
										<input type="hidden" id="user_uuid" value="${userUser.user_uuid}">
										<input type="hidden" id="user_uuid" value="${chatRoom.trade_area}">
										<h3>${chatRoom.trade_nick}</h3>
										<p class="trade_areaInfo">${chatRoom.trade_area}</p>
										</div>
											<!-- Button to Open the Modal -->
											<div id="appBtnName">
											<button type="button" id="appBtn" class="btn btn-outline-info" data-toggle="modal" data-target="#appointment">약속잡기</button>
											</div>
											<!-- The Modal -->
											<div class="modal fade" id="appointment">
											  <div class="modal-dialog modal-dialog-centered">
											    <div class="modal-content">
										     <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">약속잡기</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
	  								         <!-- Modal body -->
										       <div class="modal-body">
												   	  <text> 약속날짜 :</text>
												      <input type="datetime-local" class="form-control mb-3" id="app_time">
												      
												      <text> 약속장소 :</text> 
												      <input type="text" class="form-control mb-3" id="app_add" placeholder="약속한 장소를 입력해주세요">
												     
												      <text> 약속금액 :</text>
												      <div class="input-group mb-3" >
												      <input type="number" class="form-control" id="app_price" placeholder="약속한 금액을 입력해주세요">
												      
												      <div class="input-group-append">
												        <span class="input-group-text">원</span>
												      </div>
												   	  </div>
										       </div> 
												     <!-- Modal footer -->
												      <div class="modal-footer">
												       <div id="appsave">
												    	<button type="button" class="btn btn-success" data-dismiss="modal" id="appSaveBtn" >저장</button>
												       </div>
												        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
												     </div>
												    </div>
												   </div>
												  </div>
											<div id="reportPay">	  
											<button type="button" class="btn btn-outline-warning ml-3 mr-3" onclick="location.href='/Pay/PayIndex?chatroom_seq=${chatRoom.chatroom_seq}'">결제하기</button>
											</div>
											<!-- Button to Open the Modal -->
											<c:if test="${tradeUser.trade_uuid ne userUser.user_uuid}">
											<div id="reportBtn">
											<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#notify">
											   신고하기
											</button>
											</div>
											</c:if>
											<!-- The Modal -->
											<div class="modal fade" id="notify">
											  <div class="modal-dialog modal-dialog-centered">
											    <div class="modal-content">
										     <!-- Modal Header -->
										      <div class="modal-header">
										        <h4 class="modal-title">신고하기</h4>
										        <button type="button" class="close" data-dismiss="modal">&times;</button>
										      </div>
	  								         <!-- Modal body -->
										       <div class="modal-body">
												    <div class="form-group">
												      <label for="comment">신고사유:</label>
												      <textarea class="form-control" rows="5" id="chatroom_report_content" name="text" placeholder="신고사유를 입력해주세요"></textarea>
												    </div>
												    <center>
												    <button type="button" class="btn btn-danger" id="reportSaveBtn" data-dismiss="modal" >신고하기</button>
												    </center>
												  
										       </div>
										     <!-- Modal footer -->
										      <div class="modal-footer">
										        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										     </div>
										    </div>
										   </div>
										  </div>
									</div>
							</div>
						<div class="input-group chatBox_cont">
							<div class="input-group-prepend">
						      <span class="input-group-text">방이름:</span>
						    </div>
							 <input type="text" class="form-control" id="trade_title" value="${chatRoom.trade_title }" readonly>
						</div>
						<div id="msgbox">
						 <div class="alert alert-danger alert-dismissible fade show">
						    <button type="button" class="close" data-dismiss="alert">&times;</button>
							    <strong>※경고※</strong> 잠깐만요! 사기 등 피해 위험이 있을 수 있으니 주의하세요
						  </div>
						  </div>
						<div class="form-control" id="chatBox"></div>
						<div class="input-group mb-3" id="msg_content_btn">
							<input type="text" onkeydown="enterkey()" class="form-control innm" id="msg_content" name="msg_content">
							<div class="input-group-append">
							  <span class="input-group-text" id="chatSubmitBtn">전송</span>
							</div>
						</div>
					<button onClick="location.href='/Trade/getTradeList'" id="conList" type="button" class="btn btn-Basic">글목록</button>
					</form>
				</div>
			</section>
        </div>
    </div>

<%@ include file="../template/footer.jsp"  %>
</body>
</html>