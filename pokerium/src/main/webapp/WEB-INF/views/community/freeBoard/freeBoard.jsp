<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
     
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
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
	
	<h1>자유게시판 테스트</h1>
	
	
	
	<div>
		
		<h1>글번호</h1><h1>제목</h1><h1>닉네임</h1><h1>날짜</h1><h1>조회수</h1>
		
	</div>
	<div style="height:20px;">
	<c:choose>
		<c:when test="${!requestScope.keyword.isEmpty() || !requestScope.keyword.equals('') }">
			<h3>"${requestScope.keyword }" (으)로 검색한 결과</h3>
		</c:when>
	</c:choose>
	</div>
	<c:choose>
		<c:when test="${!requestScope.fbi.isEmpty() }">
			<c:forEach items="${requestScope.fbi }" var="fbi" varStatus="i">
			<c:set var="fbiRegDate"><fmt:formatDate value="${fbi.fbiRegtime }" pattern="yyyy-MM-dd" /></c:set>
				<div>
					<h1>${fbi.fbiIdx }</h1>
					<a href="/community/freeboard/view?no=${fbi.fbiIdx }"><h1>${fbi.fbiTitle }</h1></a>
					<h1>${fbi.miNickname }</h1>
					<c:choose>
						<c:when test="${sysDate.equals(fbiRegDate) }">
							<h1><fmt:formatDate value="${fbi.fbiRegtime }" pattern="HH:mm:ss"/></h1>
						</c:when>
						<c:otherwise>
							<h1><fmt:formatDate value="${fbi.fbiRegtime}" pattern="yyyy-MM-dd"/></h1>
						</c:otherwise>
					</c:choose>
					<h1>${fbi.fbiReadcnt }</h1>
				</div>
			</c:forEach>
			
				
		</c:when>
		<c:otherwise>
			<div>
				<h1>게시물이 존재하지 않습니다.</h1>
			</div>
		</c:otherwise>
	</c:choose>
	
	<div>
		${requestScope.pageNavi }
	</div>
	
		<form action="freeboard">
			<select name="type">
				<option value="title">제목</option>
				<option value="id">닉네임</option>
			</select>
			<input type="text" name="keyword" />
			<input type="submit" value="검색" />
			<c:choose>
				<c:when test="${sessionScope.member != null }">
					<a href="/community/freeboard/write" >글쓰기</a>
				</c:when>
			</c:choose>
		</form>
	</section>
	
	
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>