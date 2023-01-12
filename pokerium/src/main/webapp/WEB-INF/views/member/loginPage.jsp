<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>
	<form name="loginForm" action="/member/login.do" method="post">
		<input type="text" name="miId" placeholder="아이디"/><br>
		<input type="password" name="miPwd" placeholder="비밀번호"/><br>
		<br>
		<input type="submit" value="로그인" />
	</form>
	<br>
	<a href="/member/joinPage.do">아직 회원이 아니신가요?</a><br>

</body>
</html>