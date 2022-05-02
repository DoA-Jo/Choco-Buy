<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--previous menuBar  -->
<!--    <div class="menuBox"> -->
<!--         <div class="container"> -->
<!--             <div class="menuBar"> -->
<!--                 <ul> -->
<!--                     <li><a href="/Trade/getTradeList">전체</a></li> -->
<!--                     <li><a href="/Trade/getTradeList?searchCategory=배달">배달</a></li> -->
<!--                     <li><a href="/Trade/getTradeList?searchCategory=쇼핑">쇼핑</a></li> -->
<!--                     <li><a href="/Trade/getTradeList?searchCategory=청소">청소</a></li> -->
<!--                     <li><a href="/Trade/getTradeList?searchCategory=집안일">집안일</a></li> -->
<!--                     <li><a href="/Trade/getTradeList?searchCategory=전문서비스">전문서비스</a></li> -->
<!--                     <li><a href="/Trade/getTradeList?searchCategory=반려동물">반려동물</a></li> -->
<!--                     <li><a href="/Trade/getTradeList?searchCategory=역할대행">역할대행</a></li> -->
<!--                     <li> -->
<!-- 	                    <a href="/Trade/tradeInsert"> -->
<!-- 	                    	<div class="btnBox"><button type="button" class="writeBtn">글작성하기</button> </div> -->
<!-- 	                    </a> -->
<!--                     </li> -->
<!--                 </ul> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

<!-- 20220502_edit_menuBar -->
  <div class="menuBox">
        <div class="container">
		  <ul class="nav menuNavBar categoryList">
		  	<li class="nav-item dropdown categoryItem">
		      <a class="nav-link dropdown-toggle categoryToggle" href="#" id="navbardrop" data-toggle="dropdown">전체 카테고리 </a>
		      <div class="dropdown-menu categoryDropdown">
		        <a class="dropdown-item" href="/Trade/getTradeList">전체</a>
		        <a class="dropdown-item" href="/Trade/getTradeList?searchCategory=배달">배달</a>
		        <a class="dropdown-item" href="/Trade/getTradeList?searchCategory=쇼핑">쇼핑</a>
		        <a class="dropdown-item" href="/Trade/getTradeList?searchCategory=청소">청소</a>
		        <a class="dropdown-item" href="/Trade/getTradeList?searchCategory=집안일">집안일</a>
		        <a class="dropdown-item" href="/Trade/getTradeList?searchCategory=전문서비스">전문서비스</a>
		        <a class="dropdown-item" href="/Trade/getTradeList?searchCategory=반려동물">반려동물</a>
		        <a class="dropdown-item" href="/Trade/getTradeList?searchCategory=역할대행">역할대행</a>
		      </div>
		    </li>
<!-- 		    <li class="nav-item categoryItem"><a class="nav-link" href="#">이벤트</a></li> --><!-- 추후에! -->
		    <li><span class="menuLink" >초코바이에서 원하는 모든 일을 찾으세요! </span></li>
		    <li> 
              	<a href="/Trade/tradeInsert">
            		<div class="btnBox"><button type="button" class="writeBtn">글작성하기</button> </div>
            	</a>
            </li>
	 		</ul>
        </div>
    </div>
<!-- menu -->


<div class="inquiryFixBox">
	<form class="form-signin" action="/Inquiry/GetInqList" method="post">
		<button type="submit" class="inquiryFixBtn"><span class="hover">1:1</span>문의</button>
	</form>
</div>