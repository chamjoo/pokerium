<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/icon/icon_ball_c.ico">
<title>포케리움 :: PoKéRíum</title>


<script>

		function chkValue(frm){
		    var miId = frm.miId.value;   
		    var miNickname = frm.miNickname.value;
		    var miPwd = frm.miPwd.value;      
		    var miPwd_re = frm.miPwd_re.value;
		    var miEmail = frm.miEmail.value; 
		    var miName = frm.miName.value; 
		    var miName = frm.miGender.value;
		    var miPhone1 = frm.miPhone1.value;      
		    var miPhone2 = frm.miPhone2.value;      
		    var miPhone3 = frm.miPhone3.value;
		    var miTeam = frm.miTeam.value;
		    var maZip = frm.maZip.value;
		    var maAddr1 = frm.maAddr1.value;
		    var maAddr2 = frm.maAddr2.value;
		    

		    if (miId == ""){
		       	alert("아이디를 입력해주세요.");               frm.miId.focus();   return false;
		    }
		    if (miNickname == ""){
		       	alert("닉네임을 입력해주세요.");               frm.miNickname.focus();   return false;
		    }
		    
		    if (miPwd == ""){
		       	alert("비밀번호를 입력해주세요.");               frm.miPwd.focus();   return false;
		    }
		    if (miPwd.length < 8){
		       	alert("비밀번호는 8자이상 입력해주세요.");               frm.miPwd.focus();   return false;
		    }
		    
		    if (miPwd_re != miPwd){
		       	alert("입력한 비밀번호가 서로 다릅니다. 다시 확인해주세요.");               frm.miPwd_re.focus();   return false;
		    }
			if (miEmail == "") {
		  		alert("이메일 주소를 입력해주세요.");					frm.miEmail.focus();     return false;	
		  	}
			
			if (miTeam == "") {
		  		alert("팀을 선택해주세요.");					frm.miTeam.focus();     return false;	
		  	}
		    
			if (miName == ""){
		       	alert("이름을 입력해주세요.");               frm.miName.focus();   return false;
		    }
			
			if (miGender == ""){
		       	alert("성별을 선택해주세요.");               frm.miGender.focus();   return false;
		    }
			
			
		    
		    if (miPhone1 == ""){
		       	alert("휴대폰 번호를 확인해주세요.");				frm.miPhone1.focus();     return false;
		    }
		    if (miPhone2 == "" || miPhone2.length < 3){
		       	alert("휴대폰 번호를 확인해주세요.");				frm.miPhone2.focus();     return false;
		    }
		    if (miPhone3 == "" || miPhone3.length < 4){
		       	alert("휴대폰 번호를 확인해주세요.");				frm.miPhone3.focus();     return false;
		    }
		    
		    if (maZip == ""){
		       	alert("주소를 입력해주세요.");				frm.maZip.focus();     return false;
		    }
		    if (maAddr1 == ""){
		       	alert("주소를 입력해주세요.");				frm.maAddr1.focus();     return false;
		    }
		    if (maAddr2 == ""){
		       	alert("주소를 입력해주세요.");				frm.maAddr2.focus();     return false;
		    }
		    
	 		
		    if (miId.length < 4){
		       	alert("아이디는 4자이상 입력해주세요.");               frm.miId.focus();   return false;
		    }
		   
		    return true;
		}
		
		function onlyNum(obj){
			//특정 컨트롤에 숫자만 입력되도록 하는 함수로 숫자가 아닌 값이 입력될 경우 값을 모두 삭제시킴
				if (isNaN(obj.value)){
					obj.value = "";
			}
		}
		function chkId(obj) {
			  const regExp = /[^0-9a-zA-Z]/g;
			  const ele = obj.target;
			  if (regExp.test(ele.value)) {
			    ele.value = "";
			    alert('영어,숫자를 조합해 4자이상 입력하세요.');
			  }
		};
		function chkNickname(obj) {
			  const regExp = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/;
			  const ele = obj.target;
			  if (regExp.test(ele.value)) {
			    ele.value = "";
			    alert('특수문자는 사용이 불가능합니다.');
			  }
		};

