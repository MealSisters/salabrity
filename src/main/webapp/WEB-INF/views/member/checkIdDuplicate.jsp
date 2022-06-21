<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/basic.css" />

<%
	String memberId = request.getParameter("memberId");
	boolean available = (boolean) request.getAttribute("available");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복검사</title>
<style>

div#checkId-container{text-align:center; padding-top:50px;}
span#duplicated{color:red;}
.btn_close {background-color: #116916;
	border: 1px solid #fff;
	height: 29px;
	width: 50px;
	color: #fff;
	font-size: 13px;}
</style>
</head>
<body>
	<div id="checkId-container">
	<% if(available) { %>
		<p><font color="red"><%= memberId %></font>는 사용가능한 아이디입니다.</p>
		<p><button type="button" onclick="closePopup();" class="btn_close">닫기</button></p>
		<script>
		const closePopup = () => {
			// opener 부모창 window객체
			const frm = opener.document.memberEnrollFrm;
			frm.memberId.value = '<%= memberId %>';
			frm.idValid.value = 1;
			
			self.close(); // 현재창 닫기
		};
		</script>
	<% } else { %>
		<p><span id="duplicated"><%= memberId %></span>는 이미 사용중입니다.</p>
		<form name="checkIdDuplicateFrm" action="<%= request.getContextPath() %>/member/checkIdDuplicate">
			<input type="text" name="memberId" id="memberId"/>
			<button type="button" onclick="checkId();">중복검사</button>
		</form>
	<% } %>
	</div>
<script>
	const checkId = () => {
		if(!/^[A-Za-z0-9]{6,}$/.test(memberId.value)){
			alert("아이디는 대소문자/숫자를 조합하여 6글자 이상이어야 합니다.");
			return false;
		}
		document.checkIdDuplicateFrm.submit();
	}
</script>
</body>
</html>
