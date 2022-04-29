$(document).ready(function (){

	/* 전화번호 인증 */
	var code2 = ""; 
	$("#phoneChk").on("click",function(){ 
		var phone = $("#phone").val();
		if(checkUser()==0){ 
			$.ajax({ 
				url:"/Join/phoneCheck", 
				type:"POST",
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
						$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오."); 
						$("#phone").attr("readonly",true); 
						code2 = data; 
					} 
				} 
			}); 
		}else{
			$(".successPhoneChk").text("이미 가입된 번호입니다."); 
			$(".successPhoneChk").css("color","red"); 
		}
	});

	/* 번호 일치 확인, 다음 버튼 활성화 */
	$("#phoneChk2").on("click",function(){ 
		if($("#phone2").val() == code2){ 
			alert("일치합니다.");
			$(".successPhoneChk").text("인증번호가 일치합니다."); 
			 $("#phoneDoubleChk").val("true");
			$("#phone2").attr("disabled",true);   
			$(".tel_next_btn").attr("disabled", false);
		}else{ 
			$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
			$(".successPhoneChk").css("color","red"); 
			$("#phoneDoubleChk").val("false"); 
			$(this).attr("autofocus",true); 
		}
	});
	
	
	/* 닉네임 인증 */
	$("#dup_btn").on("click",function(){ 
		var user_nick=$("#user_nick").val(); 
		console.log("user_nick: "+user_nick);
		if(user_nick == "" || user_nick.length < 2){ 
			$(".successNameChk").text("이름은 2자 이상 8자 이하로 설정해주세요 :)"); 
			$(".successNameChk").css("color", "red"); 
			$("#nameDoubleChk").val("false"); 	
		}else{ 
			$.ajax({ 
				url : '/Join/NameCheck',
				data:{"user_nick":user_nick},
				cache : false, 
				success : function(data) { 
					if (data == 0) { 
						$(".successNameChk").text("사용가능한 별명입니다."); 
						$(".successNameChk").css("color", "green"); 
						$("#nameDoubleChk").val("true"); 
						$(".nick_next_btn").attr("disabled", false);
					} else { 
						console.log(data);
						$(".successNameChk").text("이미 사용중인 별명입니다."); 
						$(".successNameChk").css("color", "red"); 
						$("#nameDoubleChk").val("false"); 
					} 
				}, 
				error : function() { 
					console.log("실패"); 
				} 
			}); 
		} 
	});
	

	
    /* 약관동의 다음 버튼 토글 */
    $('#agree_cbox').on("click", function(){
    console.log("clicked");
        if(!$(this).is(":checked")){
        	$(".agree_next_btn").attr("disabled", true);
        }else{
        	$(".agree_next_btn").attr("disabled", false);
        }
	});

	
	/* JoinAgree [다음] 버튼 submit */
	$(".agree_next_btn").on("click", function(){
		location.href='/Join/joinTel';
	});
	
	
	/* JoinTel [다음] 버튼 submit */
	$(".tel_next_btn").on("click", function(){
		document.join_tel.action='/Join/JoinTel';
		document.join_tel.method='post';
		document.join_tel.submit();
	});
	
	/* JoinArea [다음] 버튼 submit */
	$(".area_next_btn").on("click", function(){
		if($("#user_siNm")!=null&&$("#user_sggNm")!=null&&$("#user_emdNm")!=null){
			document.form.action ='/Join/JoinArea';
			document.form.method='post';
			document.form.submit();
		}
	});
	
	/* JoinNick 프로필 사진 변경 */
    $('.pImg_edit_btn').on("click", function(){
    	console.log("click!!");
    	$('.pImg .pImg_box').show(function(){
    		 $('.pImg_edit_btn').on("click", function(){
    		 	$('.pImg .pImg_box').hide();
    		 });
    	});
    });

    $('.pImg_box .pImg_list ul li img').click(function(){
        var clicked=$(this).attr('name');
        $('.pImg_default').css("background-image","url('/resources/img/profileImg/"+clicked+"')");
        $('.pImg_name').attr("value",clicked);
        $('.pImg .pImg_box').hide();
    })
    
    /*왜잇을까*/
    $('.nick_next_btn').on("click",function(){
        var pImgName=$('.pImg_default').attr('name');
    });
	
	/* JoinNick [다음] 버튼 submit */
	$(".nick_next_btn").on("click", function(){
	console.log("다음 버튼");
		if(user_nick!=null){
			alert("if");
			document.join_nick.action ='/Join/JoinNick';
			document.join_nick.method='post';
			document.join_nick.submit();
		}
	});


	/* join_done.jsp */
	$(".done_next_btn").on("click", function(){
		console.log("clicked");
		document.join_done.action='/Join/JoinDone';
		document.join_done.method='post';
		document.join_done.submit();
	});
	
});

/* 회원확인 */
function checkUser(){
	console.log("checkUser() 실행");
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

/* 주소 인증 */
function goPopup(){
	var url = location.href;
	alert(url);
	var inputYn= "${inputYn}";
	var confmKey = "devU01TX0FVVEgyMDIyMDQwNzE1NTgzMTExMjQzNTk=";
	var resultType = "1"; // 도로명주소 검색결과 화면 출력내용, 1 : 도로명, 2 : 도로명+지번+상세보기(관련지번, 관할주민센터), 3 : 도로명+상세보기(상세건물명), 4 : 도로명+지번+상세보기(관련지번, 관할주민센터, 상세건물명)
	
	if(inputYn != "Y"){
		document.form2.confmKey.value = confmKey;
		document.form2.returnUrl.value = url;
		document.form2.resultType.value = resultType;
		document.form2.action= "https://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		document.form2.submit();
		document.querySelector('.area_next_btn').setAttribute('disabled','false');
	} 
	
}