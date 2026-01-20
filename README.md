# :earth_americas: Routine_Planit :white_check_mark:
전공 팀 프로젝트로 제작한 ' 일정 관리 웹 프로그램' 입니다.

:file_folder: 프로젝트 개요
----
#### 프로그램 설명
사용자의 할 일과 일정을 한 번에 관리할 수 있는 웹프로그램이며, 캘린더위주의 UI로  사용자의 직관성을 높여 <br> 손쉽게 
일정 확인,수정,삭제기능을 수행할 수 있는 서비스입니다.

#### 프로젝트 기간
2023.04~06 : 3개월

#### 개발 도구

##### Front-end
<span>
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
</span>

##### back-end
<span>
 <img src="https://img.shields.io/badge/node.js-339933?style=for-the-badge&logo=Node.js&logoColor=white">
  <img src="https://img.shields.io/badge/jsp-F7DF1E?style=for-the-badge&logo=php&logoColor=white">
</span>

##### DB
<span>
<img src="https://img.shields.io/badge/sqlite-003B57?style=for-the-badge&logo=mysql&logoColor=white">
</span>

##### ETC
<span>
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
</span>

:pushpin: 프로그램 기능
---
* 주 기능
    * 회원가입, 로그인기능
    * 일정 추가, 삭제, 수정
    * 앱과 웹 연동
* 부가 기능 :wrench: (개발중)
    * 계획 미리 알림
    * 친구 팔로우 기능 (계획 공유)
    * 할 일 타이머 기능

:floppy_disk: DB구조
---
<img src="https://github.com/user-attachments/assets/9dac64a3-875e-4689-b700-91c5c2396e06">

* 유저 테이블,일정 테이블
* 친구 테이블 (유저ID와 다른 유저ID를 연결)
* 공유 테이블 (친구에게 보여줄 일정만 설정)

:computer: 프로그램 화면 및 소개
---

#### 회원가입, 로그인 화면
<p align="left">
  <img src="https://github.com/user-attachments/assets/2f664665-67e4-4c2c-8b9e-3b19fd698a01" width="800" >
  <img src ="https://github.com/user-attachments/assets/eb8d9b6e-3554-46cd-8094-56d1a8a874ee"width="200" height="365" >
</p>

* 맨 처음 보이는 회원 가입과 로그인 화면.
    * 처음 이용하는 유저는 회원 가입을 통해 계정을 만들고 로그인을 통해 서비스를 이용할 수 있다.

#### 메인화면
<img src ="https://github.com/user-attachments/assets/39bd070e-0b21-45b3-ad64-8e3351739e16">

* 메인 화면
    * 캘린더형식의 UI로 일정을 한 눈에 확인하고,일정 목록 팝업을 통해 일정 확인, 추가, 삭제 및 수정이 가능하다.

<img src ="https://github.com/user-attachments/assets/ffb912df-b40b-4327-9e37-2aa401966ed4">

* 일정 추가 & 작성 예시
    * 일정 폼으로 자신의 일정을 추가하고, 캘린더로 자신의 추가된 일정을 확인한다.

