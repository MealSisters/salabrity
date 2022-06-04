<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />

<div id="community-board-list-wrap">
	<div>
		<div class="main-title">Community</div>
		<div class="main-sub-title">게시판 소개</div>
	</div>
	<input type="button" value="게시판1" id="hacks-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacks';" />
	<input type="button" value="게시판2" id="general-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/general';" />
	<br /><hr />
<%-- <% if(loginMember != null) { %> --%>
	<div>
		<input type="search" placeholder="검색어 입력" />
		<button><i class="fa-solid fa-magnifying-glass"></i></button>
		<input type="button" value="글쓰기" id="board-post-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacks/enroll';" />	
	</div>
<%-- <% } %> --%>
	<table id="tbl-community-list">
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
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>

	<div id="pageBar"></div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>