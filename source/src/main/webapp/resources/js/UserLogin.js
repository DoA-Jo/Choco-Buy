/* 전화번호 인증 */
$(document).ready(function(){
	var code2 = ""; 
	/* 인증번호 보내기 */
	$("#phoneChk").on("click",function(){ 
		var phone = $("#phone").val(); 
		console.log(phone);
		console.log(nullCheck());
		if(nullCheck()==1){
			console.log("잘못된 회원정보, db삭제 후 회원가입 진행 합니다");
			$(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
			$(".successPhoneChk").css("color","red"); 
			$.ajax({ 
				url : '/Join/deleteUser',
				type:"POST",
				data:{"user_tel":phone},
				cache : false, 
				success : function(data) {}, 
				error : function() {console.log("실패");} 
			}); 
		}else{
			//1 = 회원, 문자인증 진행 / 0 = 비회원, '휴대폰 번호를 확인해주세요.' 알림창
			if(checkUser()==1){
				$.ajax({ 
					url:"/Login/phoneCheck", 
					type:"GET",
					data:{"phone":phone},
					cache : false, 
					success:function(data){
						alert("data: "+data);
		 				if(data == "error"){ 
		 					alert("휴대폰 번호가 올바르지 않습니다."); 
		 					$(".successPhoneChk").text("유효한 번호를 입력해주세요."); 
							$(".successPhoneChk").css("color","red"); 
							$("#phone").attr("autofocus",true); 
		 				}else{ 
							$("#phone2").attr("disabled",false); 
							$("#phoneChk2").attr("disabled",false); 
							$("#phoneChk2").css("display","inline-block"); 
							//$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.\n번호 전송은 1~2분 소요될 수 있습니다."); 
							$("#phone").attr("readonly",true); 
							code2 = data; 
						} 
					} 
				}); 
			}else{
				/* 비회원 */
				$(".successPhoneChk").text("휴대폰 번호를 확인해주세요."); 
				$(".successPhoneChk").css("color","red"); 
			}
		}
	});
	

	
	/* 번호 일치 확인, 다음 버튼 활성화 */
	$("#phoneChk2").on("click",function(){ 
		if($("#phone2").val() == code2){ 
			$(".successPhoneChk").css("color","#58a6a6"); /*220513*/
			$(".successPhoneChk").text("인증번호가 일치합니다."); 
			$("#phoneDoubleChk").val("true");
			$("#phone2").attr("disabled",true);   
			$(".login_next_btn").attr("disabled", false);
		}else{ 
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다."); 
			$(".successPhoneChk").css("color","red"); 
			$("#phoneDoubleChk").val("false"); 
			$(this).attr("autofocus",true); 
		}
	});

	/* 로그인 버튼 컨트롤러 연결 */	
	$(".login_next_btn").on("click", function(){
		$('.progress_container #twenty').attr('checked', true);
		document.login_tel.action='/Login/login';
		document.login_tel.method='post';
		document.login_tel.submit();
	});
	
	/* 로그인이 안되시나요? 연결 */
	$(".link_to_email").on("click", function(){
		location.href="/Login/writeEmail";
	});
	
	
	/* 이메일 전송 */
	$(".send_email_btn").on("click", function(){
		document.send_email.action='/Login/sendEmail';
		document.send_email.method='post';
		document.send_email.submit();
	});
});

/* 회원정보 null 확인 */
function nullCheck(){
	var phone = $("#phone").val();
	var dataNull;
	$.ajax({
		url : "/Login/UserNull",
		async: false,
  		data : {'user_tel':phone},
  		type : "POST", 
  		cache : false, 
  		success : function(data){
  			dataNull=data;
  		},
  		error : function(){console.log('실패');}
	});
	return dataNull; 
}

/* 회원확인 */
function checkUser(){
	var phone = $("#phone").val();
	var telInfo; 
	$.ajax({
		url : "/Login/getTelInfo",
		async: false,
  		data : {'user_tel':phone},
  		type : "POST", 
  		cache : false, 
  		success : function(data){
  			telInfo=data;
  			console.log("data:"+data);
  		},
  		error : function(){alert("실패");}
	});
	return telInfo;
}