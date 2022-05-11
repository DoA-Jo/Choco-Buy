# 프로젝트 Choco-Buy

프로젝트 명 : Choco-Buy [(링크 / 2022.07.29까지)](http://chocobuy250.ml:8080/)    
프로젝트 기간 : 2022/04/04 - 2022/05/11 (월-금 09:30 - 18:20)  

팀명 : 도와조  
팀원 : [김혜린](https://github.com/gimae1) [민성호](https://github.com/Hernameis) [민지홍](https://github.com/may-jh) 신예정 [심현정](https://github.com/jwsimhj97) [이혜미](https://github.com/Flowerdrumsong) [장우혁](https://github.com/dgh03052) 최재현   

|                    이름                     |          포지션 및 담당 파트           |                 기타                  |
| :-----------------------------------------: | :------------------------------------: | :-----------------------------------: |
|     [김혜린](https://github.com/gimae1)     | 부팀장, [Trade(게시글)](# 거래-페이지) |              페이지 통합              |
|   [민성호](https://github.com/Hernameis)    |  팀장, [Admin(관리자)](# 메인-페이지)  | 서비스 호스팅, 깃허브 관리, 파일 통합 |
|     [민지홍](https://github.com/may-jh)     |               Pay(결제)                |   kakao map, I'm port 결제 api 활용   |
|                   신예정                    |               Chat(채팅)               |                                       |
|   [심현정](https://github.com/jwsimhj97)    |           Inquiry(1:1 문의)            |    CSS 통합, DB 테이블 유효성 관리    |
| [이혜미](https://github.com/Flowerdrumsong) |     Join(회원가입), Login(로그인)      |     coolsms, 도로명주소 api 활용      |
|    [장우혁](https://github.com/dgh03052)    | Service(고객센터), Qna(자주 묻는 질문) |                                       |
|                   최재현                    |          Mypage(마이 페이지)           |          도로명주소 api 활용          |



## :eyes: 개요

> 생활 속의 크고 작은 불편함을,   
> 이웃과 함께 해결할 수 있는  공간

<img src="./img/chocobuy_concept.png" align="left">



## 🛠 주요 기술 스택

<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"> <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black"> <img src="https://img.shields.io/badge/Github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/AJAX-232F3E?style=for-the-badge&logo=ajax&logoColor=white"> 

|    이름     |       버전       | 기술, 버전 선택 이유                                        |
| :---------: | :--------------: | :---------------------------------------------------------- |
|    JAVA     |        8         | 실무에서 가장 많이 쓰이는 버전                              |
|   SPRING5   | 5.1.16 -> 5.1.22 | 보안 이슈 (5.1.22)                                          |
| 아파치 톰캣 |       9.0        | 하위 버전에서는 EL(Expression Language) 문법 일부 적용 안됨 |

### 

## 🗺️ 서비스 구조



클라이언트 요청 -> WAS (컨트롤러 -> DB 접근 -> jsp) -> 클라이언트 응답 (이미지로 대체 예정)



## :airplane: 페이지 소개

<details>
    <summary>메인 페이지</summary>
    <div markdown="1">
<img src="./img/ppt/index.PNG" align="center">

</details>

<details>
    <summary>회원가입/로그인 페이지</summary>
    <div markdown="1">

<img src="./img/ppt/join1.PNG" align="center">

<img src="./img/ppt/join2.PNG" align="center">

<img src="./img/ppt/login1.PNG" align="center">

</details>

<details>
    <summary>거래 페이지</summary>
    <div markdown="1">

<img src="./img/ppt/trade1.PNG" align="center">

<img src="./img/ppt/trade2.PNG" align="center">

<img src="./img/ppt/trade3.PNG" align="center">

</details>

<details>
    <summary>채팅 페이지</summary>
    <div markdown="1">

<img src="./img/ppt/chat1.PNG" align="center">

<img src="./img/ppt/chat2.PNG" align="center">

<img src="./img/ppt/chat3.PNG" align="center">

</details>

<details>
    <summary>결제 페이지</summary>
    <div markdown="1">

<img src="./img/ppt/pay1.PNG" align="center">

<img src="./img/ppt/pay2.PNG" align="center">

</details>

<details>
    <summary>마이 페이지</summary>
    <div markdown="1">

<img src="./img/ppt/mypage1.PNG" align="center">

<img src="./img/ppt/mypage2.PNG" align="center">

</details>

<details>
    <summary>1:1 문의 페이지</summary>
    <div markdown="1">

<img src="./img/ppt/inquiry1.PNG" align="center">

<img src="./img/ppt/inquiry2.PNG" align="center">

<img src="./img/ppt/inquiry3.PNG" align="center">

</details>

<details>
    <summary>고객센터 페이지</summary>
    <div markdown="1">

<img src="./img/ppt/service1.PNG" align="center">

<img src="./img/ppt/service2.PNG" align="center">

<img src="./img/ppt/service3.PNG" align="center">

</details>

<details>
    <summary>관리자 페이지</summary>
    <div markdown="1">

<img src="./img/ppt/admin1.PNG" align="center">

</details>

<details>
    <summary>반응형</summary>
    <div markdown="1">

<img src="./img/ppt/response1.PNG" align="center">

<img src="./img/ppt/response2.PNG" align="center">

<img src="./img/ppt/response3.PNG" align="center">

</details>

## :date: 업데이트 예정

관리자 페이지 : 접속 로그 파일로 남기기  
로그인 페이지 : 자동 로그인, 간편 로그인  
회원가입 페이지 : 현위치 잡기, 랜덤 별명 생성기  
결제 페이지 : 결제수단별 PG사 다양화  
리뷰 입력 페이지: 상대방에게 알림기능  
고객센터 페이지 : 메뉴바 디자인,  공지사항 상세페이지 디자인




## :file_folder: 디렉토리 구조

```
└─src
    └─main
        ├─java
        │  └─com
        │      ├─chocobuy
        │      │  ├─biz
        │      │  │  ├─admin
        │      │  │  │  └─impl
        │      │  │  ├─chat
        │      │  │  │  └─impl
        │      │  │  ├─inquiry
        │      │  │  │  └─impl
        │      │  │  ├─pay
        │      │  │  │  └─impl
        │      │  │  ├─qna
        │      │  │  │  └─impl
        │      │  │  ├─service
        │      │  │  │  └─impl
        │      │  │  ├─trade
        │      │  │  │  └─impl
        │      │  │  ├─user
        │      │  │  │  └─impl
        │      │  │  └─util
        │      │  └─view
        │      │      └─controller
        │      └─my
        │          └─web
        │              └─interceptor
        ├─resources
        │  └─mappings
        └─webapp
            ├─resources
            │  ├─css
            │  ├─img
            │  │  ├─ban
            │  │  ├─common
            │  │  ├─profileImg
            │  │  ├─serviceImg
            │  │  └─upload
            │  └─js
            └─WEB-INF
                ├─config
                └─views
                    ├─Admin
                    ├─Chat
                    ├─error
                    ├─Inquiry
                    ├─Join
                    ├─Login
                    ├─Mypage
                    ├─Pay
                    ├─popup
                    ├─Service
                    ├─template
                    └─Trade
```
