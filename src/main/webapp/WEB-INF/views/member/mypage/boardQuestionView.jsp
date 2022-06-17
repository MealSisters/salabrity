<%@page import="board.model.dto.PostingExt"%>
<%@page import="board.model.dto.Posting"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/board.css" />

<div class="my_page_content">

	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>


	<div class="my_sub_content">
		<!-- 컨텐츠 -->
		<h4 class="mypage_hd">1:1 문의</h4>
		<div class="board_question_zone_sec">


			<div class="question_zone_view">
				<div class="question_view_hd">
					<h3></h3>
				</div>

				<div class="question_view_info">
					<span class="view_info_name"></span> <span class="view_info_day"></span>
				</div>

				<div class="question_view_content">
					<div class="view_question_box">
					
						<div class="q_cont">
							<p></p>
						</div>
					</div>
					
				<!--  	<div class="view_answer_box">
						<strong>A.</strong>
						<div class="view_answer_info">
							<strong>안녕하세요. 샐러브리티입니다.</strong> <span class="view_info_name">관리자</span>
							<span class="view_info_day">2022-06-12 12:00:45</span>
						</div>
						<div class="q_cont">
							<p>...</p>
							<p>~!~!@!##$</p>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>