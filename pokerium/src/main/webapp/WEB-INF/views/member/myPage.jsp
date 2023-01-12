<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>
<style>
	.div {
		display:inline-block;
	}
</style>
	
<script>
function chkValue(frm){    
    var miPwd = frm.miPwd.value;      
    var new_miPwd = frm.new_miPwd.value;
    var new_miPwd_re = frm.new_miPwd_re.value;
    var miEmail = frm.miEmail.value; 


    if (miEmail == ""){
       	alert("이메일을 입력해주세요.");               frm.miEmail.focus();   return false;
    }
    
    if (miPwd == ""){
       	alert("기존 비밀번호를 입력해주세요.");               frm.miPwd.focus();   return false;
    }
    
    
    if (new_miPwd_re != new_miPwd){
       	alert("입력한 비밀번호가 서로 다릅니다. 다시 확인해주세요.");               frm.new_miPwd_re.focus();   return false;
    }

    return true;
}

	function isDrop() {
		if(confirm("정말 회원 탈퇴 하시겠습니까?\n탈퇴하면 영구적으로 되돌릴수 없습니다.")){
			location.href="/member/memberDrop.do";
		}
	}
	
	
	
</script>

	<form id="myForm" action="/member/memberUpdate.do" method="post" onsubmit="return chkValue(this);">
		
			<div><H1 style="display:inline;">마이페이지</H1><a href="/member/myQnAPage.do"><button type="button">내 문의</button></a></div>
			
			
			<div class="div">아이디</div>  <div class="div">${sessionScope.member.miId }</div><br>
			<div class="div">이메일</div>  <div class="div"><input type="email" name="miEmail" value="${sessionScope.member.miEmail }"/></div><br>
			<div class="div">기존 비밀번호</div>  <div class="div"><input type="password" name="miPwd" placeholder="기존 비밀번호를 입력해주세요."/></div><br>
			<div class="div">새 비밀번호</div>  <div class="div"><input type="password" name="new_miPwd" placeholder="새 비밀번호를 입력해주세요."/></div><br>
			<div class="div">새 비밀번호 확인</div >  <div class="div"><input type="password" name="new_miPwd_re" placeholder="새 비밀번호 확인" /></div><br>
			<div class="div">* 비밀번호는 변경시에만 입력해주세요.</div>
			<br>
			<hr>
			<br>
			<div class="div">이름</div>  <div class="div">${sessionScope.member.miName }</div><br>
			<div class="div">가입일</div>  <div class="div">${sessionScope.member.miRegtime }</div> <div class="div">최근 접속일</div>  <div class="div">${sessionScope.member.miLastlogin }</div><br>
			<div class="div">생일</div>  <div class="div">${sessionScope.member.miBirth }</div><div class="div">성별</div>  <div class="div"><c:choose><c:when test="${sessionScope.member.miGender=='M' }">남자</c:when><c:otherwise>여자</c:otherwise></c:choose></div><br><br>
			
			<button type="button" onclick="isDrop()">회원 탈퇴</button>       
			<input type="submit" value="수정" /> 
	
	</form><br>

</body>
</html>