<%@ page import="member.model.dto.MemberRole" %>
<%@ page import="board.model.dto.PostingExt" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<PostingExt> postingList = (List<PostingExt>) request.getAttribute("postingList");
	
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");

	String pagebar = (String) request.getAttribute("pagebar");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />

<div id="community-board-list-wrap">
	<div>
		<div class="main-title">Community</div>
		<div class="main-sub-title">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</div>
	</div>
	<a class="community-hacks-link" href="<%= request.getContextPath() %>/board/community/hacks">
		<button type="button" class="community-btn" id="hacks-btn">샐브's 레시피</button>
	</a>
	<a class="community-general-link" href="<%= request.getContextPath() %>/board/community/general">
		<button type="button" class="community-btn" id="general-btn">자유게시판</button>
	</a>
	<%-- <input type="button" value="샐브's 레시피" id="hacks-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacks';" />
	<input type="button" value="자유게시판" id="general-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/general';" /> --%>
	<br /><hr />
<% if(loginMember != null && loginMember.getMemberRole() == MemberRole.A) { %>
	<input type="button" value="글쓰기" id="board-post-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacksEnroll';" />	
<% } %>
	<div class="board-search-wrap">
		<form action="<%=request.getContextPath()%>/board/community/hacksSearch">
			<select name="searchType">
		<% if(searchType != null && searchType.equals("title")) { %>
				<option value="title" selected>제목</option>
		<%
		   }
		   else {
		%>
				<option value="title">제목</option>
		<% } %>
		
		<% if(searchType != null && searchType.equals("content")) { %>
				<option value="content" selected>내용</option>
		<% }
		   else {
		%>
				<option value="content">내용</option>
		<% } %>
		
		<% if(searchType != null && searchType.equals("member_id")) { %>
				<option value="member_id" selected>작성자</option>
		<% }
		   else { 
		%>
				<option value="member_id">작성자</option>
		<% } %>
			</select>
			
			<input type="hidden" name="searchType" value="title"/>
			<input type="hidden" name="searchType" value="content"/>
			<input type="hidden" name="searchType" value="member_id"/>
			
		<% if(searchKeyword == null) { %>
			<input type="text" class="board-search-text" name="searchKeyword" placeholder="검색어 입력" required>
		<% } 
		   else { 
		%>
			<input type="text" class="board-search-text" name="searchKeyword" placeholder="검색어 입력" required value="<%= searchKeyword %>">
		<% } %>
			<button type="submit" class="board-search-btn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
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
		if(postingList != null && !postingList.isEmpty() && searchKeyword != "") {
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
<script>
/* $(function() {
	$('.community-btn').click(function() {
		
		$('.community-link').addClass('')
			$(this).removeClass()
	})
});

function communityMenuActive(){
    if($('a').hasClass('#community-hacks-link')) {
        $(‘해당 메뉴#1 css 위치').addClass(‘메뉴에 색을 변화시킬 css 클래스');
    }
    else if($('a').hasClass("community-general-link")) {
        $(‘해당 메뉴#2 css 위치').addClass('메뉴에 색을 변화시킬 css 클래스');
    }
}

function communityMenuActive() {
    if($('a').hasClass('#community-hacks-link')) {
        $('#hacks-btn').addClass('active');
        $('#general-btn').removeClass('active');
    }
    else if($('a').hasClass('community-general-link')) {
        $('#general-btn').addClass('active');
        $('#hacks-btn').removeClass('active');
    }
}

// 함수 호출
$(document).ready(function() {
	communityMenuActive();
}); */
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>