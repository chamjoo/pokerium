<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/icon/icon_ball_c.ico">
<title>포케리움 :: PoKéRíum</title>

<style>


section {
	background-color:#f7f7f7;
	padding:80px;
}
::placeholder { 
	color:#bbb;
	font-weight: bold;  
}
#myPageDiv {
	display:block;
	margin:0 auto;
	width:1200px;
	height:1750px;
	padding:50px 50px 100px 50px;
	line-height:30px;
	background-color:#ffffff;
}

.h1key {
	display:inline-block;
	width:20%;
	vertical-align:middle;
	font-size:25px;
	color:#000000;
	font-weight:bold;                       
	font-family:"Trebuchet MS", Dotum, Arial;
}
.h1value {
	display:inline-block;
	width:25%;
	margin-left:10px;
	font-weight: bold;                         
	font-family: "Trebuchet MS", Dotum, Arial;
	font-size:20px;
	color:#929292;
}

#myPageDiv input[type=text], #myPageDiv input[type=password],#myPageDiv input[type=email] {
	width:70%;
	height:60px;
	margin:10px;
	border:1px solid #bbb;
	border-radius:0;
	font-size:20px;
	padding-left:30px;                        
	font-family: "Trebuchet MS", Dotum, Arial;
	font-weight: bold; 
}
#myQnA {
	float:right;
	margin:0;
	cursor:point;
}
#memberDrop {
	display:block;
	cursor:point;
}

#submitBtn {
	display:block;
	background:url(/resources/img/icon/edit.png);
	background-repeat : no-repeat;
	width:500px;
	height:80px;
	border:0;
	cursor:pointer;
	margin:0 auto;
}
#checkNickname {
	width:130px !important;
	height:60px;
	margin:10px;
	cursor:pointer;
}

#checkNicknameDiv {
	width:100%;
	display: flex; justify-content:left;
	align-items: center;  
	   
}

#memberAddrDiv {
	position:absolute;
	display:inline-block;
	width:634px;
	text-align:left;
	margin:0 auto;
	padding:0;
}

#findAddr {
	width:120px;
	height:60px;
	margin:10px;
	cursor:pointer;
}
#maZip:focus, #maAddr1:focus{
	outline:none;
	
}
#maZip { 
	width:460px !important;
	height:60px; background-color:#e9ecef;
}
#maAddr1 { 
	background-color:#e9ecef;
	width:600px !important;
}
#maAddr2 { 
	width:600px !important;
}

#findAddrDiv {
	width:654px;
	display: flex; justify-content:left; align-items: center;
}
#teamDiv {
	position:absolute;
	display:inline-block;
	width:530px;
	height:160px;
	text-align:center;
	font-weight: bold;                         
	font-family: "Trebuchet MS", Dotum, Arial;
}
.teamImageDiv {
	display:inline-block;
	width:120px;
	height:160px;
	padding-left:10px;
	padding-right:10px;
}
.teamImage {
	display:inline-block;
	width:120px;
	height:120px;
}
</style>
	
</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>

<script>
function chkValue(frm){    
	var miNickname = frm.miNickname.value;
    var miPwd = frm.miPwd.value;      
    var new_miPwd = frm.new_miPwd.value;
    var new_miPwd_re = frm.new_miPwd_re.value;
    var miEmail = frm.miEmail.value; 

    if(confirm("회원정보를 수정하시겠습니까?")){
    	
    	if (miNickname == ""){
	       	alert("닉네임을 입력해주세요.");               frm.miNickname.focus();   return false;
	    }
    	
	    if (miEmail == ""){
	       	alert("이메일을 입력해주세요.");               frm.miEmail.focus();   return false;
	    }
	    
	    if (miPwd == ""){
	       	alert("기존 비밀번호를 입력해주세요.");               frm.miPwd.focus();   return false;
	    }
	    
	    if (new_miPwd != "" && new_miPwd.length<8){
	       	alert("새 비밀번호는 8자이상 입력해주세요.");               frm.new_miPwd.focus();   return false;
	    }
	    
	    if (new_miPwd_re != new_miPwd){
	       	alert("입력한 비밀번호가 서로 다릅니다. 다시 확인해주세요.");               frm.new_miPwd_re.focus();   return false;
	    }
	    
    	return true;
    } else {
    	return false;
    }
}

	function isDrop() {
		if(confirm("정말 회원 탈퇴 하시겠습니까?\n탈퇴하면 영구적으로 되돌릴수 없습니다.")){
			location.href="/member/memberDrop";
		}
	}
	
	function chkNickname(obj) {
		  const regExp = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/;
		  const ele = obj.target;
		  var checkMiNickname = document.getElementById('checkMiNickname').value;
		  if (regExp.test(ele.value)) {
		    ele.value = checkMiNickname;
		    alert('특수문자는 사용이 불가능합니다.');
		  }
	};
	