</script>

	<style>
section {
	background-color:#f7f7f7;
	padding:80px;
}

#joinForm{
	width : 500px;
}

#joinDiv {
	display:block;
	margin:0 auto;
	width:520px;
	height:1700px;
	padding:50px 100px 100px 100px;
	line-height:30px;
	background-color:#ffffff;

}

#joinDiv input[type=text], #joinDiv input[type=password],#joinDiv input[type=email] {
	width:470px;
	height:60px;
	margin:10px;
	border:1px solid #bbb;
	border-radius:0;
	font-size:16px;
	padding-left:30px;
	font-weight: bold;                         
	font-family: "Trebuchet MS", Dotum, Arial;
}
::placeholder { 
	color:#bbb;
}
#miBirth {
	width:300px;
	height:60px;
	margin:10px;
	border:1px solid #bbb;
	border-radius:0;
	font-size:30px;
	padding-left:30px;                       
	font-family: "Trebuchet MS", Dotum, Arial;
	text-align:center;
}
#miGender {
	
	width:170px;
	height:60px;
	margin:10px;
	border:1px solid #bbb;
	border-radius:0;
	font-weight: bold;
	font-size:16px;                  
	font-family: "Trebuchet MS", Dotum, Arial;
	text-align:center;

}
#birthGender {
	width:524px;
	display: flex; justify-content:center;
	
}

.miPhone {
	width:130px !important;
	height:60px;
	margin:10px;
	border:1px solid #bbb;
	border-radius:0;
	font-size:16px;
	font-weight: bold;                         
	font-family: "Trebuchet MS", Dotum, Arial;
	text-align:center;
	padding-right:30px;
}
#miPhoneDiv { 
	width:524px;
	display: flex; justify-content:center;
	align-items: center;
}

#submitBtn {
	background:url(/resources/img/icon/joinSubmit.png);
	background-repeat : no-repeat;
	width:500px;
	height:80px;
	border:0;
	cursor:pointer;
}

#checkId, #checkNickname {
	width:130px !important;
	height:60px;
	margin:10px;
	cursor:pointer;
}

#checkIdDiv, #checkNicknameDiv {
	width:524px;
	display: flex; justify-content:center;
	align-items: center;
}

#teamDiv {
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
	width:360px !important;
	height:60px; background-color:#e9ecef;
}
#maAddr1 { 
	background-color:#e9ecef;
}

#findAddrDiv {
	width:524px;
	display: flex; justify-content:center; align-items: center;
}
</style>

