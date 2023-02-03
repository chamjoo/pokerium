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
	border-top:2px solid #ebebeb;
	border-bottom:5px double #ebebeb;
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
    background-color:#FAFAFA;  
}

#fbViewHeader h1 {
	margin:0px;
}

#fbViewInfo {
	border-top:2px solid #ebebeb;
	border-bottom:2px solid #ebebeb;
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
	border-left:2px solid #ebebeb;
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
	border:2px solid #ebebeb;
	resize:none;
	overflow:visible;
	font-size:18px;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	background-color:#FAFAFA;  
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
	border-right:2px solid #ebebeb; 
	padding-right:30px; 
	font-size:20px; 
	width:15%; 
	text-align:center;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;	
}

#submitBtn {
	display:inline-block;
	background:url(/resources/img/icon/icon_edit.png);
	background-repeat : no-repeat;
	width:63px;
	height:30px;
	border:0;
	cursor:pointer;
	margin:0 auto;
}
#listBtn {
	display:inline-block;
	width:63px;
	height:30px;
	border:0;
	cursor:pointer;
	margin:0 auto;
}
#btnDiv {
	width:1200px;
	height:50px;
	padding:20px 100px 20px 0;
	text-align:right;
}

#fbViewInsertReplyDiv {
	padding:0px 100px 50px 100px; 
	width:1100px;
	height:60px;
	
}
#fbrComment {
	margin:0;
	padding:20px 20px 20px 20px;
	width:750px;
	height:40px;
	border:2px solid #ebebeb;
	resize:none;
	overflow:visible;
	font-size:16px;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	background-color:white;  
}
#fbrComment:focus {
	border:2px solid black;
}

#fbrCommentFalse {
margin:0;
	padding:20px 100px 20px 100px;
	width:900px;
	height:40px;
	border:2px solid #ebebeb;
	resize:none;
	overflow:visible;
	font-size:20px;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
	text-align:center;
}
#commentH1 {
	width:1100px;
	margin:0;
	padding:20px;
	display:block;
	text-align:left;
	font-size:18px;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
}
#insertCommentBtn {
	cursor:pointer;
}

#fbViewReplyDiv {
	padding:0px 100px 50px 100px; 
	width:1100px;
	height:60px;
	
}
</style>

<script>

function isDelete() {
	var fbiIdx = document.getElementById("fbiIdx").value;
		console.log(fbiIdx);
		if(confirm("게시물을 삭제하시겠습니까?\n삭제한 게시물은 영구적으로 되돌릴수 없습니다.")){
			location.href="/community/freeboard/view/delete?no="+fbiIdx;
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
		<form action="/community/freeboard/view/edit?no=${requestScope.fbi.fbiIdx} " method="post">

		<div>
			<div id="fbViewHeader">
				<h1 id="fbViewHeaderH1">제목</h1><input type="text" id="fbiTitle" name="fbiTitle" value="${requestScope.fbi.fbiTitle }" readonly />
			</div>
			<div id="fbViewInfo"><h1 class="fbiKey">글번호</h1><h1 class="fbiValue">${requestScope.fbi.fbiIdx }</h1>
			<input type="hidden" name="fbiIdx" id="fbiIdx" value="${requestScope.fbi.fbiIdx }"/>
			<h1 class="fbiKey">닉네임</h1><h1 class="fbiValue">${requestScope.fbi.miNickname }</h1>
			<h1 class="fbiKey">조회수</h1><h1 class="fbiValue">${requestScope.fbi.fbiReadcnt }</h1>
			<h1 class="fbiKey">작성일시</h1><h1 class="fbiValue"><fmt:formatDate value="${fbi.fbiRegtime}" pattern="yyyy-MM-dd hh:mm:ss"/></h1>
			<c:choose>
				<c:when test="${requestScope.fbi.fbiUpdatetime != null}">
					<h1 class="fbiKey">수정일시</h1><h1 class="fbiValue"><fmt:formatDate value="${fbi.fbiUpdatetime}" pattern="yyyy-MM-dd hh:mm:ss"/></h1>
				</c:when>
			</c:choose>
			</div>
			<h1 id="contentH1" >내용</h1>
			
			<div id="fbViewContent"><textarea id="fbiContent" name="fbiContent" readonly>${requestScope.fbi.fbiContent }</textarea></div>
		
		</div><br>
		<div id="btnDiv">
			<c:choose>
				<c:when test="${requestScope.fbi.miId==sessionScope.member.miId}">
					<img src="/resources/img/icon/icon_delete.png" id="deleteBtn" onclick="isDelete();"/>
					<input type="submit" id="submitBtn" value=""/>
				</c:when>
			</c:choose>
			<img src="/resources/img/icon/icon_list.png" id="listBtn" onclick="history.back();" />
		</div>
	</form>
	<hr style="border:1px solid #ebebeb;">
	<form>
	<div id="fbViewInsertReplyDiv">
	<h1 id="commentH1" >댓글 달기</h1>
		<c:choose>
			<c:when test="${sessionScope.member!=null }">	
				<input type="hidden" name="fbiIdx" id="fbiIdx" value="${requestScope.fbi.fbiIdx }"/>
				<textarea id="fbrComment"></textarea>
				<img src="/resources/img/icon/btn_insertComment.png" id="insertCommentBtn" />
			</c:when>
			<c:otherwise>
				<textarea id="fbrCommentFalse" placeholder="로그인 후 이용이 가능합니다." disabled="disabled"></textarea>
			</c:otherwise>
		</c:choose>
	
	</div>
	<br><br><br><br>
	<div id="fbViewReplyDiv">
		<h1 id="commentH1" >댓글</h1>
	
	</div>
	</form>
	</div>
	</section>
	
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$('#insertCommentBtn').click(function(){

	var fbrComment = document.getElementById("fbrComment").value;
	var fbiIdx = $('input[name=fbiIdx]').val();

	if(confirm("댓글을 등록하시겠습니까?")){

		$.ajax({
			url : "/community/freeboard/view/insertComment",
			data : {"fbrComment":fbrComment, "fbiIdx":fbiIdx},
			type : "POST",
			success : function(result){
				if(result=="true") {
					document.getElementById("fbrComment").value = "";
					alert('댓글이 등록되었습니다.');
					
				} else {
					alert('댓글등록에 실패하였습니다. 지속적인 오류발생시 관리자에게 문의해주세요.');
				}
			},
			error : function(){
				console.log("ajax 통신 실패");
			}
		});
	}
});
</script>
	
	
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>