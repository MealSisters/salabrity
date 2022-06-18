<%@ page import="board.model.dto.PostingExt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	PostingExt posting = (PostingExt) request.getAttribute("posting");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/question/questionBoard.css" />

<div id="faq-board-update-wrap">
	<span class="main-title">자주 묻는 질문</span>
	<span class="main-sub-title">*표시가 된 곳은 필수 입력사항입니다.</span>
	<div>
		<form
			name="boardUpdateFrm" 
			action="<%= request.getContextPath() %>/board/faqUpdate" 
			method="POST">
			<table class="tbl-board-update">
				<tr>
					<th>작성자</th>
					<td>
						<div>
							<input type="text" name="memberId" value="<%= posting.getMemberId() %>" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<th>제목<sup>*</sup></th>
					<td>
						<div>
							<input type="text" name="title" value="<%= posting.getTitle() %>" />
						</div>
					</td>
				</tr>
				<tr>
					<th>내용<sup>*</sup></th>
					<td>
						<div>
							<textarea rows="5" cols="40" name="content"><%= posting.getContent() %></textarea>
						</div>
					</td>
				</tr>
			</table>
			<div class="board-button-wrap">
				<input type="submit" value="수정" id="board-update-btn" />
				<input type="hidden" name="no" value="<%= posting.getPostingNo() %>" />
				<input type="hidden" name="boardCode" value="<%= posting.getBoardCode() %>" />
				<input type="reset" value="취소" id="board-back-btn" onclick="history.go(-1);" />
			</div>
		</form>
	</div>
</div>
<script src="<%= request.getContextPath() %>/js/validation.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>