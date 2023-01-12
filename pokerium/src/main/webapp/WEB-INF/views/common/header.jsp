<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포케토리</title>
</head>
<body>
	
	<a href="/pokedex/list.do"><img src="/resources/img/icon/icon_ball_c.png"  /><span>포켓몬 도감</span></a> 
	<c:choose>
		<c:when test="${sessionScope.member != null }">
			<a href="/member/myPage.do"><img src="/resources/img/icon/icon_mypage.png"  />마이 페이지</a>   
			<a href="/member/logout.do"><img src="/resources/img/icon/icon_logout.png"  />로그아웃</a> <br>
		</c:when>
		
		<c:otherwise>
			<a href="/member/loginPage.do"><img src="/resources/img/icon/icon_mypage.png" />로그인</a><br>
		</c:otherwise>
	
	
	</c:choose>
	<br>
	<br>
	<br>
	

</body>
</html>