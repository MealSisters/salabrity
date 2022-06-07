<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/myPage.css" />

<div class="my_page_content">

<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp" %>

	<div class="my_sub_content">
		<h4 class="mypage_hd">회원 탈퇴</h4>
		<div class="del_content">

			<div class="del_hd">
				<h3>그동안 샐러브리티를 이용해주셔서 감사합니다.</h3>
				<span>회원 탈퇴하시기 전 다음 사항을 숙지하시길 바랍니다.</span>
			</div>
			<ul class="del_cont">
				<li class="del_li"><strong class="del_strong">1. 회원님이
						기존에 작성하신 게시물은 회원 탈퇴 시에도 삭제되지 않습니다.</strong> <span>삭제를 원하시는 경우에는 직접
						삭제 후 탈퇴하시길 바라며, 삭제가 불가능합니다.</span></li>
				<li class="del_li"><strong class="del_strong">2. 현재 진행
						중인 주문건이 있는 경우 탈퇴가 불가능합니다.</strong> <span>모든 상품의 주문 상태가 거래 확정, 반품 확정,
						취소 완료일 경우에만 탈퇴가 가능합니다.</span></li>
			</ul>
			<div class="del_comment">
				<div class="del_flex" id="del_flex_com">
					<strong class="del_com_strong">탈퇴사유</strong>
					<div class="del_select">
						<select name="del_ask" id="del_ask">
							<option value="">탈퇴사유선택</option>
							<option value="">고객 서비스(상담, 포장 등) 불만</option>
							<option value="">개인 정보 유출</option>
						</select>
					</div>
				</div>

				<div class="del_flex">
					<strong class="del_com_strong">기타의견</strong>
					<div class="del_textarea">
						<textarea name="" id="freetalk" title="기타의견"></textarea>
					</div>
				</div>

			</div>
			<div class="btn_del_box">
				<button id="btn_del_can">취소</button>
				<button type="button" id="btn_del">탈퇴하기</button>
			</div>
		</div>


	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

