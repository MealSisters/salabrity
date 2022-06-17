<%@page import="board.model.dto.Posting"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/myPage.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member/board.css" />
<%
	List<Posting> list = (List<Posting>) request.getAttribute("list");
%>
<div class="my_page_content">

	<%@ include file="/WEB-INF/views/common/myPageSidebar.jsp"%>
	<div class="my_sub_content">
		
		<button type="button" class="btn_question" onclick="location.href='<%= request.getContextPath() %>/mypage/boardQuestion';">1:1 문의하기</button>
		<h4 class="mypage_hd">1:1 문의</h4>
		
			<div class="board_question_zone">


	<%-- data() 함수 사용 예정..... --%>
				<div class="date_view_box">
					<form>
						<span class="date_span">조회기간</span>
						<div class="date_check_box">
							<button type="button" data-value="0">오늘</button>
							<button type="button" data-value="7">7일</button>
							<button type="button" data-value="15">15일</button>
							<button type="button" data-value="30">1개월</button>
							<button type="button" data-value="90">3개월</button>
							<button type="button" data-value="365">1년</button>
						</div>

						<div class="date_check_calendar">
							<input type="text" name="regDate" id="" class="ck_calendar" value="2022-06-08"> <span>~</span> 
							<input type="text" name="regDate" id="" class="ck_calendar" value="2022-06-31">
							<button type="submit" class="btn_date_check">
								<span>조회</span>
							</button>
						</div>
					</form>
				</div>

				<div class="board_question_list">
				
					<table class="question_list">
						<thead>
							<tr>
								<th>문의날짜</th>
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
						<% if(list == null || list.isEmpty()) {%>
						<tr>
							<td colspan="4">작성한 게시글이 없습니다.</td>
						</tr>
						<% } else { 
							for(Posting p : list) {
						%>
						<tr>
								<td><%= p.getRegDate() %></td>

								<td>
								<a href="<%= request.getContextPath() %>/mypage/boardQuestionView?no=<%= p.getPostingNo() %>"><%= p.getTitle() %></a>
								</td>
								<td><%= loginMember.getMemberName() %></td>
							</tr>
							<% }
							
						} %>
						</tbody>
					</table>
				</div>

		</div>
	</div>



</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>