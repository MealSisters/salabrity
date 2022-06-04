<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />

	
       <h3 class="head_log">아이디 찾기</h3>
			<div class="find_box">
				<div class="find_main_box">
			<div class="find_id_box">
				
				<div class="find_input">
					<input class="find_input_box" type="text" name="" id="" value placeholder="이름"><br>
					<input class="find_input_box" type="text" name="" id="phone" value placeholder="휴대폰 번호">
				</div>
				
				<button class="btn_find_id">아이디 찾기</button>
				
				<button class="btn_find">비밀번호 찾기</button>
				
				<button class="btn_find_log">로그인</button>
			</div>
			<div class="plus">
				<span>- 회원 가입 시 입력한 이름과 휴대폰 번호를 입력해주세요.</span>
				<span>- SNS 계정으로 가입하신 경우 해당 웹사이트에서 ID 찾기를 진행해주세요..</span>
				<span>- 위 방법으로 찾지 못할 경우 Salabrity 고객센터(02-0000-0000)으로 문의해주세요.</span>
			</div>
		</div>
		</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

