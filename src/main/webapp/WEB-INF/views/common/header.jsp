<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Salabrity</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css" />
	<script src="https://kit.fontawesome.com/97c6ec6a69.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="container">
		<header>
			<%-- 변경 테스트2 --%>
			<%-- 메인 로고 --%>
			<div class="main-logo">
				<a href="<%= request.getContextPath() %>" title="메인화면으로 돌아가기">
					Salabr<i class="fa-solid fa-seedling"></i>ty
				</a>
			</div>
			<%-- 메인 메뉴 --%>
			<%-- hover시 세부 메뉴가 드롭될 수 있도록 변경 예정! --%>
			<nav class="main-nav">
				<ul>					
					<li class="diet-diagnosis"><a href="#">맞춤식단찾기</a></li>
					<li class="diet-calendar"><a href="#">식단캘린더</a></li>
					<li class="diete-products"><a href="#">전체식품</a></li>
					<li class="comminity-board"><a href="#">커뮤니티</a></li>
					<li class="notice"><a href="#">공지사항/이벤트</a></li>
				<%-- 관리자 페이지 조건문 적용 예정! --%>
				<%-- if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { --%>
					<li class="admin"><a href="<%= request.getContextPath()%>/admin/dashboard">관리자페이지</a></li>
				<%-- } --%>
				</ul>
			</nav>
			<nav class="member-nav">
				<%-- 로그인 전/후 분기할 예정! --%>
				<ul>
					<li class="login">
					<%-- if(loginMember == null) { --%>
						<%-- 로그인 전 --%>
						<a href="#" title="로그인"><i class="fa-solid fa-user"></i></a>
					<%-- } else { --%>
						<%-- 로그인 후 --%>
						<%-- 이 부분은 일단 주석처리해둘게요! --%>
						<!-- <a href="#" title="마이페이지"><i class="fa-solid fa-user"></i></a>
						<div class=inner-member-nav>
							<ul>
								<li class="shipping-info"><a href="#">쇼핑정보</a></li>
								<li class="my-info"><a href="#">회원정보</a></li>
								<li class="activity-info"><a href="#">내 활동정보</a></li>
									<li class="logout"><a href="#">로그아웃</a></li>
							</ul>
						</div> -->
					<%-- } --%>
					</li>
					<li class="cart">
						<a href="#" title="장바구니"><i class="fa-solid fa-cart-shopping"></i></a>
						
					</li>
				</ul>
			</nav>
		</header>
		
		<section id="content">