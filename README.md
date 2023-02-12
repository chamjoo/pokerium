# 포케리움 PoKéRíum
![image](https://user-images.githubusercontent.com/87980087/216052147-20417d79-79e1-4e3a-b482-edc5da445603.png)


<details>
  <summary><h3>1. 아이템 선정</h3></summary
<p>웹의 기본이되는 CRUD게시판과 쇼핑몰을 개발후 기능을 하나씩 추가해 나가는 식으로 진행.<p>
</details>

<details>
  <summary><h3>2. 개요</h3></summary>

- 프로젝트 명칭 : 포케리움(PoKéRíum)
- 개발인원 : 2명 (박창주, 배준호)
- 개발기간 : 2023.01.08 ~ 2023.~ (진행중)
- 주요 기능 : 
  - 사용자 - 회원가입 및 로그인, 회원 정보 수정, 유효성 검사 및 중복 검사, Aop를 통해 비밀번호 암호화
  - 마이페이지 - 회원정보 확인 및 수정, 장바구니, 구매내역
  - 게시판 - CRUD 기능, 조회수, 페이징 및 검색 처리
  - 댓글 및 무한답글(대댓글) - CRUD 기능 
  - 쇼핑몰 - 상품목록, 검색, 상품 상세페이지, 장바구니, 구매
  - 도감 - 포켓몬목록, 포켓몬상세정보
- 개발 언어 : Java 1.8
- 개발 환경 : Springframework 5.0.6, maven 4.0.0, mybatis 3.3.0, mybatis-spring 1.2.2, jstl 1.2, aspectjweaver 1.8.8
- 데이터베이스 : MySQL
- 형상관리 툴 : GitHub
- 간단 소개 : 포켓몬을 좋아하는 신입개발자 둘이서 개발하는 전반적인 웹 쇼핑몰
</details> 
  
<details>
  <summary><h3>3. 요구사항 분석</h3></summary>

  **1. 회원 가입 페이지**
  


- **유효성 검사**
    - 한 개의 칸이라도 공백 혹은 빈칸이 있는지 확인하고 있다면, "OOO를 입력해주세요."라는 메시지 출력
    - 비밀번호와 비밀번호 확인이 다를경우 “위에 입력한 비밀번호와 동일한 비밀번호를 입력해주세요.” 라는 메시지 출력
- **중복확인**
    - 데이터베이스에 존재하는 아이디(닉네임)를 입력한 채 확인 버튼을 누른 경우 "OOO는 사용 불가능한 아이디(닉네임)입니다."의 메시지를 출력


**2. 로그인 페이지**


- **로그인을 하지 않은 경우 아래 페이지만 이용가능**
    - 회원가입 페이지
    - 로그인 페이지
    - 커뮤니티 페이지
    - 포켓몬 도감 페이지
    - 쇼핑몰 페이지
    - 그 외 로그인을 하지 않거나 올바르지 않은 경로로 접속한 사용자가 로그인이 필요한 경로에 접속한 경우 로그인 페이지로 이동
- **로그인 검사**
    - 아이디와 비밀번호가 일치하지 않을 시 "로그인에 실패하였습니다. 아이디와 패스워드를 확인해주세요. "의 메시지 출력
    - 모든 검사가 통과되었다면 로그인 후 index 페이지로 이동
- **로그인을 하였을때 최근 접속일 업데이트**

**3. 회원정보 수정**

- 회원정보 수정은 닉네임, 이메일 비밀번호, 주소, 팀변경 가능
- 기존 비밀번호를 입력하지 않은경우 “기존 비밀번호를 입력해주세요”의 메시지 출력
- 닉네임이 중복확인을 통해 중복일 경우 “OOO는 사용 불가능한 닉네임 입니다.” 메시지 보여주고 현재 닉네임일경우 “OOO는 현재 닉네임입니다.”라는 메시지 출력
- 닉네임은 최소 1-10자이며, 특수문자를 제외한 한글 (ㄱ-ㅎ, 가-힣), 알파벳 대소문자(a-z, A-Z), 숫자(0-9)만 가능
- 비밀번호 수정 또한 최소 8자~16자이며, 영문 대 소문자, 숫자, 특수문자를 사용
- 수정 완료 시 수정 날짜 업데이트
- 회원 탈퇴시 “정말 회원 탈퇴하시겠습니까? 탈퇴하면 영구적으로 되돌릴수 없습니다.”라는 선택메시지 출력

**4. 커뮤니티 - 자유게시판**

- 자유게시판은 게시글일련번호로 역순 정렬하여 한 페이지에 10개씩 출력
- 로그인하지 않은 상태 일 경우 게시물등록 버튼 미출력
- 로그인하지 않은 상태 일 경우 게시물수정 및 삭제 버튼이 출력되지않고,
로그인한 상태일경우 게시물 등록아이디와 로그인한 아이디를 비교하여 버튼출력여부 결정
- 제목과 아이디로 검색하는 기능
- 게시판 제목을 클릭하여 게시물 상세페이지로 이동할경우 조회수 증가
- 게시물을 수정할경우 수정일시 업데이트 및 페이지 내에서 출력
- 전체 게시물/조회된 게시물 수 카운트하여 출력
- 게시글 등록이나 수정시 제목과 내용에 공백으로 작성 불가

**5. 커뮤니티 - 자유게시판 댓글 및 무한답글(대댓글)**

- 로그인하지 않은 상태 일 경우 답글달기 버튼 미출력
- 답글이 달릴경우 부모댓글로부터 들여쓰기
- 최신답글일수록 아래에 출력

**6. 쇼핑몰 (미구현 - 추후 개발예정)**

**7. 포켓몬 도감 (미구현 - 추후 개발예정)**

</details>  

<details>
  <summary><h3>4. DB설계</h3></summary>
 
![image](https://user-images.githubusercontent.com/87980087/218303330-5ec06c64-bef2-4cab-a729-67a124506de5.png)

  
  <br>
  
  
  ![image](https://user-images.githubusercontent.com/87980087/216067006-06a1a103-bc11-4410-ad9f-f52e0c0f8147.png)
  
  <br>
  
   ![image](https://user-images.githubusercontent.com/87980087/216067418-5840e6ee-2306-4d0d-9034-f0bc0915dcf6.png)
  
 </details>
 
 <details>
  <summary> <h3>5. API설계</h3></summary>
  
  ![image](https://user-images.githubusercontent.com/87980087/216059855-fb2306a2-afed-49f4-bd48-d310e630ca59.png)

  <br>
  <br>
  
  ![image](https://user-images.githubusercontent.com/87980087/216059941-63ee16a2-aac7-448a-9fc2-f62a78f34e1f.png)

</details>

  <details>
  <summary><h3>6. 화면결과물</h3></summary>
  
  **1. 메인 페이지**
  
  ![image](https://user-images.githubusercontent.com/87980087/216060159-95aca0d4-7ec2-4dba-beb0-15a8f1d4419e.png)

<br>
헤더,바디,푸터로 구성되어있고 바디 맨위에는 이미지슬라이드기능이 구현되어있다.

(소식관련 페이지를 추가로 개발예정)
  
  <br>
  
  **2. 회원관련**

- 로그인 페이지

![image](https://user-images.githubusercontent.com/87980087/216060470-ee74f7d7-a696-4e4c-a644-0906fad893ce.png)

<br>

![image](https://user-images.githubusercontent.com/87980087/216060644-989e872c-55d8-4c71-91ac-530229552e2c.png)

<br>

  <p align="center">로그인 전 (헤더)</p>
  
 <br>
 
 ![image](https://user-images.githubusercontent.com/87980087/216060736-463cde9c-c06c-46ae-96d9-d2075ef213af.png)
 
 <br>
 
  <p align="center">로그인 후 (헤더에 가입시 선택한 팀이 보이고 마이페이지버튼이 생김)</p>
  <br><br>
  
  - 회원가입 페이지
  
  ![image](https://user-images.githubusercontent.com/87980087/216061147-c78ef3ac-0b6a-4c85-adb9-f1ff81cd7dc6.png)

<br>
<p align="center">아이디와 닉네임 중복확인을 할수있다.</p>

![image](https://user-images.githubusercontent.com/87980087/216061302-e12fc162-838f-4827-9894-f9b486d2ec7c.png)

<br>

![image](https://user-images.githubusercontent.com/87980087/216061344-6c553950-f5e4-461e-9a9d-d383d60baacb.png)
<p align="center">다음 주소API를 통해 주소를 입력할 수 있다.

 <br><br><br>
 
 - 회원정보 수정 페이지
 
세션에 등록된 정보들을 불러오고 정보를 수정할수있다.
 
 ![image](https://user-images.githubusercontent.com/87980087/216062992-6a9adc48-9bf4-4915-acb7-83d2836b8caa.png)
 
 <br>
 <p align="center">닉네임 변경시 중복검사 기능이 있다.</p>
 
![image](https://user-images.githubusercontent.com/87980087/216063032-791db487-d733-40eb-b167-58fd41b78423.png)
![image](https://user-images.githubusercontent.com/87980087/216063311-d6b5a654-59a8-4670-b091-22ab2444bcde.png)

 
 <br><br>
  
  **3. 자유게시판 관련**
  
  - 자유게시판 목록 페이지
  
 <br>
 
 ![image](https://user-images.githubusercontent.com/87980087/216064030-78dac428-178a-4db7-9cf9-233e66845e75.png)

 <p align="center">로그인상태시 게시글등록버튼이 노출된다.</p>

<p align="center">제목 및 아이디로 게시물 검색이 가능하다.</p>

<p align="center">한 페이지에 10개의 게시물이 조회된다.</p>

<p align="center">(개발예정)</p>

<p align="center">-한페이지에 조회되는 게시물수를 변경하는 셀렉트박스</p>

<p align="center">-정렬방식을 변경하는 셀렉트박스</p>

<p align="center">-제목에 총댓글수 표시 </p>
 
 <br><br>
 
- 게시물 등록 페이지

![image](https://user-images.githubusercontent.com/87980087/216064400-957b730b-20dd-43bf-876e-c7e82a1c2f94.png)

<p align="center">제목과 내용이 빈칸일시 입력하라는 메세지가 표출된다.</p>

<br><br>

- 게시물 상세정보 페이지

![image](https://user-images.githubusercontent.com/87980087/216064548-ff1b4fb2-2173-41d5-943b-e8afb670af7a.png)

<p align="center">게시물을 작성한아이디와 로그인한 아이디가 동일할 경우 삭제,수정버튼이 화면에 표출된다.</p>

<p align="center">게시물을 수정한적이 있을경우 수정일시가 표출된다.</p>

![image](https://user-images.githubusercontent.com/87980087/218304890-5d93881c-9c27-4480-953e-bca97475d8da.png)

<p align="center">비로그인 상태일시 댓글 및 답글을 등록할수 없음</p>

<br><br>

![image](https://user-images.githubusercontent.com/87980087/218304959-4ab0369d-a881-434e-be03-2b3805c4564c.png)

<p align="center">댓글 등록시 화면에 표출, 답글시 부모댓글에 들여쓰기가 됨 </p>

<br>
</details>

<h3>7. 개발내용</h3>
- Github 코드 링크
    
 [https://github.com/chamjoo/pokerium](https://github.com/chamjoo/pokerium)

