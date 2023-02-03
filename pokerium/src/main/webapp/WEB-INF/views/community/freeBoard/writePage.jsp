<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
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
	background-color:#f7f7f7;
	padding:80px;
}

section h1 {
	display:inline-block;
	margin-right:50px;
}
section input[type=text], section input:focus[type=text] {
	border:0;
	outline:none;
}
#fbViewDiv {
	width:1300px;
	margin:0 auto;
	padding:30px 0 50px 0;
	background-color:#ffffff;
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

#fbViewHeader {
	border-top:2px solid #000000;
	border-bottom:5px double #000000;
	width:1250px;
	margin:0px;      
    padding:10px 0px 10px 50px;   
    font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
}
#fbiTitle { 

	width:850px;
	margin-left : 50px;
	padding-left : 50px;
	font-size:24px;
	color:#000000;
    text-align:left;  
    background-color:#FFFFF0;           
   
}

#fbViewHeader h1 {
	margin:0px;
}

#fbViewInfo {
	border-top:2px solid #000000;
	border-bottom:2px solid #000000;
	width:1300px;
	height:20px;
	margin:-1px;
	padding:20px 0 20px 0;
	line-height:30px;
	vertical-align:middle;
	text-align:right;
}

#fbViewInfo h1 {
	
	margin:0px;

	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	text-align:center;
}
.fbiKey {
	font-size:14px;
	padding:0 10px 0 20px;
	border-left:2px solid #000000;
}
.fbiValue {
	font-size:18px !important;
	padding:0 20px 0 0;
}

#fbViewContent {
	padding:0px 100px 50px 100px; 
	width:1100px;
	height:400px;
}
#fbiContent {
	border:1px solid black;
	margin:0;
	padding:80px 100px 20px 100px;
	width:900px;
	height:360px;
	border:2px solid #000000;
	resize:none;
	overflow:visible;
	font-size:18px;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	background-color:#FFFFF0; 
}
#fbiContent:focus {
	outline:none;
}
#contentH1 {
	width:1260px;
	margin:0;
	padding:20px;
	display:block;
	text-align:center;
	font-size:18px;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
}
#fbViewHeaderH1 {
	display: inline-block; 
	border-right:2px solid #000000;
	padding-right:30px; 
	font-size:20px; 
	width:15%; 
	text-align:center;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;	
}

#submitBtn {
	display:inline-block;
	background:url(/resources/img/icon/btn_insert.png);
	background-repeat : no-repeat;
	width:260px;
	height:80px;
	border:0;
	cursor:pointer;
	margin:0 auto;
}
#cancelBtn {
	display:inline-block;
	width:260px;
	height:80px;
	border:0;
	cursor:pointer;
	margin:0 auto;
}
#btnDiv {
	width:1200px;
	height:80px;
	padding:20px 100px 20px 0;
	text-align:center;
}

</style>
<script>
function chkValue(frm){    
	var fbiTitle = frm.fbiTitle.value;
    var fbiContent = frm.fbiContent.value;      

    if(confirm("게시물을 등록하시겠습니까?")){
    	
    	if (fbiTitle == ""){
	       	alert("제목을 입력해주세요.");               frm.fbiTitle.focus();   return false;
	    }
    	
	    if (fbiContent == ""){
	       	alert("내용을 입력해주세요.");               frm.fbiContent.focus();   return false;
	    }    
    	return true;
    } else {
    	return false;
    }
}

</script>
</head>
<body>
	<%@include file ="/WEB-INF/views/common/header.jsp" %>
	
	<section>
	<div id="fbViewDiv">
		<div id="fbViewTop">
			<h1 id="freeBoard">자유게시판</h1>
		</div>
		<form action="/community/freeboard/insertFbi" method="post" onsubmit="return chkValue(this);">

		<div>
			<div id="fbViewHeader">
				<h1 id="fbViewHeaderH1">제목</h1><input type="text" id="fbiTitle" name="fbiTitle" placeholder="제목을 입력하세요." />
			</div>


			<h1 id="contentH1" >내용</h1>
			
			<div id="fbViewContent"><textarea id="fbiContent" name="fbiContent" placeholder="내용을 입력하세요."></textarea></div>
		
		</div><br>
		<div id="btnDiv">
			<input type="submit" id="submitBtn" value=""/>
			<img src="/resources/img/icon/btn_cancel.png" id="cancelBtn" onclick="history.back();" />
		</div>
	</form>
	
	</div>
	</section>
	
	
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>