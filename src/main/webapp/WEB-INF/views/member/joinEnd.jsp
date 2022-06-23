<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
	
<style>
#step3 {
	color: #116916;
	font-weight: bold;
}
</style>
		<div class="join_main_head">
				<h3>가입완료</h3>
				<ul>
					<li class="step" id="step1"><span>01 약관동의&nbsp;>&nbsp;</span></li>
					<li class="step" id="step2"><span>02 정보입력&nbsp;>&nbsp;</span></li>
					<li class="step" id="step3"><span>03 가입완료</span></li>
				</ul>
			</div>
			<div class="join_box" style="border-top:1px solid #dbdbdb; border-bottom: 1px solid #dbdbdb;">
				<div class="img_check">

					<img src="<%= request.getContextPath() %>/images/check.png" alt="" width="70px">
				</div>
				<h4 id="end">회원가입 완료!</h4>
				<div class="finish">

					<span>회원가입이 성공적으로 완료되었습니다.</span>
					<span style="display:block">* 회원가입 확인 및 수정은 마이페이지 > 회원 정보 수정에서 가능합니다.</span>
				</div>
			</div>

			<div class="btn_box">
				<button id="btn_home" onclick="location.href='<%= request.getContextPath() %>';">홈으로</button>
				<button id="btn_log" onclick="location.href='<%= request.getContextPath() %>/member/login';">로그인</button>
			</div>
			
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

