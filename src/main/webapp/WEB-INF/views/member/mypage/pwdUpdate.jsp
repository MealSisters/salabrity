<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/member.css" />
<script>
window.onload = () => {
	<% if(msg != null) { %>
	alert("<%= msg %>");
	<% } %>
}
</script>
	<div class="my_page_content">

	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
	<div class="my_sub_content"><h4 class="mypage_hd">비밀번호 재설정</h4>
	<div class="update_content">
		<form 
			name="passwordUpdateFrm" method="POST" action="<%=request.getContextPath()%>/mypage/pwdUpdate">
			
			<div class="update_cont_box">
					<div class="input_box">
					<label class="member_title">아이디</label> <input type="text" id="memberId" value="<%= loginMember.getMemberId() %>" readOnly class="input__text">
				</div>

					<div class="input_box">
					<label class="member_title">기존 비밀번호</label>
					<input type="password" name="oldPassword" id="oldPassword" class="input__text" required>
					
					</div>
				
				<div class="input_box">
					<label class="member_title">새 비밀번호</label>
					<input type="password" name="newPassword" id="newPassword" class="input__text" required>
					
					</div>
					
					<div class="input_box">
					<label class="member_title">비밀번호 확인</label>
						<input type="password" id="newPasswordCheck" class="input__text" required><br>
					
					</div>
					
					

				</div>
					<div class="btn_update_box">
						<button id="btn_update_can" onclick="location.href='<%= request.getContextPath() %>/mypage/memberUpdate';">취소</button>
						<button type="submit" id="btn_update">비밀번호 재설정</button>
					</div>
			<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
		</form>
		</div>
	</div>
	</div>
	
	<script>
	newPasswordCheck.onblur = () => {
		if(newPassword.value !== newPasswordCheck.value){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}	
		return true;
	};
	
	document.passwordUpdateFrm.onsubmit = () => {
		// pw는 대소문자, 숫자, 특수문자를 모두 포함하여 10자리 이상 입력해주세요.
		if(!/^(?=.*?[A-za-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(oldPassword.value)){
			alert("비밀번호는 숫자/대문자/소문자/특수문자를 조합하여 8글자 이상이어야 합니다.");
			return false;
		}
		if(!/^(?=.*?[A-za-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/.test(newPassword.value)){
			alert("비밀번호는 숫자/대문자/소문자/특수문자를 조합하여 8글자 이상이어야 합니다.");
			return false;
		}
		if(!newPasswordCheck.onblur()){
			return false;
		}
	}	
	</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
