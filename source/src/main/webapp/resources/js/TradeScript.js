/* tradeinsert */

	$(function () {
		$('#insertTradeBtn').click(function() {
			if($('#td_title').val() == ''||$('#td_content').val() == ''||$('#td_money').val() == '') {
				alert('빈칸을 입력하세요.');
			}else {	$("#insertTrade_do").attr("action","insertTrade").submit();	}
		});
		
	$("#chooseFile").click(function(){
		$("#uploadBtn").click();
	});
	
	$("#seeMoreListClick").click(function(){
	
	if($("#seeMoreList").attr("style") == "display : none;"){
		$("#seeMoreList").attr("style","display : block;");
		document.getElementById("seeMoreListClick").textContent = "- 접기"
		}else if($("#seeMoreList").attr("style") == "display : block;"){
		$("#seeMoreList").attr("style","display : none;");
		document.getElementById("seeMoreListClick").textContent = "+ 더보기"
		}
	});
	
	$("#reportingBtn").click(function(){
		
		alert('신고되었습니다');
	
	
	});
	
	
	
	
	    });
		
	function checkNum(Num) {
 
        var NumRegExp = /^[0-9]{2-9}$/;
        if (!NumRegExp.test(Num)) {
            alert("금액이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    }

		function loadFile(input) {
	    var file = input.files[0];	//선택된 파일 가져오기
	    //미리 만들어 놓은 div에 text(파일 이름) 추가
	    var name = document.getElementById('fileName');

	  	//새로운 이미지 div 추가
	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');
	   
// 	    //이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);   
	    newImage.style.width = "100%";
	    newImage.style.height = "100%";
	    newImage.style.visibility = "visible"; 
	    newImage.style.objectFit = "contain";
		
	    //이미지를 image-show div에 추가
	    var container = document.getElementById('imageShow');
	     container.style.height = "500px";	
	    if(document.body.offsetWidth <= 600){
	    	container.style.height = "300px";	
	    }
	    container.appendChild(newImage);
	    
	    $("#chooseFile").hide();
	    }
	    
	    
	    
	    
	    
	    
	    
	    
