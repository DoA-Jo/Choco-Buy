<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>
<header class="header">
        <div class="container">
            <div class="logoBox">
                <a href="/Trade/getTradeList" class="logo">CHOCO-BUY logo</a>
            </div>
            <div class="searchBox">
                <form action="getSearchTradeList">
                    <input type="text" class="searchInput" name="searchInput" placeholder="검색어를 입력해주세요." value="${trade.searchInput}">
                    <button type="submit" class="searchBtn">검색</button>
                </form>
            </div>
            <div class="hdMenuBox">
                <ul>
                <c:if test="${UserInfo == null}">
                    <li><a href="/Login/login">로그인</a></li>
                </c:if>
                <c:if test="${UserInfo != null}">
                    <li><a href="/Login/logout">로그아웃</a></li>
                </c:if>
                    <li><a href="/Mypage/getMypageUser">마이페이지</a></li>
                    <li><a href="/Service/getServiceList">고객센터</a></li>
                </ul>
            </div>
        </div>
    </header>
   