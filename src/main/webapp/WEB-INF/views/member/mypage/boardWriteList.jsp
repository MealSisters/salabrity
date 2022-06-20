<%@page import="board.model.dto.Posting"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/board.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />
<%
	List<Posting> list = (List<Posting>) request.getAttribute("list");
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
	int cPage = (int)request.getAttribute("cPage");
	
%>
<style>
.page-bar a {
	text-decoration: none;
    color: #000;
    margin-left: 8px;
}
.mypage_hd {
	border-bottom: 0px solid !important;
	}
</style>
<div class="my_page_content">
	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>

	<div class="my_sub_content">
		<h4 class="mypage_hd">내가 작성한 게시글</h4>
		
			<div class="board_write_list">
					<table class="write_list">
						<thead>
							<tr>
								<th>No.</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						<% if (list == null || list.isEmpty()) { %>
							<tr><td colspan="5">조회된 게시글이 없습니다.</td></tr>
							<tr>
							<% } else { 
								for(Posting p : list) {
							%>
								<td><%= p.getPostingNo() %></td>
								
								<td>
								<a href="<%= request.getContextPath() %>/board/community/generalView?no=<%= p.getPostingNo() %>"><%= p.getTitle() %></a>
								</td>
								
								<td><%= p.getRegDate() %></td>
								<td><%= p.getReadCount() %></td>
							</tr>
							<% } 
							}
							%>
						</tbody>
					</table>
				</div>
				<div id="search_container">
					<input type="hidden" name="memberId" />
						<select id="searchType">
							<option value="title" <%= "title".equals(searchType)?"selected":"" %>>제목</option> <!-- boardTitle -->
						
						</select>
						<div id="search_boardTitle">
							<form action="<%= request.getContextPath() %>/mypage/finder">
								<input type="hidden" name="searchType" value="title">
								<input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색할 제목 입력" value="<%= "title".equals(searchType) ? searchKeyword : "" %>"/>
								<button type="submit" class="btn_write_search">검색</button>
							</form>
						</div>
<%= request.getAttribute("pageBar") != null ? request.getAttribute("pageBar") : ""%>
					</div>

			</div>

	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>