</script>

	<section>
		<c:choose>
		<c:when test="${sessionScope.member == null }">
			<c:redirect url="/"></c:redirect>
		</c:when>
		<c:otherwise>
			<div id="myPageDiv">
			<form id="myPageForm" action="/member/memberUpdate" method="post" onsubmit="return chkValue(this);">
				
					<div style="padding:20px 0 20px 0; width:100%;">
					<H1 style="display:inline;font-size:35px;">마이페이지</H1><a href=""><img src="/resources/img/icon/myQnA.png" id="myQnA" /></a></div>
					<hr>
					
					<h1 class="h1key" >아이디</h1> <h1 class="h1value">${sessionScope.member.miId }</h1><br>
					
					
				
					<H1 class="h1key">닉네임</H1>
					<input type="hidden" name="checkMiNickname" id="checkMiNickname" value="${sessionScope.member.miNickname }" onkeyup="chkNickname(event)" />
					<div style="display:inline-block; width:70%; margin:0px; padding:0px;">
						<div id="checkNicknameDiv" style="width:100%; margin:0px;padding:0px; "><input type="text" name="miNickname" value="${sessionScope.member.miNickname }" placeholder="닉네임을 입력해주세요." style="margin-left:5px;"onkeyup="chkNickname(event)"/><img src="/resources/img/icon/checkNickname.png" id="checkNickname" />
						</div>
					</div><br>
					
					<h1 class="h1key">이메일</h1> <input type="email" name="miEmail" value="${sessionScope.member.miEmail }" style="margin-left:5px;"/><br>
					<h1 class="h1key">기존 비밀번호</h1><input type="password" name="miPwd" placeholder="기존 비밀번호를 입력해주세요."/><br>
					<h1 class="h1key">새 비밀번호</h1><input type="password" name="new_miPwd" placeholder="새 비밀번호를 입력해주세요."/><br>
					<h1 class="h1key">새 비밀번호 확인</h1><input type="password" name="new_miPwd_re" placeholder="새 비밀번호 확인" /><br>
					<h5 class="h1key"></h5><h5 style="margin-left:10px;padding:0;display:inline; vertical-align:top;">* 새 비밀번호는 변경시에만 입력해주세요.</h5><br>
					<H1 class="h1key" style="position:relative; margin-bottom:150px;">팀</H1>
					<div id="teamDiv">
						<div class="teamImageDiv"><label><img src="/resources/img/icon/team_valor.png" class="teamImage" /><br><input type="radio" name="miTeam" class="radioTeam" <c:choose><c:when test="${sessionScope.member.miTeam=='R'}">checked="checked"</c:when></c:choose> value="R"/>발로</label></div>
						<div class="teamImageDiv"><label><img src="/resources/img/icon/team_mystic.png" class="teamImage" /><br><input type="radio" name="miTeam" class="radioTeam" <c:choose><c:when test="${sessionScope.member.miTeam=='B'}">checked="checked"</c:when></c:choose> value="B" />미스틱</label></div> 
						<div class="teamImageDiv"><label><img src="/resources/img/icon/team_instinct.png" class="teamImage" /><br><input type="radio" name="miTeam" class="radioTeam" <c:choose><c:when test="${sessionScope.member.miTeam=='Y'}">checked="checked"</c:when></c:choose> value="Y" />인스팅트</label></div>
					</div>
					<br>
					<hr>
					<br>
					<h1 class="h1key">이름</h1><h1 class="h1value">${sessionScope.member.miName }</h1><br>
					<h1 class="h1key">가입일</h1><h1 class="h1value"><fmt:formatDate value="${sessionScope.member.miRegtime }" pattern="yyyy-MM-dd HH:mm:ss"/></h1><h1 class="h1key">최근 접속일</h1><h1 class="h1value"><fmt:formatDate value="${sessionScope.member.miLastlogin }" pattern="yyyy-MM-dd HH:mm:ss"/></h1><br>
					<h1 class="h1key">생일</h1><h1 class="h1value">${sessionScope.member.miBirth }</h1><h1 class="h1key">성별</h1><c:choose><c:when test="${sessionScope.member.miGender=='M' }"><h1 class="h1value">남자</h1></c:when><c:otherwise><h1 class="h1value">여자</h1></c:otherwise></c:choose><br><br>
					<hr><br>

					<h1 class="h1key" style="position:relative; margin-bottom:235px;">주소</h1>
					<div id="memberAddrDiv">
						<div id="findAddrDiv">
							<img src="/resources/img/icon/findAddr.png" id="findAddr" onclick="sample6_execDaumPostcode()"/> <input type="text"  id="maZip" name="maZip" value="${sessionScope.member.maZip }" placeholder="우편번호를 입력해주세요." readonly/>
						</div>
						<input type="text"  id="maAddr1" name="maAddr1" value="${sessionScope.member.maAddr1 }" placeholder="기존주소를 입력해주세요." readonly/>
						<input type="text"  id="maAddr2" name="maAddr2" value="${sessionScope.member.maAddr2 }" placeholder="상세주소를 입력해주세요."/>
					</div>
					<hr><br>
					<br>
					<img src="/resources/img/icon/memberDrop.png" id="memberDrop" onclick="isDrop();"/><br><br>
					
					<input type="submit" id="submitBtn" value=""/>
					
			</form><br>
			</div>
			</c:otherwise>
			</c:choose>
			
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
$('#checkNickname').click(function(){

	var miNickname = $('input[name=miNickname]').val();
	var checkMiNickname = $('input[name=checkMiNickname]').val();
	
	$.ajax({
		url : "/member/memberNicknameCheck",
		data : {"miNickname":miNickname, "checkMiNickname":checkMiNickname},
		type : "get",
		success : function(result){
			if(result=="true") {
				alert('[' + miNickname + ']는 사용 불가능한 닉네임 입니다.');
				$('input[name=miNickname]').focus();
			} else if (result=="equals") {
				
				alert('[' + miNickname + ']는 현재 닉네임 입니다.');
				
			} else {
				alert('[' + miNickname + ']는 사용 가능한 닉네임 입니다.');
				$('input[name=miNickname]').focus();
			}
		},
		error : function(){
			console.log("ajax 통신 실패");
		}
	});
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function sample6_execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               var addr = '';
               if (data.userSelectedType === 'R') {
                   addr = data.roadAddress;
               } else { 
                   addr = data.jibunAddress;
               }

               document.getElementById('maZip').value = data.zonecode;
               document.getElementById("maAddr1").value = addr; 
               document.getElementById("maAddr2").focus();
           }
       }).open();
   }
</script>
	</section>
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>