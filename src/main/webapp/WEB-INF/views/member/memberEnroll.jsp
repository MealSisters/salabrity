<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />


<style>
#step2 {
	color: #116916;
	font-weight: bold;
}

#address2 {
	width: 300px;
}

#inputDomain, #email {
    width: 139px;
}
</style>
<div class="join_main_head">
	<h3>정보입력</h3>
	<ul>
		<li class="step" id="step1"><span>01 약관동의&nbsp;>&nbsp;</span></li>
		<li class="step" id="step2"><span>02 정보입력&nbsp;>&nbsp;</span></li>
		<li class="step" id="step3"><span>03 가입완료</span></li>
	</ul>
</div>
<div class="join_box" style="border-top: 1px solid #dbdbdb;">
	<div class="join_main_box" style="border-bottom: 1px solid black;">
		<h4 class="use_agree">회원 정보 입력 (필수)</h4>
		<div class="member_box">

			<div class="input_box">
				<label class="member_title">아이디</label> <input type="text"
					name="memberId" id="memberId" class="input_text">
				<button type="button" class="checkId">중복확인</button>
				<span class="guide">* 6자리 이상의 영문 혹은 영문, 숫자를 조합하여 입력해 주세요</span>
			</div>
			<div class="input_box">
				<label class="member_title">비밀번호</label> <input type="password"
					name="password" id="password" class="input_text"> <span
					class="guide">* 영문, 대소문자, 숫자, 특수문자 중 3개 이상을 조합하여 10자리 이상
					입력해주세요.</span>
			</div>
			<div class="input_box">
				<label class="member_title">비밀번호 확인</label> <input type="password"
					name="checkPassword" id="checkPassword" class="input_text">
			</div>
			<div class="input_box">
				<label class="member_title">이름</label> <input type="text"
					name="memberName" id="memberName" class="input_text">

			</div>

			<div class="input_box">
				<label class="member_title">이메일</label> <input type="text"
					name="email" id="email" class="input__text"> <span style="font-size: 12px;">@</span>
				<input type="text" class="input__text" id="inputDomain">
				<div class="email_select">
					<select name="emailType" id="emailType">
						<option value="">직접입력</option>
						<option value="">naver.com</option>
						<option value="">gmail.com</option>
						<option value="">daum.net</option>
						<option value="">hanmail.net</option>
					</select>
				</div>
				<span class="guide"> <input type="checkbox" name="" id=""
					class="info_ck"> 다양한 할인 혜택과 이벤트 정보 메일 수신에 동의합니다.
				</span>
			</div>

			<div class="input_box">
				<label class="member_title">휴대폰 번호</label> <input type="tel"
					name="phone" id="phone" maxlength="11" class="input_text">
					<span class="guide"> <input type="checkbox" name="" id=""
						class="info_ck"> 다양한 할인 혜택과 이벤트 정보 메일 수신에 동의합니다.
					</span>
			</div>

			<div class="input_box">
				<label class="member_title">주소</label> <input type="text"
					name="address1" id="address1" class="input__text">
				<button type="button" class="btn_address">우편번호 검색</button>
				<input type="text" name="address2" id="address2" class="input__text">
			</div>
			<div class="input_box">
				<label class="member_title">생년월일</label> <input type="text"
					name="birthday" id="birthday" class="input_text"> <span
					class="guide">* 생년월일은 8자리로 입력해주세요. 예) 20001230</span>
			</div>
			<div class="input_box">
				<p class="member_title">성별</p>
				<div class="gender_cb">
					<input type="radio" id="male" name="gender" class="gender_ck"
						value="M"> <label for="male" class="checkbox_label">남성</label>
					<input type="radio" id="female" name="gender" class="gender_ck"
						value="F"> <label for="female" class="checkbox_label">여성</label>
				</div>
			</div>

		</div>
	</div>
	<div class="btn_box">
		<button id="btn_cancle"
			onclick="location.href='<%= request.getContextPath() %>';">취소</button>
		<button type="button" id="btn_join"
			onclick="location.href='<%= request.getContextPath() %>/member/joinEnd';">회원가입</button>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>



