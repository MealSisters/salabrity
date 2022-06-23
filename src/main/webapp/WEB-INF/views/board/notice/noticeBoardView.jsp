<%@ page import="board.model.dto.PostingAttach" %>
<%@ page import="java.util.List" %>
<%@ page import="member.model.dto.MemberRole" %>
<%@ page import="board.model.dto.PostingExt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- 수진 start -->
<%
	PostingExt posting = (PostingExt) request.getAttribute("posting");
	
	boolean canEdit = loginMember != null
			&& (loginMember.getMemberId().equals(posting.getMemberId())
					|| loginMember.getMemberRole() == MemberRole.A);
%>
<!-- 수진 end -->
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/member.css" />
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/notice/notice.css" />
<style>
.noticeDetail_view p {
	height : 267px;
}
</style>
<div class="notice_page_content">
	<h3 class="notice_hd">공지사항</h3>
	<div class="notice_wrap">

		<%@ include file="/WEB-INF/views/common/noticePagebar.jsp"%>
		<div class="notice_cont">
			<!-- FAQ랑 같이 사용 -->
			 <div class="noticeDetail_head">
                <h4 class="notice__head"><%= posting.getTitle() %></h4>
            </div>

            <div class="noticeSecond_head">
                <span class="noticeDetail_date"><%= posting.getRegDate() %></span>
                <span class="noticeDetail_look">조회수&nbsp;<%= posting.getReadCount() %></span>
            </div>
            
<!-- 수진 start -->
<% 
	List<PostingAttach> attachments = posting.getAttachments();
	if(attachments != null && !attachments.isEmpty()) {
		for(PostingAttach attach : attachments) {
%>
            <div class="noticeDetail_view">
                <img src="<%= request.getContextPath() %>/upload/board/notice/<%= attach.getRenamedFilename() %>" alt="<%= attach.getOriginalFilename() %>" />
<% 
		}
		
%>
                <p class=""><%= posting.getContent() %></p>
            </div>
<% 			
	}
	else {
%>
			<div class="noticeDetail_view">
                <p><%= posting.getContent() %></p>
            </div>
<%
	}
%>
<!-- 수진 end -->
		<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { %>
            <button class="update_notice" onclick="location.href='<%= request.getContextPath() %>/board/noticeUpdate?no=<%= posting.getPostingNo() %>';">수정</button>
            <button class="delete_notice" onclick="deleteNoticeBoard();">삭제</button>
        <% } %>
			<button class="back_notice" onclick="location.href='<%= request.getContextPath() %>/board/notice?boardCode=<%= posting.getBoardCode() %>';">글 목록</button>
		</div>
	</div>
</div>

<!-- 수진 start -->
<form 
	name="noticeBoardDeleteFrm" 
	action="<%= request.getContextPath() %>/board/noticeDelete" 
	method="POST">
	<input type="hidden" name="no" value="<%= posting.getPostingNo() %>" />
	<input type="hidden" name="boardCode" value="<%= posting.getBoardCode() %>" />
</form>

<script>
/**
 * 게시물 삭제
 */
const deleteNoticeBoard = () => {
	const bool = confirm("게시물을 삭제하시겠습니까?");
	
	if(!bool) {
		alert('게시물 삭제를 취소합니다.');
		return;
	}
	else {
		document.noticeBoardDeleteFrm.submit();
	}
};
</script>
<!-- 수진 end -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

