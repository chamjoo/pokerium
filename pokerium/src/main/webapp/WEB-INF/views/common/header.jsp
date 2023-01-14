<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/icon/icon_ball_c.ico">
<title>포케리움 :: PoKéRíum</title>
</head>
<body>
<style>
body {
	max-width:100%;
	width:100%;
	padding-top:58px;
	margin:0px;

}
header { 
	position:fixed;
	top: 0; left: 0;
 		width: 100%;
	display: block;
	height: 118px;
	border:1px solid #ebebeb;
	overflow:hidden;
	z-index:30;

}
#topMenu { 
	display: block;
	width:100%;
	height:120px;
	background-color:#ffffff;
	z-index:30;

}
#topMenu ul {
	margin: auto;
	padding:0px;
}
#topMenu #menu1 li  {            
	padding:0px;       
	margin:0px;
	list-style: none;         
	color: white;               
	background-color: white;  
	float: left;               
	line-height: 0px; 
	height:118px;        
	vertical-align:middle;
	text-align:center;
	border-left:1px solid #ebebeb;
}
                
#topMenu #menu2  {
	padding:0;
	width:40%;
}         
#topMenu #menu2 li  {            
	padding:0px;       
	margin:0px;
    list-style: none;         
    color: white;               
    background-color: white;  
    float: right;               
    line-height: 0px; 
    height:118px;        
    vertical-align:middle;
	text-align:center;
}
#topMenu .menuLink {                              
        text-decoration:none;                     
        color: black;                              
        display: block;                            
        width: 150px;                              
        font-size: 15px;                          
        font-weight: bold;                         
        font-family: "Trebuchet MS", Dotum, Arial; 
        
}

#topMenu ul li .menuDiv1 {
	display:block;
	height:120px;
	vertical-align: middle; 
	

}
#topMenu ul li .menuDiv2 {
	padding:25px 0 0 0;
	display: flex; justify-content:center;
	height:40px;
	vertical-align: bottom; 
}
	
#topMenu ul li .menuDiv3 {
	padding:25px 0 0 0;
	display: flex; justify-content:center;
	height:40px;
	vertical-align: bottom; 
	
}
	
#topMenu ul li .logoDiv {
	padding:25px 0 0 0;
}

.logoDiv, .li1 {
	width:400px;
}
.menuDiv2, .li2 {
	width:150px;
}

	.li3 {
	width:90px;
}

#menu1{
	position:absolute;
	left:0px;
	z-index:10;
}
#menu2{
	position:absolute;
	left:700px;
	z-index:1;
}

</style>
	<header>
		<nav id="topMenu" ">
			<ul id="menu1">
				<li class="li1"><a class="menuLink" href="/"><div class="logoDiv"><img src="/resources/img/icon/logo.png" alt="로고" /></div></a></li>
				<li class="li2"><div class="menuDiv1"><a class="menuLink" href=""><div class="menuDiv2" ><img src="/resources/img/icon/icon_news.png"  /></div><H4>소식</H4></a></li></div>
				<li class="li2"><div class="menuDiv1"><a class="menuLink" href=""><div class="menuDiv2" ><img src="/resources/img/icon/pokedex.png"  /></div><H4>포켓몬 도감</H4></a></div></li>
				<li class="li2"><div class="menuDiv1"><a class="menuLink" href=""><div class="menuDiv2" ><img src="/resources/img/icon/icon_ball_c.png"  /></div><H4>상품</H4></a></div></li>
				<li class="li2" style="border-right:1px solid #ebebeb;"><div class="menuDiv1"><a class="menuLink" href=""><div class="menuDiv2" ><img src="/resources/img/icon/community.png"  /></div><H4>커뮤니티</H4></a></div></li>
			</ul>
			<ul id="menu2">
				<li class="li3"><div class="menuDiv1"><a class="menuLink" href=""><div class="menuDiv3" ><img src="/resources/img/icon/icon_search.png"  /></div><H4>통합검색</H4></a></div></li>
				<c:choose>
					<c:when test="${sessionScope.member != null }">
						<li class="li3"><div class="menuDiv1"><a class="menuLink" href="/member/logout"><div class="menuDiv3" ><img src="/resources/img/icon/icon_logout.png"  /></div><H4>로그아웃</H4></a></div></li>
						<li class="li3"><div class="menuDiv1"><a class="menuLink" href="/member/myPage"><div class="menuDiv3" ><img src="/resources/img/icon/icon_mypage.png"  /></div><H4>마이 페이지</H4></a></div></li>  
					</c:when>
					
					<c:otherwise>
						<li class="li3"><div class="menuDiv1"><a class="menuLink" href="/member/loginPage"><div class="menuDiv3" ><img src="/resources/img/icon/icon_mypage.png" /></div><H4>로그인</H4></a></div></li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</nav>
	</header>
	<br>
	<br>
	<br>
	

</body>
</html>