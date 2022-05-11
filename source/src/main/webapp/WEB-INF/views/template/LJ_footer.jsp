<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//캐시 유지 유지되어야하는 모든 페이지에 추가해야함.(대부분 공통적으로 include되는 header페이지에 많이 추가함)
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control", "no-cache");
%>

<footer class="LJ_footer">
    <div class="LJ_copy_area">
		<p>본 사이트는 교육용으로 제작된 <br class="mobile">가상의 사이트로 <br class="mobile2">실제 사용이 불가능합니다.<br>COPYRIGHT © 2022. <br class="mobile2"><a href="/index">CHOCO-BUY</a> Team DOWAJO. <br class="mobile">All rights reserved.</p>
    </div>
</footer>