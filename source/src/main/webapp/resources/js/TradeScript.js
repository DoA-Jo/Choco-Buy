/* tradeinsert */

	$(function () {
		$('#insertTradeBtn').click(function() {
			if($('#td_title').val() == ''||$('#td_content').val() == ''||$('#td_money').val() == '') {
				alert('빈칸을 입력하세요.');
			}else {	$("#insertTrade_do").attr("action","insertTrade").submit();	}
		});
		
	$('.slick-track').slick({
		  slidesToShow: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  prevArrow: $('.prev'),
		  nextArrow: $('.next')
		});
		$('.slick-background').slick({
		  slidesToShow: 1,
		  autoplay: true,
		  fade: true,
		  cssEase: 'linear',
		  autoplaySpeed: 2000
		});
	$('.next').click(function(){
		$('.slick-next').click();
	});
	$('.prev').click(function(){
		$('.slick-prev').click();
	});
		
		
		
	$("#chooseFile").click(function(){
		$("#uploadBtn").click();
	});
		
	});

		function loadFile(input) {
	    var file = input.files[0];	//선택된 파일 가져오기
	    //미리 만들어 놓은 div에 text(파일 이름) 추가
	    var name = document.getElementById('fileName');

	  	//새로운 이미지 div 추가
	    var newImage = document.createElement("img");
	    newImage.setAttribute("class", 'img');
	   
// 	    //이미지 source 가져오기
	    newImage.src = URL.createObjectURL(file);   
	    newImage.style.width = "70%";
	    newImage.style.height = "70%";
	    newImage.style.visibility = "visible"; 
	    newImage.style.objectFit = "contain";
		
	    //이미지를 image-show div에 추가
	    var container = document.getElementById('imageShow');
	    container.appendChild(newImage);
	    
	    $("#chooseFile").hide();
	    }