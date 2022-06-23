<%@page import="board.model.dto.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/board.css" />
<%
	List<Question> list = (List<Question>) request.getAttribute("list");
	int cPage = (int)request.getAttribute("cPage");
%>
<style>
.mypage_hd {
	border-bottom: 0px solid !important;
	}
.page-bar {
	text-align: center;
	text-decoration: none;
    color: #000;
    margin-left: 8px;
}
</style>
<div class="my_page_content">

	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
	<div class="my_sub_content">
		
		<button type="button" class="btn_question" onclick="location.href='<%= request.getContextPath() %>/mypage/boardQuestion';">1:1 문의하기</button>
		<button type="button" class="btn_faq" onclick="location.href='<%= request.getContextPath() %>/board/faq';">FAQ</button>
		<h4 class="mypage_hd">1:1 문의</h4>
		
			<div class="board_question_zone">
					<table class="question_list">
						<thead>
							<tr>
								<th>문의날짜</th>
								<th>제목</th>
								<th>문의상태</th>
							</tr>
						</thead>
						<tbody>
						<% if(list == null || list.isEmpty()) {%>
						<tr>
							<td colspan="4">작성한 게시글이 없습니다.</td>
						</tr>
						<% } else { 
							for(Question q : list) {
						%>
						<tr>
								<td><%= q.getRegDate() %></td>

								<td>
								<a href="<%= request.getContextPath() %>/mypage/boardQuestionView?no=<%= q.getPostingNo() %>"><%= q.getTitle() %></a>
								</td>
								<td><%= q.getAnswerNo() == 0 ? "대기중" : "완료" %></td>
							</tr>
							<% }
							
						} %>
						</tbody>
					</table>
				</div>
<%= request.getAttribute("pageBar") != null ? request.getAttribute("pageBar") : ""%>
		</div>
	</div>





<%@ include file="/WEB-INF/views/common/footer.jsp"%>