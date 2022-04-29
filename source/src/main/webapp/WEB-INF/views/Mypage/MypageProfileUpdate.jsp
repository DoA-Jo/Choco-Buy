<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp"  %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>글 상세</title>
<style>
/* .inner {width: 700px;height: 100%;margin: 100px auto;padding-bottom: 20px;border-bottom: 1px solid gray;position: relative;} */
body {margin: 0;padding: 0;}
h1 {font-size: 35px; margin:30px auto; text-align: center;padding-bottom: 10px;}
.btn-info {border-radius: 0;height: 30px;padding: 5px;font-size: 14px;position:absolute;top: 91px;right: 5px;border-radius: 5px;}
table {margin: 60px auto 0px auto;width: 500px;}
table input, table textarea {width: 100%;}
table button {border: none;background-color: #fff}
.btn{display: flex;justify-content: center; margin:5px;}
.btn-outline-secondary:hover {background-color:#4B0E0E; color: white;}
.mylogo {width: 200px; height: 200px; background: url("/resources/img/img_avatar3.png") no-repeat; background-size: 200px; display: inline-block; margin-top: 15px;}
.item-content{background-color: #ddd;}
#aa{font-size: 20px;}

</style>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<%@ include file="/WEB-INF/views/template/menu.jsp" %>
	<div class="inner">
<!-- 		<h1>내 정보 수정</h1> -->
<%-- 		<h2>${UserInfo}</h2> --%>
	</div>
	<div class="inner">
		<div class="container mt-3">
		   <ul class="list-group">
		   		<li class="list-group-item" id="aa">내 정보 수정</li>
			    <li class="list-group-item item-content">
					<div class="row">
					    <div class="col-sm-3"> <img class="mylogo"></div>
				    	<div class="col-sm-9">
							<form action="/Mypage/updateMypageUser" method="post" name="fr">
							    <div class="form-group">
							    	<input type="text" class="form-control" id="address_kakao" name="user_sggNm" value="${user.user_sggNm}" placeholder="${user.user_sggNm}" maxlength="50">
							    </div>
							    <div class="form-group">
							      <input type="text" class="form-control" name="user_emdNm" value="${user.user_emdNm}" placeholder="${user.user_emdNm}" maxlength="50">
							    </div>
						   		<div class="form-group">
						      		<input id="user_tel" class="form-control" type="text"  name="user_tel" value="${user.user_tel}" placeholder="${user.user_tel}" maxlength="20" >
						      		<input id="phnum_btn" type="button" value="휴대폰번호 중복확인"  > 
		                        	<span class="point successNumChk">이름은 2자 이상 8자 이하로 설정해주시기 바랍니다.</span> 
			                		<input type="hidden" id="NumDoubleChk"/> 
						    	</div>
						    	<div class="form-group">
						      		<input id="user_nick" class="form-control" type="text" name="user_nick" value="${user.user_nick}" placeholder="${user.user_nick}" maxlength="20" title="8자 까지 입력" required autofocus/> 
						      		<input id="dup_btn" type="button" value="닉네임 중복확인" >
			                		<span class="point successNameChk">이름은 2자 이상 8자 이하로 설정해주시기 바랍니다.</span> 
			                		<input type="hidden" id="nameDoubleChk"/> 
						    	</div>
						    	<div class="btn">
						    	<button class="btn btn-outline-secondary" type="button" onClick="check()" >수정완료</button>
						    	<button class="btn btn-outline-secondary" type="button" onClick="javascript:history.back();">취소</button>
						    	</div>
					      	</form>
					    </div>
					</div>
			    </li> 
		  	</ul>  
		</div>
	</div>
	<%@ include file="/WEB-INF/views/template/footer.jsp" %>
</body>
<script>
// // 중복확인 검사 
// $(document).ready(function(){
// 	$(phnum_btn).on("click", function(){
// 	var successNumChk=$("#successNumChk");
// 	var successNameChk=$("#successNameChk");
// if(true){
// 	console.log(aaaaa);
// }else{
// 	console.log(bbbb); 
// }
// }
// }


	var bootel=true;
	var boonick=true;
// 핸드폰 번호 확인 
$(document).ready(function(){
	var phnum_btn=$("#phnum_btn");
	$(phnum_btn).on("click", function(){
		var sm_tel = $("#user_tel").val();
		console.log(phnum_btn);
		console.log(sm_tel);
		console.log("aaaaaa");
	 		if(sm_tel == "" || sm_tel.length < 2){
	 			$(".successNumChk").text("이름은 2자 이상 8자 이하로 설정해주세요!"); 
	 			$(".successNumChk").css("color", "red"); 
	 			$("#numDoubleChk").val("false"); 
	 		}else{  
				$.ajax({ 
	 				url : '${pageContext.request.contextPath}/Mypage/mypageNumCheck?sm_tel='+sm_tel,
	 				type : 'post', 
					cache : false, 
					success : function(data) {
						if (data==0) { 
							$(".successNumChk").text("사용가능한 이름입니다."); 
							$(".successNumChk").css("color", "green"); 
							$("#numDoubleChk").val("true"); 
							bootel=true;
						} else {
							console.log("cccc");
							$(".successNumChk").text("사용중인 이름입니다 :p"); 
							$(".successNumChk").css("color", "red"); 
							$("#numDoubleChk").val("false"); 
							bootel=false;
						} 
					}, 
					error : function() {
						console.log("error"); 
					} 
				}); 
	 		} 
	});
	


// 닉네임 중복 확인 

	var dup_btn=$("#dup_btn");
	$(dup_btn).on("click", function(){
		var sm_name = $("#user_nick").val();
		console.log(dup_btn);
		console.log(sm_name);
		console.log("aaaaaa");
	 		if(sm_name == "" || sm_name.length < 2){
	 			$(".successNameChk").text("이름은 2자 이상 8자 이하로 설정해주세요 :)"); 
	 			$(".successNameChk").css("color", "red"); 
	 			$("#nameDoubleChk").val("false"); 
	 		}else{  
				$.ajax({ 
	 				url : '${pageContext.request.contextPath}/Mypage/mypageNameCheck?sm_name='+sm_name,
	 				type : 'post', 
					cache : false, 
					success : function(data) {
						if (data==0) { 
							$(".successNameChk").text("사용가능한 이름입니다."); 
							$(".successNameChk").css("color", "green"); 
							$("#nameDoubleChk").val("true"); 
							boonick=true;
							
						} else {
							console.log("cccc");
							$(".successNameChk").text("사용중인 이름입니다 :p"); 
							$(".successNameChk").css("color", "red"); 
							$("#nameDoubleChk").val("false"); 
							boonick=false;
						} 
					}, 
					error : function() {
						console.log("error"); 
					} 
				}); 
	 		} 
	});
	
});

function check(){
// 	// tel 변경유뮤 확
	var sm_tel = $("#user_tel").val();
 		if(sm_tel == "" || sm_tel.length < 2){
 			$(".successNumChk").text("이름은 2자 이상 8자 이하로 설정해주세요!"); 
 			$(".successNumChk").css("color", "red"); 
 			$("#numDoubleChk").val("false"); 
 		}else{  
			$.ajax({ 
 				url : '${pageContext.request.contextPath}/Mypage/mypageNumCheck?sm_tel='+sm_tel,
 				type : 'post', 
				cache : false, 
				success : function(data) {
					if (data==0) { 
						// 중복값이 없음== 값이 변경이 되었다 
						bootel=false;
						alert("전화번호 중복체크를 해주세요");
					} else {
						// 중복값이 있다 == 값이 변경이 일어나지 않음  
						bootel=true;
					} 
				}, 
				error : function() {
					console.log("error"); 
				} 
			}); 
			
			
			// nick 값 변경유무 
			var sm_name = $("#user_nick").val();
			console.log(dup_btn);
			console.log(sm_name);
			console.log("aaaaaa");
		 		if(sm_name == "" || sm_name.length < 2){
		 			$(".successNameChk").text("이름은 2자 이상 8자 이하로 설정해주세요 :)"); 
		 			$(".successNameChk").css("color", "red"); 
		 			$("#nameDoubleChk").val("false"); 
		 		}else{  
					$.ajax({ 
		 				url : '${pageContext.request.contextPath}/Mypage/mypageNameCheck?sm_name='+sm_name,
		 				type : 'post', 
						cache : false, 
						success : function(data) {
							if (data==0) { 
								boonick=false;
								alert("닉네임 중복체크를 해주세요");
								
							} else {
								boonick=true;
							} 
						}, 
						error : function() {
							console.log("error"); 
						} 
					}); 
	
	
				if(boonick == true && bootel == true) document.fr.submit();
}

</script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=user_sggNm]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>




