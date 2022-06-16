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
	String type = request.getParameter("searchType");
	String word = request.getParameter("searchKeyword");
%>
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
								<a href="<%= request.getContextPath() %>/mypage/boardWriteList?no=<%= p.getPostingNo() %>"><%= p.getTitle() %></a>
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
					
						<select id="searchType">
							<option value="boardTitle">제목</option>
						</select>
						<div id="search_boardTitle">
							<form action="">
								<input type="hidden" name="searchType" value="boardTitle">
								<input type="text" name="searchKeyword" id="searchKeyword" placeholder="검색할 제목 입력"/>
								<button type="submit" class="btn_write_search">검색</button>
							</form>
						</div>
<%@ include file="/WEB-INF/views/common/pagebar.jsp" %>
					</div>

			</div>

	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>