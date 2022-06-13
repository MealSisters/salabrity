<%@ page import="member.model.dto.MemberRole"%>
<%@ page import="board.model.dto.PostingExt"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<PostingExt> postingList = (List<PostingExt>) request.getAttribute("postingList");
	String pagebar = (String) request.getAttribute("pagebar");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />

<div id="community-board-list-wrap">
	<div>
		<div class="main-title">Community</div>
		<div class="main-sub-title">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</div>
	</div>
	<input type="button" value="샐브's 레시피" id="hacks-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacks';" />
	<input type="button" value="자유게시판" id="general-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/general';" />
	<br /><hr />
<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { %>
	<input type="button" value="글쓰기" id="board-post-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacksEnroll';" />	
<% } %>
	<div class="board-search-wrap">
		<input type="text" class="board-search-text" placeholder="검색어 입력" />
		<a class="board-search-btn" href="#">
			<i class="fa-solid fa-magnifying-glass"></i>
		</a>
	</div>
	<table class="tbl-community-list">
		<thead>
			<tr>
				<th>NO.</th>
				<th>제목</th>
				<th>작성자</th>
				<th>댓글수</th>
				<th>좋아요수</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
	<%
		if(postingList != null && !postingList.isEmpty()) {
			for(PostingExt posting : postingList) {
	%>
			<tr>
				<td><%= posting.getPostingNo() %></td>
				<td>
					<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= posting.getPostingNo() %>"><%= posting.getTitle() %></a>
				</td>
				<td><%= posting.getMemberId() %></td>
				<td><%= posting.getCommentCount() %></td>
				<td><%= posting.getLikeCount() %></td>
				<td><%= posting.getReadCount() %></td>
				<td><%= posting.getRegDate() %></td>
	<%		
		 	}
		}
		else {
	%>
			<tr>
				<td colspan="10">조회된 게시글이 없습니다.</td>
			</tr>
	<% 
		}
	%>
		</tbody>
	</table>
	<%-- 은지님 page-bar 코드 --%>
	<div class="page-bar">
        <%= pagebar %>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>