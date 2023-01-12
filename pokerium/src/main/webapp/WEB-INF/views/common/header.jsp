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
	<a href="/"><img src="/resources/img/icon/logo.png" alt="로고" /></a>
	<a href=""><img src="/resources/img/icon/icon_news.png"  /><span>소식</span></a> 
	<a href=""><img src="/resources/img/icon/pokedex.png"  /><span>포켓몬 도감</span></a> 
	<a href=""><img src="/resources/img/icon/icon_ball_c.png"  /><span>상품</span></a> 
	<a href=""><img src="/resources/img/icon/community.png"  /><span>커뮤니티</span></a> 
	<c:choose>
		<c:when test="${sessionScope.member != null }">
			<a href="/member/myPage"><img src="/resources/img/icon/icon_mypage.png"  />마이 페이지</a>   
			<a href="/member/logout"><img src="/resources/img/icon/icon_logout.png"  />로그아웃</a>
		</c:when>
		
		<c:otherwise>
			<a href="/member/loginPage"><img src="/resources/img/icon/icon_mypage.png" />로그인</a>
		</c:otherwise>
	</c:choose>
	<a href=""><img src="/resources/img/icon/icon_search.png"  /><span>통합검색</span></a> 
	<br>
	<br>
	<br>
	

</body>
</html>