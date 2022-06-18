<%@page import="board.model.dto.PostingAttach"%>
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
<%
	PostingExt posting = (PostingExt) request.getAttribute("posting");
%>
<style>
	
	.file_con a {
	text-decoration:underline;
	color:#000;
	font-size:13px;
	}
	.btn_del_q {
		float: right;
    display: inline-block;
       margin-top: 27px;
    margin-right: 20px;
    background-color: #fff;
    border: 1px solid #116916;
    height: 30px;
    font-size: 12px;
    font-weight: bold;
    color: #116916;
        width: 50px;
        cursor:pointer;
	}
	.mypage_hd {
	border-bottom: 0px solid !important;
	}
</style>
<div class="my_page_content">

	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>


	<div class="my_sub_content">
		<!-- 컨텐츠 -->
		<button type="" class="btn_del_q" onclick="deleteQuestion()">삭제</button>
		<h4 class="mypage_hd">1:1 문의</h4>
		<div class="board_question_zone_sec">


			<div class="question_zone_view">
				<div class="question_view_hd">
					<h3><%= posting.getTitle() %></h3>
				</div>

				<div class="question_view_info">
					<span class="view_info_name"><%= loginMember.getMemberName() %></span> <span class="view_info_day"><%= posting.getRegDate() %></span>
				</div>
				

				<div class="question_view_content">
				<!--  <div class="view_question_box"> -->
					
						<div class="q_cont">
							<p><%= posting.getContent() %></p>
						</div>
				<!--   	</div>-->	
					
				<% 
				List<PostingAttach> attachments = posting.getAttachments();
				if(attachments != null && !attachments.isEmpty()) {
					for(PostingAttach attach : attachments) {
		%>
		<div class="file_con" style="padding:5px 0px;">
				<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
				<span style="font-size:13px; margin-right:5px;">첨부파일 </span><a href="<%= request.getContextPath() %>/upload/question/mypage/<%= attach.getRenamedFilename() %>"><%= attach.getOriginalFilename() %></a>
		</div>
		<%
				}
			}
		%>
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
	<form action="<%= request.getContextPath() %>/mypage/questionDelete" name="questionDeleteFrm" method="POST">
		<input type="hidden" name="no" value="<%= posting.getPostingNo() %>" />
	</form>
<script>
const deleteQuestion = () => {
	if(confirm("게시글을 삭제하시겠습니까?"))
		document.questionDeleteFrm.submit();
};
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>