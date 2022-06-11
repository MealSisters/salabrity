<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/member/board.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />

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
							<tr>
								<td>1</td>
								<td>제목입니다요</td>
								<td>2022-06-09</td>
								<td>0</td>
							</tr>
							<tr>
								<td>1</td>
								<td>제목입니다요</td>
								<td>2022-06-09</td>
								<td>0</td>
							</tr>
							<tr>
								<td>1</td>
								<td>제목입니다요</td>
								<td>2022-06-09</td>
								<td>0</td>
							</tr>
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