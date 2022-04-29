<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <div class="menuBox">
        <div class="container">
            <div class="menuBar">
                <ul>
                    <li><a href="/Trade/getTradeList">전체</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=배달">배달</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=쇼핑">쇼핑</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=청소">청소</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=집안일">집안일</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=전문서비스">전문서비스</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=반려동물">반려동물</a></li>
                    <li><a href="/Trade/getTradeList?searchCategory=역할대행">역할대행</a></li>
                    <li>
	                    <a href="/Trade/tradeInsert">
	                    	<div class="btnBox"><button type="button" class="writeBtn">글작성하기</button> </div>
	                    </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

<div class="inquiryFixBox">
	<form class="form-signin" action="/Inquiry/GetInqList" method="post">
		<button type="submit" class="inquiryFixBtn"><span class="hover">1:1</span>문의</button>
	</form>
</div>