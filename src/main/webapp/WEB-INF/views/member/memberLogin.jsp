<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<%
String msg = (String) session.getAttribute("msg");
	if(msg != null)
	session.removeAttribute("msg"); 
	
	String saveId = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			System.out.println("Cookie{" + cookie.getName() + "=" + cookie.getValue() + "}");
			if("saveId".equals(cookie.getName())){ // 저장된 데이터 값에 대한 이름 가져오기
				saveId = cookie.getValue(); // 이름에 저장된 데이터 가져오기
			}
		}
	}
%>
	
<script>
window.onload = () => {
<% if(msg != null) { %>
	alert("<%= msg %>");
<% } %>
	
	
	<% if(loginMember == null) { %>
	document.loginFrm.onsubmit = (e) => {
		const memberIdVal = memberId.value;
		const passwordVal = password.value;
		
		console.log(memberIdVal, passwordVal);
		
		if(!/^.{4,}$/.test(memberIdVal)) {
			alert("유효한 아이디를 입력해주세요.");
			memberId.select(); // memberId의 모든 텍스트 선택
			return false;
		}
		
		if(!/^.{4,}$/.test(passwordVal)) {
			alert("유효한 비밀번호를 입력해주세요.");
			password.select();
			return false;
		}
	};
	<% } %>
};
</script>
<h3 class="head_log">로그인</h3>
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
<!-- 
<div class="member_sns_login">
	<h3 class="head_log">SNS 로그인</h3>
	<div class="member_sns_login_in">
		<ul>
			<li><a href="#" class="btn_naver_login"><img
					src="<%= request.getContextPath() %>/images/naver.png"
					alt="네이버 아이디 로그인"> <span class="btn_naver_login">NAVER</span></a></li>
			<li><a href="#" class="btn_kakao_login"><img
					src="<%= request.getContextPath() %>/images/kakao.png"
					alt="카카오 아이디 로그인"> <span class="btn_kakao_login">KAKAO</span></a></li>
		</ul>
	</div>
</div>
 -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>