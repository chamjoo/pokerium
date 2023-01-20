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
	background:url(/resources/img/icon/background_check.png);
	background-repeat : repeat;
	padding:80px;
}

section a {
	color: inherit;
	text-decoration: none;
}
section a:hover {
	color:red;
}

section h1 {
	display:inline-block;
	margin-right:50px;
}

#fbDiv {
	width:1300px;
	margin:0 auto;
	padding:30px 0 50px 0;
	background-color: rgba(255,255,255,0.9);
}

#fbHeader { 
	border-top:2px solid #ebebeb;
	border-bottom:5px double #ebebeb;
	width:1300px;
	font-size:16px;
	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;   
    text-align:center;            
    margin:0px;      
    padding:10px 0 10px 0;   
}

#fbHeader h1 {
	margin:0px;
}

.fbiTitle {
	width:40%;
 }
 .fbiIdx , .miNickname, .fbiRegtime {
 	width:15%;
 }

.fbiReadcnt {
	width:10%;
}

#fbResultCnt {
	font-size:15px;
	color:#000000;
	padding:10px;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	float:right;
	padding-top:80px;
}

#fbResultList {
	border-top:2px solid #ebebeb;
	border-bottom:2px solid #ebebeb;
	width:1300px;
	height:20px;
	margin:-1px;
	padding:20px 0 20px 0;
	line-height:30px;
	vertical-align:middle;
}

#fbResultList h1 {
	margin:0px;
	font-size:16px;
	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	text-align:center;
}
#freeBoard {
	display:inline-block;
	padding:0 0 0 50px;
	font-size:35px;
	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	margin:50px 0 30px 0;
}
#fbSearchResult {
	width:1300px;
	margin:0 auto;
	height:100px;
	text-align:center;
	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
}
#fbSearchResultNone {
	width:1300px;
	margin:0 auto;
	height:200px;
	text-align:center;
	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
}

#fbSearchBar {
	width:1300px;
	height:60px;
	display:flex;
	justify-content:center; 
	align-items: center;
	margin:0 auto;
	padding-bottom:20px;
	position:relative;
}
#fbSearchBar SELECT{
	width:90px;
	height:65px;
	margin:0 10px 0 10px;
	border:1px solid #bbb;
	border-radius:0;
	font-size:20px;                      
	font-family: "Trebuchet MS", Dotum, Arial;
	font-weight: bold; 
	position:absolute;
	top:3px;
	left:300px;
	
}
#fbSearchBar input[type=text] {
	width:200px;
	height:60px;
	margin:0 10px 0 10px;
	border:1px solid #bbb;
	border-radius:0;
	font-size:20px;
	padding-left:30px;                        
	font-family: "Trebuchet MS", Dotum, Arial;
	font-weight: bold; 
	position:absolute;
	top:3px;
	left:420px;
	
}
#pageNavi {
	display:block;
	margin:30px;
	font-size:20px;
	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	text-align:center;
	letter-spacing:10px;
}

#submitBtn {
	background:url(/resources/img/icon/searchBtn.png);
	width:120px;
	height:65px;
	cursor:pointer;
	position:absolute;
	top:3px;
	left:700px;
}
#insertBtn {
	cursor:pointer;
	position:absolute;
	top:10px;
	left:850px;
}


</style>
</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
	
	<section>
	
	
		<div id="fbDiv">
			<div id="fbTop">
			<h1 id="freeBoard">자유게시판</h1>
			<h1  id="fbResultCnt" style="float:right; margin:0px;">조회된 게시물 수 / 전체 게시물 ( ${requestScope.map.selectRecordAllCount} / ${requestScope.map.fbiRecordAllCount} )</h1>
			</div>
			<div id="fbHeader">
				<h1 class="fbiIdx">번호</h1><h1 class="fbiTitle">제목</h1><h1 class="miNickname">닉네임</h1><h1 class="fbiRegtime">날짜</h1><h1 class="fbiReadcnt">조회수</h1>
			</div>
			
	
			<c:choose>
				<c:when test="${!requestScope.keyword.isEmpty() || !requestScope.keyword.equals('') }">
				<div id="fbSearchResult" >
					<h1>"${requestScope.keyword }" (으)로 검색한 결과</h1>
				</div>
				</c:when>
			</c:choose>

	
			<c:choose>
				<c:when test="${!requestScope.fbi.isEmpty() }">
				<c:forEach items="${requestScope.fbi }" var="fbi" varStatus="i">
				<c:set var="fbiRegDate"><fmt:formatDate value="${fbi.fbiRegtime }" pattern="yyyy-MM-dd" /></c:set>
					<div id="fbResultList">
						<h1 class="fbiIdx">${fbi.fbiIdx }</h1>
						<h1 class="fbiTitle" style="text-align:left !important;"><a href="/community/freeboard/view?no=${fbi.fbiIdx }">${fbi.fbiTitle }</a></h1>
						<h1 class="miNickname">${fbi.miNickname }</h1>
						<c:choose>
							<c:when test="${sysDate.equals(fbiRegDate) }">
								<h1 class="fbiRegtime"><fmt:formatDate value="${fbi.fbiRegtime }" pattern="HH:mm:ss"/></h1>
							</c:when>
							<c:otherwise>
								<h1 class="fbiRegtime"><fmt:formatDate value="${fbi.fbiRegtime}" pattern="yyyy-MM-dd"/></h1>
							</c:otherwise>
						</c:choose>
						<h1 class="fbiReadcnt">${fbi.fbiReadcnt }</h1>
					</div>
				</c:forEach>
				
					
				</c:when>
				<c:otherwise>
					<div id="fbSearchResultNone">
						<h1>게시물이 존재하지 않습니다.</h1>
					</div>
				</c:otherwise>
			</c:choose>
		
			<div id="pageNavi">
				${requestScope.pageNavi }
			</div>
			
			<div id="fbSearchBar">
				<form action="freeboard">
					<select name="type">
						<option value="title">제목</option>
						<option value="id">닉네임</option>
					</select>
					<input type="text" name="keyword" />
					<input type="submit" id="submitBtn" value=""/>
					<c:choose>
						<c:when test="${sessionScope.member != null }">
							<a href="/community/freeboard/write" ><img src="/resources/img/icon/insertBtn.png" id="insertBtn" /></a>
						</c:when>
					</c:choose>
				</form>
			</div>
			
		</div>
	</section>
	
	
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>