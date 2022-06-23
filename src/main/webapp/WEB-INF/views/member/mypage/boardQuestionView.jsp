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
	PostingExt answer = (PostingExt) request.getAttribute("answer");
%>
<style>

	.mypage_hd {
	border-bottom: 0px solid !important;
	}

</style>
<div class="my_page_content">

	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>


	<div class="my_sub_content">
		<!-- 컨텐츠 -->
		<button type="button" class="btn_del_q" onclick="deleteQuestion()">삭제</button>
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
						<div class="q_cont">
							<p>
							<%= posting.getContent() %></p>
						</div>
					
				<% 
				List<PostingAttach> attachments = posting.getAttachments();
				if(attachments != null && !attachments.isEmpty()) {
					for(PostingAttach attach : attachments) {
		%>
		<div class="file_con" style="padding:5px 0px;">
				<span style="font-size:13px; margin-right:5px;">첨부파일 </span><a href="<%= request.getContextPath() %>/upload/question/mypage/<%= attach.getRenamedFilename() %>"><%= attach.getOriginalFilename() %></a>
		</div>
		<%
				}
			}
		%>
						</div>
						<% 
						if(answer.getPostingNo() != 0){
						%>
				  	<div class="view_answer_box">
						
						<div class="answer_view_hd">
					<h3><%= answer.getTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></h3>
				</div>

				<div class="question_view_info">
					<span class="view_info_name">관리자</span> 
					<span class="view_info_day"><%= answer.getRegDate() %></span>
				</div>
				

				<div class="answer_view_content">
						<div class="a_cont">
							<p>
							<%= answer.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></p>
						</div>
						
						<% 
				List<PostingAttach> attachments2 = answer.getAttachments();
				if(attachments2 != null && !attachments2.isEmpty()) {
					for(PostingAttach attach2 : attachments2) {
		%>
		<div class="file_con" style="padding:5px 0px;">
				<span style="font-size:13px; margin-right:5px;">첨부파일 </span><a href="<%= request.getContextPath() %>/upload/question/mypage/<%= attach2.getRenamedFilename() %>"><%= attach2.getOriginalFilename() %></a>
		</div>
		<%
				}
			}
		%>
						
			</div>
		</div>
			<%
			}
		%>
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