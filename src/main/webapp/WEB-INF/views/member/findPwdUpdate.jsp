<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)request.getAttribute("memberId");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<style>
#btn_update {
	    width: 321px;
    height: 53px;
}
</style>
<script>
window.onload = () => {
	<% if(msg != null) { %>
	alert("<%= msg %>");
	<% } %>
}
</script>
	<div class="wrap_main">
			<div class="find_box">
       <h3 class="head_log">비밀번호 인증</h3>
				<div class="find_main_box">
			<div class="find_id_box">
				<form name="updatePwdFrm" method="POST" action="<%= request.getContextPath() %>/member/findPwdUpdate" onsubmit="return checkPwd();">
				
				<div class="find_input">
				<input type="password" name="randomPwd" id="userPwd" class="find_input_box" placeholder="인증번호">
				<input type="password" name="newPassword" id="newPassword" class="find_input_box" placeholder="새 비밀번호">
				<input type="password" name="chkPwd" id="chkPwd" class="find_input_box" placeholder="비밀번호 확인">
			</div>	
				<input type="hidden" name="memberId" value="<%= memberId %>">
			<button id="btn_update" class="btn_find_id">변경하기</button>
				</form>
				
			</div>
			<div class="plus">
				<span>- 전송받은 인증 번호를 입력해주세요.</span>
				<!-- <span>- SNS 계정으로 가입하신 경우 해당 웹사이트에서 ID 찾기를 진행해주세요..</span> -->
				<span>- 위 방법으로 찾지 못할 경우 Salabrity 고객센터(02-0000-0000)으로 문의해주세요.</span>
			</div>
		</div>
		</div>
</div>
<script>
chkPwd.onblur = () => {
	if(newPassword.value !== chkPwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		newPassword.select();
		return false;
	}	
	return true;
};
document.updatePwdFrm.onsubmit = () => {
	if(!/^(?=.*?[A-za-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(newPassword.value)){
		alert("비밀번호는 숫자/대문자/소문자/특수문자를 조합하여 8글자 이상이어야 합니다.");
		return false;
	}
	if(!chkPwd.onblur()){
		return false;
	}
}

	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

