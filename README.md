# 프로젝트 Choco-Buy

프로젝트 명 : Choco-Buy [(링크 / 2022.07.29까지)](http://chocobuy250.ml:8080/)    
프로젝트 기간 : 2022/04/04 - 2022/05/11 (월-금 09:30 - 18:20)  

팀명 : 도와조  
팀원 : [김혜린](https://github.com/gimae1) [민성호](https://github.com/Hernameis) [민지홍](https://github.com/may-jh) 신예정 [심현정](https://github.com/jwsimhj97) [이혜미](https://github.com/Flowerdrumsong) [장우혁](https://github.com/dgh03052) 최재현   

|                    이름                     |          포지션 및 담당 파트           |                 역할 외                 |
| :-----------------------------------------: | :------------------------------------: | :-------------------------------------: |
|     [김혜린](https://github.com/gimae1)     |         부팀장, Trade(게시글)          |                                         |
|   [민성호](https://github.com/Hernameis)    |          팀장, Admin(관리자)           | 호스팅, 깃허브 관리, 파일 통합, 팀 총괄 |
|     [민지홍](https://github.com/may-jh)     |               Pay(결제)                |                                         |
|                   신예정                    |               Chat(채팅)               |                                         |
|   [심현정](https://github.com/jwsimhj97)    |           Inquiry(1:1 문의)            |                                         |
| [이혜미](https://github.com/Flowerdrumsong) |     Join(회원가입), Login(로그인)      |                                         |
|    [장우혁](https://github.com/dgh03052)    | Service(고객센터), Qna(자주 묻는 질문) |                                         |
|                   최재현                    |          Mypage(마이 페이지)           |                                         |

<details markdown="1">
<summary>역할</summary>
민성호 - 팀장<br>
김혜린 - 부팀장<br>
기타 12345
</details>

## :eyes:개요

> 생활 속의 크고 작은 불편함을,   
> 이웃과 함께 해결할 수 있는  공간

<img src="./img/chocobuy_concept.png" align="left">



## :hammer:주요 기술 스택

<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white"> <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black"> <img src="https://img.shields.io/badge/Github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/MariaDB-003545?style=for-the-badge&logo=mariadb&logoColor=white"> <img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/AJAX-232F3E?style=for-the-badge&logo=ajax&logoColor=white"> 

<details>
    <summary>버전 상세</summary>
    <div markdown="1">
        <table>
            <thead>
                <th>이름</th>
                <th>버전</th>
                <th>기술, 버전 선택 이유</th>
            </thead>
            <tbody>
            	<tr>
                    <td>JAVA</td>
                    <td>8</td>
                    <td>실무에서 가장 많이 쓰이는 버전</td>
                </tr>
            	<tr>
                    <td>SPRING5</td>
                    <td>5.1.16 -> 5.1.22</td>
                    <td>보안 이슈 (5.1.22)</td>
                </tr>
            	<tr>
                    <td>아파치 톰캣</td>
                    <td>9.0</td>
                    <td>하위 버전에서는 EL(Expression Language) 문법 일부 적용 안됨</td>
                </tr>
            </tbody>
        </table>
    </div>
</details>



## 페이지 소개

### 회원가입



### 로그인

### 게시글

### 채팅

### 결제

### 마이페이지

### 1:1 문의

### 고객센터

### 관리자 페이지



## 흐름



클라이언트 요청 -> WAS (컨트롤러 -> DB 접근 -> jsp) -> 클라이언트 응답




## 디렉토리 구조

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
