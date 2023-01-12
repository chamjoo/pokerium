<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>
<script>

		function chkValue(frm){
		    var miId = frm.miId.value;      
		    var miPwd = frm.miPwd.value;      
		    var miPwd_re = frm.miPwd_re.value;
		    var miEmail = frm.miEmail.value; 
		    var miName = frm.miName.value; 
		    var miName = frm.miGender.value;
		    var miPhone1 = frm.miPhone1.value;      
		    var miPhone2 = frm.miPhone2.value;      
		    var miPhone3 = frm.miPhone3.value;
		    
		    console.log(miId);
		    if (miId == ""){
		       	alert("아이디를 입력해주세요.");               frm.miId.focus();   return false;
		    }
		    
		    if (miPwd == ""){
		       	alert("비밀번호를 입력해주세요.");               frm.miPwd.focus();   return false;
		    }
		    
		    if (miPwd_re != miPwd){
		       	alert("입력한 비밀번호가 서로 다릅니다. 다시 확인해주세요.");               frm.miPwd_re.focus();   return false;
		    }
			if (miEmail == "") {
		  		alert("이메일 주소를 입력해주세요.");					frm.miEmail.focus();     return false;	
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
	 
		    return true;
		}
		function onlyNum(obj){
			//특정 컨트롤에 숫자만 입력되도록 하는 함수로 숫자가 아닌 값이 입력될 경우 값을 모두 삭제시킴
				if (isNaN(obj.value)){
					obj.value = "";
			}
}

</script>

	<style>
		#joinForm{
			width : 500px;
		}
	</style>
	<div>
		<form action="/member/memberJoin.do" method="post" id="joinForm" onsubmit="return chkValue(this);">
			<div>	
			
				<H1>회원가입</H1>
				<input type="text" name="miId" placeholder="아이디를 입력해주세요." /><br>
				<input type="password" name="miPwd" placeholder="비밀번호" /><br>
				* 영문, 숫자 특수문자를 혼합하여 8~20자의 비밀번호를 입력해주세요.<br>
				<input type="password" name="miPwd_re" placeholder="위에 입력한 비밀번호와 동일한 비밀번호를 입력해주세요." /><br>
				
				<input type="email" name="miEmail" placeholder="이메일 주소를 입력해주세요." /> 
		
			
				<br>
				<br>
				<hr>
				<br>	
				<input type="text" name="miName" placeholder="이름을 입력해주세요."/><br>
				<input type="date" name="miBirth" value="2000-01-01" min="1900-01-01" max="2099-12-31" />
				<select name="miGender">
					<option value="" selected disabled>성별</option>
					<option value="M" >남자</option>
					<option value="F" >여자</option>
				</select><br>
				<select id="miPhone1" name="miPhone1">
				<option value="" selected disabled>- 선 택 -</option>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="019">019</option>
			</select>-
			<input type="text" maxlength="4" size="4" id="miPhone2" name="miPhone2" onkeyup="onlyNum(this);"/>-
			<input type="text" maxlength="4" size="4" id="miPhone3" name="miPhone3" onkeyup="onlyNum(this);"/>
			<br><br>
				<input type="submit" value="회원가입" />
	 		</div>
		</form>
	</div>
	
	<br>
	
	<a href="/"> 메인페이지로 이동</a><br>
	

</body>
</html>