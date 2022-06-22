<%@ page import="member.model.dto.MemberRole" %>
<%@ page import="board.model.dto.BoardCode" %>
<%@ page import="member.model.dto.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<% 
	Member loginMember = (Member) session.getAttribute("loginMember");

	String msg = (String) session.getAttribute("msg");
	if(msg != null) {
		session.removeAttribute("msg"); 		
	}
	
	String saveId = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(Cookie cookie : cookies){
			if("saveId".equals(cookie.getName())) { // 저장된 데이터 값에 대한 이름 가져오기
				saveId = cookie.getValue(); // 이름에 저장된 데이터 가져오기
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Salabrity</title>
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/basic.css" />
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css" />
	<script src="https://kit.fontawesome.com/97c6ec6a69.js" crossorigin="anonymous"></script>
	<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
	<script>
	window.onload = () => {
		 <% if(msg != null) { %>
				alert("<%= msg %>");
		 <% } %>
	};
	</script>
</head>
<body>
	<div id="container">
		<!-- header 시작 -->
		<header>
			<%-- 메인 로고 --%>
			<div class="main-logo">
				<a href="<%= request.getContextPath() %>" title="메인화면으로 돌아가기">
					Salabr<i class="fa-solid fa-seedling"></i>ty
				</a>
			</div>
			<%-- 메인 메뉴 --%>
			<nav class="main-nav">
				<ul>					
					<li class="diet-survey"><a href="<%= request.getContextPath() %>/surveyResult">맞춤식단찾기</a></li>
					<li class="diet-calendar"><a href="<%= request.getContextPath() %>/calendar">샐브의식단</a></li>
					<li class="diet-products"><a href="<%= request.getContextPath() %>/product/productList">전체상품</a></li>
					<li class="community-board"><a href="<%= request.getContextPath() %>/board/community">커뮤니티</a></li>
					<li class="notice"><a href="<%= request.getContextPath() %>/board/notice?boardCode=<%= BoardCode.N %>">공지사항</a></li>
				<%-- 관리자 페이지 분기 처리 --%>
				<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { %>
					<li class="admin"><a href="<%= request.getContextPath() %>/admin/dashboard">관리자페이지</a></li>
				<% } %>
				</ul>
			</nav>
			<nav class="member-nav">
				<%-- 로그인 전/후 분기 --%>
				<ul>
					<li class="login">
					<% if(loginMember == null) { %>
						<%-- 로그인 전 --%>
						<a href="<%= request.getContextPath() %>/member/login" title="로그인"><i class="fa-solid fa-user"></i></a>
					<% } else { %>
						<%-- 로그인 후 --%>
						<input type="hidden" id="chatMemberId" value="<%= loginMember.getMemberId() %>" />
					    <input type="hidden" id="chatMemberName" value="<%= loginMember.getMemberName() %>" />
					    <input type="hidden" id="chatPhone" value="<%= loginMember.getPhone() %>" />
					    <input type="hidden" id="chatEmail" value="<%= loginMember.getEmail() %>" />
						<a href="<%= request.getContextPath() %>/mypage/orderList" title="마이페이지"><i class="fa-solid fa-user"></i></a>
						<div class="member-nav-depth">
							<div class="inner-member-nav">
								<ul>
									<li class="shipping-info"><a href="<%= request.getContextPath() %>/mypage/orderList">쇼핑정보</a></li>
									<li class="my-info"><a href="<%= request.getContextPath() %>/mypage/memberUpdate">회원정보</a></li>
									<li class="activity-info"><a href="<%= request.getContextPath() %>/mypage/boardWriteList">활동정보</a></li>
									<li class="logout"><a href="<%= request.getContextPath() %>/member/logout">로그아웃</a></li>
								</ul>
							</div>
						</div>
					<% } %>
					</li>
					<li class="cart">
						<a href="<%= request.getContextPath() %>/order/cart" title="장바구니"><i class="fa-solid fa-cart-shopping"></i></a>
						<%-- 장바구니 수량 부분 --%>
						<%-- <span class="cart-order-cnt">0</span> --%>
					</li>
				</ul>
			</nav>
		</header>
		<script>
		/**
		 * 로그인 전 장바구니 클릭시 경고창 발생
		 */
		document.querySelector(".cart").addEventListener('click', (e) => {
			if(<%= loginMember == null %>) {
				alert("로그인 후 이용할 수 있습니다.");
				e.preventDefault();
			}
		});
		</script>
		<!-- header 끝 -->
		<section id="content">