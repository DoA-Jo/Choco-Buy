<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/head.jsp" %>   
<script>
function init(){
	if('${inputYn}'=='Y'){
		$('.area_next_btn').removeAttr('disabled');
	}
	document.querySelector('.progress_container > #sixty').setAttribute('checked',true);
}
</script>
<title>글 상세</title>
<style>
/* .inner {width: 700px;height: 100%;margin: 100px auto;padding-bottom: 20px;border-bottom: 1px solid gray;position: relative;} */
body {margin: 0;padding: 0;}
h1 {font-size: 35px; margin:30px auto; text-align: center;padding-bottom: 10px;}
.btn-info {border-radius: 0;height: 30px;padding: 5px;font-size: 14px;position:absolute;top: 91px;right: 5px;border-radius: 5px;}
table {margin: 60px auto 0px auto;width: 500px;}
table input, table textarea {width: 100%;}
table button {border: none;background-color: #fff}
.btn{display: flex; margin:5px;}
.btn-outline-secondary {background-color:#831616; color: white;}
.btn-outline-secondary:hover {background-color:#4B0E0E; color: white;}
.mylogo {width: 200px; height: 200px; background: url("/resources/img/img_avatar3.png") no-repeat; background-size: 200px; display: inline-block; margin-top: 15px;}
.item-content{background-color: #ddd;}
#aa{font-size: 20px; background-color:#58a6a6 }
.list-group{margin-top: 50px;}
button.btn.btn-outline-secondary {
    margin: 0;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/template/header.jsp" %>
	<div class="inner">
		<div class="container mt-3">
		   <ul class="list-group">
		   		<li class="list-group-item" id="aa">내 정보 수정</li>
			    <li class="list-group-item item-content">
					<div class="row">
					    <div class="col-sm-3"> <img class="mylogo"></div>
				    	<div class="col-sm-9">
				    		<form name="form2" method="post">
								<input type="hidden" id="confmKey" name="confmKey" value=""/>
								<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
								<input type="hidden" id="resultType" name="resultType" value=""/>
							</form>
							<form action="form"  name="form">
						 	</form>
						 	<form action="/Mypage/updateMypageUser" method="post" name="fr">
								<div id="list"></div>
								<div id="callBackDiv">
									<div class="input-group mb-2">
									   <input type="text" id="user_siNm" class="form-control"  name="user_siNm" value="${siNm }"  placeholder="${user.user_siNm}" disabled />
									   <input type="text" id="user_sggNm" class="form-control"  name="user_sggNm" value="${sggNm }" placeholder="${user.user_sggNm}" disabled />
									   <input type="text" id="user_emdNm" class="form-control"  name="user_emdNm" value="${emdNm }" placeholder="${user.user_emdNm}" disabled />
								    	<div class="input-group-append"><button  type="button" class="btn btn-outline-secondary" onClick="goPopup();" >수정하기</button> </div>
							   		</div>
							    </div>
						    	<div class="form-group">
		                        	<span class="point successNumChk">번호는 2자 이상 8자 이하로 설정해주시기 바랍니다.</span> 
						      		<input id="user_tel" class="form-control" type="text"  name="user_tel" value="${user.user_tel}" placeholder="${user.user_tel}" maxlength="20" >
<!-- 						      		<input id="phnum_btn" type="button" value="중복확인"  >  -->
			                		<input type="hidden" id="NumDoubleChk"/> 
						    	</div>
						    	<div class="form-group">
			                		<span class="point successNameChk">이름은 2자 이상 8자 이하로 설정해주시기 바랍니다.</span> 
						      		<input id="user_nick" class="form-control" type="text" name="user_nick" value="${user.user_nick}" placeholder="${user.user_nick}" maxlength="20" title="8자 까지 입력" required autofocus/>
<!-- 						      		<input id="dup_btn" type="button" value="중복확인" > -->
			                		<input type="hidden" id="nameDoubleChk"/> 
						    	</div>
						    	<div class="btn">
						    	<button class="btn btn-outline-secondary" type="button" onClick="check()" >수정완료</button>
							    <button class="btn btn-outline-secondary" type="button" onClick="location.href='getMypageUser'">취소</button>
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
var bootel=true;
var boonick=true;
var checktel = false;
var checknick = false; 

$(document).ready(function(){ 
var phnum_btn=$("#phnum_btn");
	$("#user_tel").keyup(function(){
	bootel=false;
	checktel = false
	var sm_tel = $("#user_tel").val();
 		if(sm_tel == "" || sm_tel.length < 2){
 			$(".successNumChk").text("이름은 2자 이상 8자 이하로 설정해주세요!"); 
 			$(".successNumChk").css("color", "red"); 
 			$("#numDoubleChk").val("false"); 
 			checktel = false;
 		}else{  
			$.ajax({ 
 				url : '${pageContext.request.contextPath}/Mypage/mypageNumCheck?sm_tel='+sm_tel,
 				type : 'post', 
				cache : false, 
				success : function(data) {
					if (data==0) { 
						$(".successNumChk").text("사용가능한 번호입니다."); 
						$(".successNumChk").css("color", "green"); 
						$("#numDoubleChk").val("true"); 
						checktel = true;
					} else {
						console.log("cccc");
						$(".successNumChk").text("사용중인 번호입니다 :p"); 
						$(".successNumChk").css("color", "red"); 
						$("#numDoubleChk").val("false");
						checktel = false;
					} 
				}, 
				error : function() {
					console.log("error"); 
				} 
			}); 
 		} 
	});


	//닉네임 중복 확인 
	var dup_btn=$("#dup_btn");
	$("#user_nick").keyup(function(){
	boonick=false;
	checknick = false;
	var sm_name = $("#user_nick").val();
 		if(sm_name == "" || sm_name.length < 2){
 			$(".successNameChk").text("이름은 2자 이상 8자 이하로 설정해주세요 :)"); 
 			$(".successNameChk").css("color", "red"); 
 			$("#nameDoubleChk").val("false"); 
 			checknick = false;
 		}else{  
			$.ajax({ 
 				url : '${pageContext.request.contextPath}/Mypage/mypageNameCheck?sm_name='+sm_name,
 				type : 'post', 
				cache : false, 
				success : function(data) {
						console.log(data);
					if (data==0) { 
						$(".successNameChk").text("사용가능한 이름입니다.");
						$(".successNameChk").css("color", "green"); 
						$("#nameDoubleChk").val("true"); 
						checknick = true;
					} else {
						console.log("cccc");
						$(".successNameChk").text("사용중인 이름입니다 :p"); 
						$(".successNameChk").css("color", "red"); 
						$("#nameDoubleChk").val("false");
						checknick = false;
					} 
				}, 
				error : function() {
					console.log("error"); 
				} 
			}); 
 		} 
	});

});



function check() {
var sm_name = $("#user_nick").val();   
var sm_tel = $("#user_tel").val();

		if(bootel == true && boonick == true){
				document.fr.submit();
		}
		if(bootel==false && boonick==true){
			$.ajax({ 
				url : '${pageContext.request.contextPath}/Mypage/mypageNumCheck?sm_tel='+sm_tel,
				type : 'post', 
				cache : false, 
				success : function(data) {
					if (data==0 && checktel==true) {   
						alert("핸드폰 번호 수정 완료");
						document.fr.submit();
					}else{		
						alert("핸드폰 번호가 중복 되었습니다");
					} 
				}, 
			}); 
		}
		
		if(boonick==false && bootel==true){
			$.ajax({ 
 				url : '${pageContext.request.contextPath}/Mypage/mypageNameCheck?sm_name='+sm_name,
 				type : 'post', 
				cache : false, 
				success : function(data) {
					if (data==0 && checknick==true) {  
						alert("닉 네임 수정 완료");
						document.fr.submit();
					} else {        
						alert("닉 네임이 중복 입니다");
					} 
				}, 
			}); 
		}
		
		if(boonick==false && bootel==false && checktel==true && checknick == true){
			alert("핸드폰 번호와 닉네임 수정 완료");
			document.fr.submit();
		}
}



/* 주소 인증 */
function goPopup(){
	var url = location.href;
// 	alert(url);
	var inputYn= "${inputYn}";
	var confmKey = "devU01TX0FVVEgyMDIyMDQwNzE1NTgzMTExMjQzNTk=";
	var resultType = "1"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	
	if(inputYn != "Y"){
		document.form2.confmKey.value = confmKey;
		document.form2.returnUrl.value = url;
		document.form2.resultType.value = resultType;
		document.form2.action= "https://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		document.form2.submit();
	} 
}
</script>

</html>





