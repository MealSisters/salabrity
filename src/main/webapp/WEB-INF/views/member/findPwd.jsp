<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<% String memberId = (String)request.getAttribute("memberId");  %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<script>
window.onload = () => {
	<% if(msg != null) { %>
	alert("<%= msg %>");
	<% } %>
}
</script>
	<div class="wrap_main">
			<div class="find_box">
       <h3 class="head_log">비밀번호 찾기</h3>
				<div class="find_main_box">
			<div class="find_id_box">
				<form name="findPwdFrm" method="POST" action="<%= request.getContextPath() %>/member/findPwd">
				
				<div class="find_input">
					<input class="find_input_box" type="text" name="memberId" id="" placeholder="아이디"><br>
					<input class="find_input_box" type="text" name="email" id="" placeholder="이메일">
				</div>
				<button type="submit" class="btn_find_id">비밀번호 찾기</button>
				</form>
				<button type="button" class="btn_find" onclick="location.href='<%= request.getContextPath() %>/member/findId';">아이디 찾기</button>
				
				<button type="button" class="btn_find_log" onclick="location.href='<%= request.getContextPath() %>/member/login';">로그인</button>
			</div>
			<div class="plus">
				<span>- 회원 가입 시 입력한 아이디와 이메일을 입력해주세요.</span>
				<!-- <span>- SNS 계정으로 가입하신 경우 해당 웹사이트에서 ID 찾기를 진행해주세요..</span> -->
				<span>- 위 방법으로 찾지 못할 경우 Salabrity 고객센터(02-0000-0000)으로 문의해주세요.</span>
			</div>
		</div>
		</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

