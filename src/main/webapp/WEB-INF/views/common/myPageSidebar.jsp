<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/member/myPage.css">

	<aside class="sub">
		<h3 class="my_hd">마이페이지</h3>
		<ul class="sub_my_box">

			<ul class="sub_box_inner" id="top_bor">
				<li class="sub_inner_list">
					<h4 class="li_head">쇼핑정보</h4>
				</li>
				<li class="sub_inner_list"><a href="<%= request.getContextPath() %>/mypage/orderView">주문/배송 조회</a></li>
				<li class="sub_inner_list"><a href="">취소/환불 내역</a></li>

			</ul>

			<ul class="sub_box_inner">
				<li class="sub_inner_list">
					<h4 class="li_head">회원정보</h4>
				</li>
				<li class="sub_inner_list"><a href="<%= request.getContextPath() %>/mypage/memberUpdate">회원 정보 변경</a></li>
				<li class="sub_inner_list"><a href="">배송지 관리</a></li>
				<li class="sub_inner_list"><a href="<%= request.getContextPath() %>/mypage/memberDelete">회원 탈퇴</a></li>
			</ul>

			<ul class="sub_box_inner">
				<li class="sub_inner_list">
					<h4 class="li_head">활동정보</h4>
				</li>
				<li class="sub_inner_list"><a href="<%= request.getContextPath() %>/mypage/boardWriteList">작성 게시글 조회</a></li>
				<li class="sub_inner_list"><a href="<%= request.getContextPath() %>/mypage/boardQuestionList">1:1 문의</a></li>
			</ul>


		</ul>
	</aside>
