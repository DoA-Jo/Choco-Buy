# 프로젝트 Choco-Buy

프로젝트 명 : Choco-Buy <a href="http://chocobuy250.ml:8080/" target="_blank">(링크 / 2022.07.29까지 호스팅)</a>    
프로젝트 기간 : 2022/04/04 - 2022/05/11 (월-금 09:30 - 18:20)  

팀명 : 도와조  
팀원 : [김혜린](https://github.com/gimae1) [민성호](https://github.com/Hernameis) [민지홍](https://github.com/may-jh) 신예정 [심현정](https://github.com/jwsimhj97) [이혜미](https://github.com/Flowerdrumsong) [장우혁](https://github.com/dgh03052) 최재현

|                    이름                     |          포지션 및 담당 파트           |                 기타                  |
| :-----------------------------------------: | :------------------------------------: | :-----------------------------------: |
|     [김혜린](https://github.com/gimae1)     |         부팀장, Trade(게시글)          |              페이지 통합              |
|   [민성호](https://github.com/Hernameis)    |          팀장, Admin(관리자)           | 서비스 호스팅, 깃허브 관리, 파일 통합 |
|     [민지홍](https://github.com/may-jh)     |               Pay(결제)                |   kakao map, I'm port 결제 api 활용   |
|                   신예정                    |               Chat(채팅)               |                                       |
|   [심현정](https://github.com/jwsimhj97)    |           Inquiry(1:1 문의)            |    CSS 통합, DB 테이블 유효성 관리    |
| [이혜미](https://github.com/Flowerdrumsong) |     Join(회원가입), Login(로그인)      |     coolsms, 도로명주소 api 활용      |
|    [장우혁](https://github.com/dgh03052)    | Service(고객센터), Qna(자주 묻는 질문) |                                       |
|                   최재현                    |          Mypage(마이 페이지)           |          도로명주소 api 활용          |

<br>

## :eyes: 개요

> 생활 속의 크고 작은 불편함을,   
> 이웃과 함께 해결할 수 있는  공간

<img src="./img/chocobuy_concept.png" align="left">

<br>

## 🛠 주요 기술 스택

<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black">  <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white"> <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"> <img src="https://img.shields.io/badge/Github-181717?style=for-the-badge&logo=github&logoColor=white">  
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/AJAX-232F3E?style=for-the-badge&logo=ajax&logoColor=white"> 

|    이름     |       버전       | 기술, 버전 선택 이유                                        |
| :---------: | :--------------: | :---------------------------------------------------------- |
|    JAVA     |        8         | 실무에서 가장 많이 쓰이는 버전                              |
|   SPRING5   | 5.1.16 -> 5.1.22 | 보안 취약점 이슈                                            |
| 아파치 톰캣 |       9.0        | 하위 버전에서는 EL(Expression Language) 문법 일부 적용 안됨 |

<br>

## 🗺️ 서비스 구조



<img src="./img/was_structure.png" align="center">

<br>

## :file_folder: 디렉토리 구조

<details>
    <summary>디렉토리 상세</summary>
    <div markdown="1">


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

</details>

<br>

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

<br>

## :warning: 품질 테스트 및 피드백

품질 테스트 주체 : 학원 강사, 강의 내 다른 팀
테스트 시행일 : 2022/05/12 (프로젝트 종료 직후)

### 잘 된 점

- 휴대전화 인증으로만 로그인이 가능하게 처리하여, 서버에 최소한의 개인정보만 담게 함.

- 게시글에 사진을 업로드 하지 않았을 경우, 기본 이미지가 적용되게 한 부분.

### 보완이 필요한 부분

<details>
    <summary>UI, UX</summary>
    <div markdown="1">

- 메인 페이지
  - 메인 페이지에서 카테고리 전체가 보이면 좋겠다
  - 메인페이지에서 검색만 하려고 해도 로그인을 요구한다 **-> UI 설계 당시 의도한 부분**
  - 공지사항은 로그인을 하지 않아도 들어갈 수 있으면 좋겠다 **-> UI 설계 당시 의도한 부분**
  - 캐러셀 넣은 영역에 차지한 영역크기에 비해 이미지가 작고 슬라이드 될 때 마다 색이 변함으로, 옆 검색창에도 영향을 준다
  - 로그인을 한 후에 메인페이지가 로그인 안할 때와 다르다.(비주얼영역이 사라지고, 이질감이 든다.)
  - 검색 기능 사용할 경우 에러나는 경우 있다. 다시 사용해본 경우 잘 기능하는가 싶더니 다른 팀원 분 화면에서 오류가 나더라. (비로그인으로 검색어 기능 사용: 가방 > 에러 창으로 이동)
  - 거래화면 리스트에서 검색안됨. 산책만 됨.
- 회원가입
  - url이 노출된 경고 창이 노출됨.
- 상품 페이지
  - 텍스트박스 크기가 고정되어 있지않아서 사용자 임의로 창 크기고 조절 가능.
  - 텍스트박스 아래에는 상품에 대한 가격인지 한 눈에 알아보기가 어렵다
  - 채팅으로 거래하기 페이지로 넘어가서 채팅을 하면 입력하지 않고도 전송이 되고, 시점이 스크롤을 따라가지 않는다.
  - 게시물이 없는 카테고리 선택시 안내문구가 없는 빈 페이지가 나온다.
- 마이페이지
  - ~~거래내역페이지에 거래상대 항목에 NULL값이 들어간게 보입니다~~
  - 상품에 대한 리뷰를 보는데 과정이 불편합니다! 상품 페이지에서 리뷰를 같이 볼 수 있으면 좋을 것 간다.
  - 리뷰보기 했는데 거래내역이 나와요. 모든 사람의 거래내역이 뜨는거같은데 리뷰보기보단 거래내역이 나아보인다.
  - 마이페이지 정보수정에서 주소 수정할때 다시 로그인창으로 넘어가고 로그인 하면 메인페이지로 돌아가버리는 경우가 있다.
- 1대1 문의
  - 관리자모드에서 1:1문의 숨김처리했는데 사용자 화면에서 보여짐.

</details>

<details>
    <summary>기능</summary>
    <div markdown="1">

- 채팅 페이지
  - 약속 수정이 되지 않는다.
- 결제 페이지
  - 결제할때 개인 이메일이 아닌 사이트 이메일로 나와요. **-> 회원가입 시에 이메일 주소를 받지 않고 있습니다. 추후 회원가입 방법이 변경되면 업데이트 될 수 있습니다. **
  - 모바일에서 X누르거나, 결제가 완료되면 localhost로 페이지가 이동한다.
- 기타
  - 로그인되지 않은경우, 메인 로고를 눌러도 메인 페이지로 이동되지 않는다.

</details>

<details>
    <summary>예외처리</summary>
    <div markdown="1"> 


- 상품 페이지
  - 거래글 등록후 이미지 변경이 되지 않는다. 이미지를 잘못 등록 한 경우에는 불편할 수 있음.
  - 글 쓸 때, 금액 부분에 문자를 입력하면 에러가 발생함.
- 마이페이지
  - 리뷰보기 검색 옵션에서 내정보가 작성자인가요? 작성자(예를들어 하하) 로 검색해도 아무것도 안 나옵니다.
  - 결제내역 확인 메뉴 구매자 이름 못 끌어옴.
  - 마이페이지 리뷰보기에서 엔터 치면 에러가 발생함.

</details>


<br>
    
## :wrench: 업데이트 내역 (프로젝트 종료 이후)

|    날짜    |    분류     |                          변경 사항                           |
| :--------: | :---------: | :----------------------------------------------------------: |
| 2022.05.13 | 마이페이지  |  자신과 관련있는 거래글의 리뷰만 작성, 조회 가능하도록 수정  |
| 2022.05.13 | 결제 페이지 | 모바일 결제 기능 정상화 (메인 PG사 이니시스->다날)<br />결제 취소 기능 구현 (관리자 페이지에 버튼 추가)<br />거래 완료시 구매자 정보가 DB에 입력됨 (마이페이지에서 조회 가능)<br /> |
| 2022.05.14 | 상품 페이지 | 게시글이 없을 경우, 페이지에 글이 없다는 메세지 출력, 숨김 처리 되지 않은 글만 목록에 표시<br /> |
| 2022.05.14 | 고객센터 페이지 | 전체적인 페이지 디자인과 조화되도록 디자인 변경<br /> |
| 2022.05.14 | 로그인 페이지 | '로그인이 안 되시나요?' 링크 처리<br />로그인, 회원가입 화면에서 문자 인증 여부 출력 메세지 색상 변경<br />회원가입 시 하단(footer) 정보가 본문에 보이던 현상 수정 |
| 2022.05.14 | 회원가입 페이지 | 이제 주소 입력시에 url 경고 창 나오지 않음<br /> |





<br>
    
## :date: 다음 업데이트 예정

|       분류       |                         추가할 내용                          |
| :--------------: | :----------------------------------------------------------: |
| 회원가입 페이지  |               현재 위치 잡기, 랜덤 별명 생성기               |
|  로그인 페이지   |                   자동 로그인, 간편 로그인                   |
|  거래글 페이지   |                   거래 상세 페이지 UI 개선                   |
| 리뷰 입력 페이지 |                     상대방에게 알림기능                      |
|   채팅 페이지    | 약속잡기 주소 API 사용 , 채팅창 말풍선 디자인, 결제 여부 확인 후 결제하기 버튼 만료 |
|   결제 페이지    |                    결제수단별 PG사 다양화                    |
| 고객센터 페이지  |          메뉴바 디자인,  공지사항 상세페이지 디자인          |
| 1:1 문의 페이지  |           1대1 문의 목록 페이지 테이블 디자인 변경           |
|  관리자 페이지   | 접속 시간 등 클라이언트 요청마다 로그 파일에 누적시키기. 필요없는 주석, 출력문 제거 |



