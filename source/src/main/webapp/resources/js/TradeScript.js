/* tradeinsert */

	$(function () {
		$('#insertTradeBtn').click(function() {
			if($('#td_title').val() == ''||$('#td_content').val() == ''||$('#td_money').val() == '') {
				alert('빈칸을 입력하세요.');
			}else {	$("#insertTrade_do").attr("action","insertTrade").submit();	}
		});
	});
