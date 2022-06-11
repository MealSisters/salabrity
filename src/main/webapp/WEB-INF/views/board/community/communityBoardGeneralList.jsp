<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />

<div id="community-board-list-wrap">
	<div>
		<div class="main-title">Community</div>
		<div class="main-sub-title">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</div>
	</div>
	<input type="button" value="샐브's 레시피" id="hacks-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacks';" />
	<input type="button" value="자유게시판" id="general-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/general';" />
	<br /><hr />
<%-- <% if(loginMember != null) { %> --%>
	<input type="button" value="글쓰기" id="board-post-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/generalEnroll';" />	
<%-- <% } %> --%>
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
			<tr>
				<td>1</td>
				<td><a href="">test</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>2</td>
				<td><a href="">test2</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>3</td>
				<td><a href="">test3</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>4</td>
				<td><a href="">test4</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>5</td>
				<td><a href="">test5</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>6</td>
				<td><a href="">test6</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>7</td>
				<td><a href="">test7</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>8</td>
				<td><a href="">test8</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>9</td>
				<td><a href="">test9</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
			<tr>
				<td>10</td>
				<td><a href="">test10</a></td>
				<td>honggd</td>
				<td>3</td>
				<td>1</td>
				<td>123</td>
				<td>22-06-05</td>
			</tr>
		</tbody>
	</table>
	<%-- 은지님 page-bar 코드 --%>
	<div class="page-bar">
        <a href=""><i class="fa-solid fa-angles-left"></i></a>
        <a href=""><i class="fa-solid fa-angle-left"></i></a>
        <a href="" class="cPage">1</a>
        <a href="">2</a>
        <a href="">3</a>
        <a href="">4</a>
        <a href="">5</a>
        <a href=""><i class="fa-solid fa-angle-right"></i></a>
        <a href=""><i class="fa-solid fa-angles-right"></i></a>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>