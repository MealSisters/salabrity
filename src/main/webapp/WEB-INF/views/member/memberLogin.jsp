<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />

	
<script>
window.onload = () => {
<% if(msg != null) { %>
	alert("<%= msg %>");
<% } %>
	
	
	<% if(loginMember == null) { %>
	document.loginFrm.onsubmit = (e) => {
		const memberIdVal = memberId.value;
		const passwordVal = password.value;
		
		//console.log(memberIdVal, passwordVal);
		
		if(!/^.{3,}$/.test(memberIdVal)) {
			alert("유효한 아이디를 입력해주세요.");
			memberId.select(); // memberId의 모든 텍스트 선택
			return false;
		}
		
		if(!/^.{3,}$/.test(passwordVal)) {
			alert("유효한 비밀번호를 입력해주세요.");
			password.select();
			return false;
		}
	};
	<% } %>
};
</script>
<div class="wrap_main">
<div class="avatar">
            <img src="https://www.markuptag.com/images/user-icon.jpg" alt="Avatar">
        </div>
        
<div class="form_cont">
<!-- 로그인 폼 시작 -->
	<form id="loginFrm" name="loginFrm" method="POST" action="<%= request.getContextPath() %>/member/login">
		<div class="member_login_box">
			<div class="login_input_cont">
				<div class="test">
					<input type="text" id="memberId" name="memberId" placeholder="아이디" value="<%= saveId != null ? saveId : "" %>"> 
					<input type="password" id="password"
						name="password" value="" placeholder="비밀번호">
				</div>
				<button type="submit" class="btn_member_login">로그인</button>
				<button type="button" id="btn_member_join" class="btn_member_join"
					onclick="location.href='<%= request.getContextPath() %>/member/joinAgreement';">회원가입</button>
			</div>

			<div class="id_chk">
				<span class="form_element"> <input type="checkbox" name="saveId" id="saveId" <%= saveId != null ? "checked" : "" %>/> 
					<label for="saveId" class="on">아이디 저장</label>
				</span>
			</div>
			<ul class="idpw_list">
				<li><button type="button" id="btnFindId" class="btnFindId"
						onclick="location.href='<%= request.getContextPath() %>/member/findId';">아이디
						찾기</button></li>
				<li><button type="button" id="btnFindPwd" class="btnFindPwd" onclick="location.href='<%= request.getContextPath() %>/member/findPwd';">비밀번호 찾기</button></li>
			</ul>
		</div>
	</form>
</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>