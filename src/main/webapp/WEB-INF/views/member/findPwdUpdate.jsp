<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = (String)request.getAttribute("email");
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />

	<div class="wrap_main">
			<div class="find_box">
       <h3 class="head_log">비밀번호 찾기</h3>
				<div class="find_main_box">
			<div class="find_id_box">
				<form name="updatePwdFrm" method="POST" action="<%= request.getContextPath() %>/member/findPwdUpdate" onsubmit="return checkPwd();">
				<h5>인증번호 입력</h5>
				<span class="input_area">
				<input type="password" name="randomPwd" id="userPwd" maxlength="15">
				</span>
				<h5>변경할 비밀번호</h5>
				<span class="input_area">
				<input type="password" name="newPwd" id="newPwd" maxlength="15">
				</span>
				<h5>변경할 비밀번호 확인</h5>
				<span class="input_area">
				<input type="password" name="newPwd2" id="newPwd2" maxlength="15">
				</span>
				<input type="hidden" name="email" value="<%= email %>">
			<div class="btnArea">
			<button id="updatePwdBtn">변경하기</button>
			</div>
				</form>
				
			</div>
			<div class="plus">
				<span>- 회원 가입 시 입력한 이름과 휴대폰 번호를 입력해주세요.</span>
				<!-- <span>- SNS 계정으로 가입하신 경우 해당 웹사이트에서 ID 찾기를 진행해주세요..</span> -->
				<span>- 위 방법으로 찾지 못할 경우 Salabrity 고객센터(02-0000-0000)으로 문의해주세요.</span>
			</div>
		</div>
		</div>
</div>
<script>
		function checkPwd() {
			const newPwd = document.getElementById('newPwd');
			const newPwd2 = document.getElementById('newPwd2');
			
			/* 하나라도 공백으로 입력 시 alert 후  submit 하지 않음 */
			if(newPwd.value == "" || newPwd2.value == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			/* 비밀번호와 비밀번호 확인의 값이 다를 시 alert 후 submit 하지 않음 */
			if(newPwd.value != newPwd2.value){
				alert("비밀번호와 비밀번호 확인이 다릅니다.");
				return false;
			}
			
			return true;
		}
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

