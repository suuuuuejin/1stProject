#  🌎FOR THE URTH (팀명: 코D카인)
---
![ezgif-2-9c82ffc4c6](https://user-images.githubusercontent.com/108103279/189067039-6123b9ff-e77e-4dbf-a5c7-84b842e8a0ae.gif)

## 👀 서비스 소개
* 프로젝트명:  윤리적 소비 정보 모아보기 및 커뮤니티 서비스
* 개발 목표: 전 세계적 환경 오염 문제로 인해 사람들의 환경에 대한 관심이 꾸준히 증가하고 있는 추세인데에 반해 
윤리적 소비에 대한 정보를 집합적으로 얻을 수 있는 곳이 많이 없는 실정이다. 
이에 윤리적 소비 전반의 정보를 얻고 공유할 수 있는 사이트를 만들어 윤리적 소비 행동을 끌어내는데에 목적을 두고 있다. 

<br>

## 📅 프로젝트 기간
2022.08.16 ~ 2022.09.05 (3주)
<br>

## ✨ 주요 기능

* 로그인, 회원가입, 마이페이지, 관리자페이지
     * 일반 로그인과 카카오 로그인
     * 등급제- 일정 포인트 도달시 다음 로그인에서 등급변경
     * 카카오 우편번호 api
     * 마이페이지- 내 등급, 포인트, 프로필수정, 내가 쓴 글, 내가 쓴 댓글, 총 글수와 댓글수
* 게시판
    * 말머리별 글 확인
    * 제목, 내용, 작성자별 검색기능
    * 좋아요 기능
    
* 지도
    * 카카오맵 api 이용하여 크롤링한 제로웨이스트&비건 샵 지도에 마커로 표시
    * 주소와 가게별 검색 기능
* 주간검색어
    * 크롤링으로 매주 인기 검색어를 수집한 후 네이버 데이터랩api를 통해 주간검색량을 추출
* 유튜브
    * api를 이용 제로웨이스트 관련 영상 수집
* 칼럼
    * 크롤링으로 제로웨이스트 관련 기사 수집, 클릭시 해당 링크로 연결

<br>

## ⛏️ 기술스택
<table>
    <tr>
        <th>구분</th>
        <th>내용</th>
    </tr>
    <tr>
        <td>사용언어</td>
        <td>
            <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white"/>
            <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/>
            <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/>
            <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
            <img src="https://img.shields.io/badge/JSON-000000?style=for-the-badge&logo=JSON&logoColor=white"/>
            <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=Python&logoColor=white"/>
            <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"/>     
        </td>
    </tr>
    <tr>
        <td>라이브러리</td>
        <td>
            <img src="https://img.shields.io/badge/BootStrap-7952B3?style=for-the-badge&logo=BootStrap&logoColor=white"/>
            <img src="https://img.shields.io/badge/KakaoMap-FFCD00?style=for-the-badge&logo=Kakao&logoColor=white"/>
            <img src="https://img.shields.io/badge/Kakao-FFCD00?style=for-the-badge&logo=Kakao&logoColor=white"/>
            <img src="https://img.shields.io/badge/Naver-03C75A?style=for-the-badge&logo=Naver&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>개발도구</td>
        <td>
            <img src="https://img.shields.io/badge/Eclipse-44A833?style=for-the-badge&logo=Eclipse&logoColor=white"/>
            <img src="https://img.shields.io/badge/Anaconda-A22846?style=for-the-badge&logo=Anaconda&logoColor=white"/>
            <img src="https://img.shields.io/badge/VSCode-007ACC?style=for-the-badge&logo=VisualStudioCode&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>서버환경</td>
        <td>
            <img src="https://img.shields.io/badge/Apache Tomcat-D22128?style=for-the-badge&logo=Apache Tomcat&logoColor=white"/>            
        </td>
    </tr>
    <tr>
        <td>데이터베이스</td>
        <td>
            <img src="https://img.shields.io/badge/Oracle 11g-F80000?style=for-the-badge&logo=Oracle&logoColor=white"/>
        </td>
    </tr>
    <tr>
        <td>협업도구</td>
        <td>
            <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white"/>
            <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/>
            <img src="https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=Notion&logoColor=white"/>
        </td>
    </tr>
</table>


<br>

## 🔗 시스템 아키텍처(구조) 예시 
![서비스 아키텍처](https://user-images.githubusercontent.com/25995055/169925538-15867bd9-aa0b-42fc-a39b-88981e926e51.png)
<br>

## 📌 SW유스케이스
![ddd](https://user-images.githubusercontent.com/108103279/189812729-56e0328f-ab1d-430f-8fbf-26f3a8483628.png)


<br>

## 📌 서비스 흐름도
![K-013](https://user-images.githubusercontent.com/108103279/189064221-4b7e02fd-683a-4618-900d-333abde5c46c.jpg)
![K-023](https://user-images.githubusercontent.com/108103279/189068303-de04cc04-3854-4a00-859b-708abfa27301.jpg)
<br>

## 📌 ER다이어그램
![K-011](https://user-images.githubusercontent.com/108103279/189063570-840cc1f9-0cd5-4cef-9fc1-21c94a573553.jpg)

<br>

## 🖥️ 화면 구성
### 🌿메인페이지
![screencapture-gjaischool-b-ddns-net-8083-ppro-main-do-2022-11-12-15_42_09](https://user-images.githubusercontent.com/108103279/201462852-fc5792f9-592c-4062-be1d-316ab5a42c98.png)
<br>

### 🌿로그인/회원가입/마이페이지
![screencapture-gjaischool-b-ddns-net-8083-ppro-loginForm-do-2022-11-12-16_30_27](https://user-images.githubusercontent.com/108103279/201463189-67a87b5b-b1a3-4562-8ca2-af28033e41c8.png)
![screencapture-gjaischool-b-ddns-net-8083-ppro-joinForm-do-2022-11-12-16_30_41](https://user-images.githubusercontent.com/108103279/201463151-cde3c44f-db86-4391-85e1-2d857df73505.png)
![screencapture-gjaischool-b-ddns-net-8083-ppro-mypageWrite-do-2022-11-12-15_43_57](https://user-images.githubusercontent.com/108103279/201461686-3849a40b-3485-4af7-b473-9485a02c9173.png)
<br>

### 🌿지도
![screencapture-gjaischool-b-ddns-net-8083-ppro-map-do-2022-11-12-15_42_35](https://user-images.githubusercontent.com/108103279/201462870-02033c86-d698-47ea-864f-101633323a09.png)
<br>

### 🌿게시판/댓글/폼형식댓글
![screencapture-gjaischool-b-ddns-net-8083-ppro-imgList-do-2022-11-12-15_43_31](https://user-images.githubusercontent.com/108103279/201463090-f5b11ee6-01be-4ec7-9a4f-2b5343bf479d.png)
![screencapture-gjaischool-b-ddns-net-8083-ppro-zwlist-do-2022-11-12-15_43_46](https://user-images.githubusercontent.com/108103279/201461748-51e60693-fa69-4373-a96d-c995d216a08b.png)
![screencapture-gjaischool-b-ddns-net-8083-ppro-buyboardView-do-2022-11-12-15_46_02](https://user-images.githubusercontent.com/108103279/201463021-256a9ff5-44bf-46ae-bb09-3dcd39f500d0.png)
![11](https://user-images.githubusercontent.com/108103279/201462995-a193c44c-5740-4487-9efa-2ddac3d1f30d.png)
<br>

### 🌿주간인기검색어
![screencapture-gjaischool-b-ddns-net-8083-ppro-weeklyView-do-2022-11-12-15_42_52](https://user-images.githubusercontent.com/108103279/201462892-6f6ccd80-4d9f-41ba-b355-c5921c3bb6ac.png)
<br>

### 🌿유튜브
![screencapture-gjaischool-b-ddns-net-8083-ppro-youtubelist-do-2022-11-12-15_43_04](https://user-images.githubusercontent.com/108103279/201462931-9ae9ccd6-2d8e-401c-b9f2-cbbd4a25921b.png)
<br>


## 👨‍👩‍👧‍👦 팀원 역할
<table>
  <tr>
    <th width="16.6%"align="center"><img src="https://user-images.githubusercontent.com/108103279/189080942-d9b161de-161f-42d9-8168-1535413d0fa5.png" width="100" height="100"/></th>
    <th width="16.6%" align="center"><img src="https://user-images.githubusercontent.com/108103279/189081182-05274d71-ad5c-46c1-9c0a-e5b41408ef72.png" width="100" height="100"/></th>
    <th width="16.6%"align="center"><img src="https://user-images.githubusercontent.com/108103279/189081198-dbba5d1b-a3e8-4ed3-969a-9bbfbd2ad9b6.png" width="100" height="100"/></th>
    <th width="16.6%"align="center"><img src="https://user-images.githubusercontent.com/108103279/189081256-f6d433aa-c9cf-4b46-a384-e4c0ab40f7c6.png" width="100" height="100"/></th>
    <th width="16.6%" align="center"><img src="https://user-images.githubusercontent.com/108103279/189081212-a0536579-14cc-4e35-a923-dcfb5c9aad30.png" width="100" height="100"/></th>
    <th width="16.6%" align="center"><img src="https://user-images.githubusercontent.com/108103279/189081168-a387ccb9-a4d9-40ba-8419-1955d76ddf56.png" width="100" height="100"/></th>
  </tr>
  <tr>
    <td width="16.6%" align="center"><strong>정대일</strong></td>
    <td width="16.6%" align="center"><strong>배수진</strong></td>
    <td width="16.6%" align="center"><strong>최정윤</strong></td>
    <td width="16.6%" align="center"><strong>이동영</strong></td>
    <td width="16.6%" align="center"><strong>정유리</strong></td>
    <td width="16.6%" align="center"><strong>임형종</strong></td>
  </tr>
  <tr>
    <td align="center"><b>Backend</b></td>
    <td align="center"><b>Backend</b></td>
    <td align="center"><b>Frontend,Backend</b></td>
    <td align="center"><b>Backend</b></td>
    <td align="center"><b>Backend</b></td>
    <td align="center"><b>Backend</b></td>
  </tr>
 <tr>
    <td align="left"><b>카카오맵 api를 이용한 지도 페이지 구현, 등급제한 게시판 구현, 관리자페이지 구현<br></b></td>
    <td align="left"><b>로그인<br>카카오로그인api<br>회원가입<br>카카오 우편번호 api<br>마이페이지<br>함께해요 게시판<br>폼형식 댓글<br>칼럼 크롤링</b></td>
    <td align="left"><b>메인페이지 디자인 및 전체적인 디자인 총괄<br></b></td>
    <td align="left"><b>카카오맵 api를 이용한 지도 페이지 구현, 게시판 및 댓글 기능 구현<br></b></td>
    <td align="left"><b>회원가입&칼럼&실천해요 게시판 디자인<br>회원가입 중복체크기능<br>마이페이지 회원정보 수정<br>회원 탈퇴<br>PPT제작<br></b></td>
    <td align="left"><b>유튜브페이, 게시판 및 댓글 기능 구현<br></b></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/Arcana12" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/suuuuuejin" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/Amarinnn" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/ldy28" target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/magnetic8 " target='_blank'>github</a></td>
    <td align="center"><a href="https://github.com/imhyeongjong " target='_blank'>github</a></td>
  </tr>
</table>
<br>
