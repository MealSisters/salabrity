<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<form
	action="<%= request.getContextPath() %>/board/community/mainGeneral"
	method="GET">
	<div id="community-general-wrap">
		<input type="hidden" name="boardCode" value="C2" />
		<input type="hidden" name="orderBy" value="read_count" />
		<table class="tbl-community-general">
			<thead>
				<tr class="general-title">
					<th colspan="6">
						<a href="<%= request.getContextPath() %>/board/community/general?boardCode=<%= BoardCode.C2 %>">
							<i class="fa-solid fa-caret-right"></i>자유게시판
						</a>
					</th>
				</tr>
			</thead>
			<tbody>
	<%
		if(postingList != null && !postingList.isEmpty()) {
			for(int i = 0; i < 3; i++) {
	%>
				<tr class="general-content-writer">
					<td colspan="2">
						<div>작성자&nbsp;<%= postingList.get(i).getMemberId() %></div>
					</td>
				</tr>
				<tr class="general-content-reg-date">
					<td colspan="2">
						<div>작성일&nbsp;<%= postingList.get(i).getRegDate() %></div>
					</td>
				</tr>
				<tr class="general-content-title">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/generalView?no=<%= postingList.get(i).getPostingNo() %>"><%= postingList.get(i).getTitle() %></a>					
						</div>
					</td>
				</tr>
				<tr class="general-content">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/generalView?no=<%= postingList.get(i).getPostingNo() %>"><%= postingList.get(i).getContent() %></a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="comment-cnt">
							<i class="fa-regular fa-comment"></i><%= postingList.get(i).getCommentCount() %>
						</div>
					</td>
					<td>
						<div class="like-cnt">
							<%= postingList.get(i).getLikeCount() %><i class="fa-solid fa-heart"></i>
						</div>
					</td>
				</tr>
	<%
			}
		}
	%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<div class="general-btn">
							<a href="<%= request.getContextPath() %>/board/community/general?boardCode=<%= BoardCode.C2 %>">
								자유게시판 더보기　<i class="fa-solid fa-rectangle-list"></i>
							</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</form>