</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>
	<section>
	<div id="joinDiv">
	<c:choose>
		<c:when test="${sessionScope.member != null }">
			<c:redirect url="/"></c:redirect>
		</c:when>
		
		<c:otherwise>
		<H1 style="float:left;font-size:36px;">회원가입</H1>
		<form action="/member/memberJoin" method="post" id="joinForm" onsubmit="return chkValue(this);">
			
			<div>	
				<div id="checkIdDiv">
				<input type="text" name="miId" placeholder="아이디를 입력해주세요." onkeyup="chkId(event)" style="width:330px;"/><img src="/resources/img/icon/checkId.png" id="checkId" /><br></div>
				<H5 style="margin:0;padding:0;">* 아이디는 영어,숫자를 조합하여 4자이상 입력해주세요.</H5>
				<input type="password" name="miPwd" placeholder="비밀번호" /><br>
				<H5 style="margin:0;padding:0;">* 비밀번호는 영문, 숫자 특수문자를 혼합하여 8~20자로 입력해주세요.</H5>
				<input type="password" name="miPwd_re" placeholder="위에 입력한 비밀번호와 동일한 비밀번호를 입력해주세요." /><br><br>
				<hr style="width:520px;"><br>
				
				<div id="checkNicknameDiv">
				<input type="text" name="miNickname" placeholder="닉네임을 입력해주세요." onkeyup="chkNickname(event)" style="width:330px;"/><img src="/resources/img/icon/checkNickname.png" id="checkNickname" /><br>
				</div>
				
				<input type="email" name="miEmail" placeholder="이메일 주소를 입력해주세요.      ex) user@pokerium.co.kr" /> <br><br>
				
				<div id="teamDiv">
					<div class="teamImageDiv"><label><img src="/resources/img/icon/team_valor.png" class="teamImage" /><br><input type="radio" name="miTeam" class="radioTeam"  checked value="R"/>발로</label></div>
					<div class="teamImageDiv"><label><img src="/resources/img/icon/team_mystic.png" class="teamImage" /><br><input type="radio" name="miTeam" class="radioTeam" value="B" />미스틱</label></div> 
					<div class="teamImageDiv"><label><img src="/resources/img/icon/team_instinct.png" class="teamImage" /><br><input type="radio" name="miTeam" class="radioTeam" value="Y" />인스팅트</label></div>
					<br><br><H5 style="margin:0;padding:0;">* 팀을 선택해주세요. 미선택시 발로가 선택됩니다.</H5>
				</div>
				<br>
				<br>
				<br>
				<hr style="width:520px;">
				<br>	
				<input type="text" name="miName" placeholder="이름을 입력해주세요."/>
				<div id="birthGender">
					<input type="date" id="miBirth" name="miBirth" value="2000-01-01" min="1900-01-01" max="2099-12-31" />
					<select name="miGender" id="miGender">
						<option value="" selected disabled>성별</option>
						<option value="M" >남자</option>
						<option value="F" >여자</option>
					</select>
				</div>
				<div id="miPhoneDiv">
					<select class="miPhone" id="miPhone1" name="miPhone1" style="padding:0;">
						<option value="" selected disabled>- 선 택 -</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select>-
					<input class="miPhone" type="text" maxlength="4" size="4" id="miPhone2" name="miPhone2" onkeyup="onlyNum(this);"/>-
					<input class="miPhone" type="text" maxlength="4" size="4" id="miPhone3" name="miPhone3" onkeyup="onlyNum(this);"/>
				</div>
				<br>
				<hr style="width:520px;">
				<br>
				<div id="memberAddrDiv">
					<div id="findAddrDiv">
						<img src="/resources/img/icon/findAddr.png" id="findAddr" onclick="sample6_execDaumPostcode()"/> <input type="text"  id="maZip" name="maZip" placeholder="우편번호를 입력해주세요." readonly/>
					</div>
					<input type="text"  id="maAddr1" name="maAddr1" placeholder="기존주소를 입력해주세요." readonly/>
					<input type="text"  id="maAddr2" name="maAddr2" placeholder="상세주소를 입력해주세요."/>
				</div>
				<br>
				<hr style="width:520px;">
				<br>
				<input type="submit" id="submitBtn" value=""/>
				
	 		</div>
		</form>
		</c:otherwise>
		</c:choose>
	</div>
	
	<br>

	</section>
	<%@include file ="/WEB-INF/views/common/footer.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script>
	$('#checkId').click(function(){

		var miId = $('input[name=miId]').val();
		
		$.ajax({
			url : "/member/memberIdCheck",
			data : {"miId":miId},
			type : "get",
			success : function(result){
				if(result=="true") {
					alert('[' + miId + ']는 사용 불가능한 ID 입니다.');
					$('input[name=miId]').focus();
				} else {
					alert('[' + miId + ']는 사용 가능한 ID 입니다.');
					$('input[name=miId]').focus();
				}
			},
			error : function(){
				console.log("ajax 통신 실패");
			}
		});
	});
	$('#checkNickname').click(function(){
		var miNickname = $('input[name=miNickname]').val();
		
		$.ajax({
			url : "/member/memberNicknameCheck",
			data : {"miNickname":miNickname},
			type : "get",
			success : function(result){
				if(result=="true") {
					alert('[' + miNickname + ']는 사용 불가능한 닉네임 입니다.');
					$('input[name=miNickname]').focus();
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
</body>
</html>