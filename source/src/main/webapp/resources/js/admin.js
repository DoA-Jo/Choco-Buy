$(document).ready(function() {
	var idx = window.location.href.lastIndexOf('/');
	var loc = window.location.href.substring(idx+1);
	var selected;
	
	if (loc == 'adminMain') {
		selected = 0;
	} else if (loc == 'adminTrade') {
		selected = 1;
	} else if (loc == 'adminChat') {
		selected = 2;
	} else if (loc == 'adminPay') {
		selected = 3;
	} else if (loc == 'adminService') {
		selected = 4;
	} else if (loc == 'adminInquiry') {
		selected = 5;
	} else {
		console.log('선택된 메뉴가 없습니다');
		return true;
	}
	document.getElementsByTagName('a')[selected].style.backgroundColor='white';
	document.getElementsByTagName('a')[selected].style.fontWeight='bold';
});
