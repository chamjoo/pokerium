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
	width:100%;
	height:1000px;
}

section h1 {
	display:inline-block;
	margin-right:50px;
}
</style>



</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
	
	<section>
	
	<form action="/community/freeboard/insertFbi" method="post">
	<div>
		<h1>자유게시판 글쓰기 페이지</h1>
		<div>
			<div><h1>제목</h1><input type="text" id="fbiTitle" name="fbiTitle" placeholder="제목을 입력하세요." /></div><br>
			<div><textarea name="fbiContent" placeholder="내용을 입력하세요."></textarea></div>
		
		</div>
		<input type="submit" value="작성"/><button type="button" onclick="history.back();">취소</button>
	</div>
	</form>
	</section>
	
	
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>