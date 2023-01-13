<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/icon/icon_ball_c.ico">
<title>포케리움 :: PoKéRíum</title>
<style>
section {
	background-color:#f7f7f7;
}
#loginDiv {
	display:block;
	margin:0 auto;
	width:580px;
	height:500px;
	padding:100px 100px 100px 100px;
	line-height:30px;
	text-align: center;
}

#loginDiv input[type=text], #loginDiv input[type=password] {
	width:470px;
	height:60px;
	margin:10px;
	border:1px solid #bbb;
	border-radius:0;
	font-size:18px;
	padding-left:30px;
	font-weight: bold;                         
	font-family: "Trebuchet MS", Dotum, Arial;
}
::placeholder { 
	color:#bbb;
}
#submitBtn {
background:url(/resources/img/icon/login.png);
background-repeat : no-repeat;
width:500px;
height:80px;
border:0;
cursor:pointer;
}

</style>
</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>
<section>
<div id="loginDiv" >
<c:choose>
		<c:when test="${sessionScope.member != null }">
			<c:redirect url="/"></c:redirect>
		</c:when>
		
		<c:otherwise>
			
			<img src="/resources/img/icon/logo.png" alt="로고" style="height:80px;"/>
			<form name="loginForm" action="/member/login" method="post">
				<input type="text" name="miId" placeholder="아이디"/><br>
				<input type="password" name="miPwd" placeholder="비밀번호"/><br>
				<br>
				<input type="submit" id="submitBtn" value=""/>
			</form>
			<br>
			<hr style="width:500px;">
			<br>
			<a href="/member/joinPage"><img src="/resources/img/icon/join.png" /></a><br>

		</c:otherwise>
	</c:choose>
	</div>
</section>


	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>