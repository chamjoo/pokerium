<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/icon/icon_ball_c.ico">
<title>포케리움 :: PoKéRíum</title>

<style>


section {
	background-color:#f7f7f7;
	padding:80px;
}
::placeholder { 
	color:#bbb;
	font-weight: bold;  
}
#myPageDiv {
	display:block;
	margin:0 auto;
	width:1200px;
	height:1100px;
	padding:50px 50px 100px 50px;
	line-height:30px;
	background-color:#ffffff;
}

.h1key {
	display:inline-block;
	width:20%;
	font-size:25px;
	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
}
.h1value {
	display:inline-block;
	width:25%;
	margin-left:10px;
	font-weight: bold;                         
	font-family: "Trebuchet MS", Dotum, Arial;
	font-size:20px;
	color:#929292;
}

#myPageDiv input[type=text], #myPageDiv input[type=password],#myPageDiv input[type=email] {
	width:70%;
	height:60px;
	margin:10px;
	border:1px solid #bbb;
	border-radius:0;
	font-size:20px;
	padding-left:30px;                        
	font-family: "Trebuchet MS", Dotum, Arial;
}
#myQnA {
	float:right;
	margin:0;
	cursor:point;
}
#memberDrop {
	display:block;
	cursor:point;
}

#submitBtn {
	display:block;
	background:url(/resources/img/icon/edit.png);
	background-repeat : no-repeat;
	width:500px;
	height:80px;
	border:0;
	cursor:pointer;
	margin:0 auto;
}

</style>
	
</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>

<script>
function chkValue(frm){    
    var miPwd = frm.miPwd.value;      
    var new_miPwd = frm.new_miPwd.value;
    var new_miPwd_re = frm.new_miPwd_re.value;
    var miEmail = frm.miEmail.value; 


    if (miEmail == ""){
       	alert("이메일을 입력해주세요.");               frm.miEmail.focus();   return false;
    }
    
    if (miPwd == ""){
       	alert("기존 비밀번호를 입력해주세요.");               frm.miPwd.focus();   return false;
    }
    
    
    if (new_miPwd_re != new_miPwd){
       	alert("입력한 비밀번호가 서로 다릅니다. 다시 확인해주세요.");               frm.new_miPwd_re.focus();   return false;
    }

    return true;
}

	function isDrop() {
		if(confirm("정말 회원 탈퇴 하시겠습니까?\n탈퇴하면 영구적으로 되돌릴수 없습니다.")){
			location.href="/member/memberDrop";
		}
	}
	
</script>

	<section>
	<div id="myPageDiv">
	<form id="myPageForm" action="/member/memberUpdate" method="post" onsubmit="return chkValue(this);">
		
			<div style="padding:20px 0 20px 0; width:100%;">
			<H1 style="display:inline;font-size:35px;">마이페이지</H1><a href=""><img src="/resources/img/icon/myQnA.png" id="myQnA" /></a></div>
			<hr>
			
			<h1 class="h1key">아이디</h1> <h1 class="h1value">${sessionScope.member.miId }</h1><br>
			<h1 class="h1key">이메일</h1> <input type="email" name="miEmail" value="${sessionScope.member.miEmail }" style="margin-left:5px;"/><br>
			<h1 class="h1key">기존 비밀번호</h1><input type="password" name="miPwd" placeholder="기존 비밀번호를 입력해주세요."/><br>
			<h1 class="h1key">새 비밀번호</h1><input type="password" name="new_miPwd" placeholder="새 비밀번호를 입력해주세요."/><br>
			<h1 class="h1key">새 비밀번호 확인</h1><input type="password" name="new_miPwd_re" placeholder="새 비밀번호 확인" /><br>
			<h5 class="h1key"></h5><h5 style="margin-left:10px;padding:0;display:inline; vertical-align:top;">* 새 비밀번호는 변경시에만 입력해주세요.</h5>
			<br>
			<hr>
			<br>
			<h1 class="h1key">이름</h1><h1 class="h1value">${sessionScope.member.miName }</h1><br>
			<h1 class="h1key">가입일</h1><h1 class="h1value"><fmt:formatDate value="${sessionScope.member.miRegtime }" pattern="yyyy-MM-dd HH:mm:ss"/></h1><h1 class="h1key">최근 접속일</h1><h1 class="h1value"><fmt:formatDate value="${sessionScope.member.miLastlogin }" pattern="yyyy-MM-dd HH:mm:ss"/></h1><br>
			<h1 class="h1key">생일</h1><h1 class="h1value">${sessionScope.member.miBirth }</h1><h1 class="h1key">성별</h1><c:choose><c:when test="${sessionScope.member.miGender=='M' }"><h1 class="h1value">남자</h1></c:when><c:otherwise><h1 class="h1value">여자</h1></c:otherwise></c:choose><br><br>
			<hr><br>
			<img src="/resources/img/icon/memberDrop.png" id="memberDrop" onclick="isDrop();"/><br><br>
			
			<input type="submit" id="submitBtn" value=""/>
			
	</form><br>
	</div>
	</section>
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>