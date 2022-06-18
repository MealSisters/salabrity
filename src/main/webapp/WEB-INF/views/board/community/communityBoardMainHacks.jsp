<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form 
	action="<%= request.getContextPath() %>/board/community/mainHacks" 
	method="GET">
	<div id="community-hacks-wrap">
		<input type="hidden" name="boardCode" value="C1" />
		<input type="hidden" name="orderBy" value="reg_date" />
		<table class="tbl-community-hacks">
			<thead>
				<tr>
					<th class="main-title" colspan="6">Community</th>
				</tr>
				<tr>
					<td class="main-sub-title" colspan="6">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</td>
				</tr>
				<tr class="hacks-title">
					<th colspan="6">
						<a href="<%= request.getContextPath() %>/board/community/hacks?boardCode=<%= BoardCode.C1 %>">
							<i class="fa-solid fa-caret-right"></i>샐브's 레시피
						</a>
					</th>
				</tr>
			</thead>
			<tbody>
	<%
		if(postingList != null && !postingList.isEmpty()) {
			for(int i = 0; i < 3; i++) {
	%>
				<tr class="hacks-img">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= postingList.get(i).getPostingNo() %>">
							<input type="hidden" name="no" value="<%= postingList.get(i).getPostingNo() %>" />
					<% 
						List<PostingAttach> attachments = postingList.get(i).getAttachments();
						if(attachments != null && !attachments.isEmpty()) {
							for(int j = 0; j < 1; j++) {
					%>
								<img src="<%= request.getContextPath() %>/upload/board/community/hacks/<%= attachments.get(j).getRenamedFilename() %>" alt="<%= attachments.get(j).getOriginalFilename() %>" />
					<%
							}
						}
					%>
							</a>
						</div>
					</td>
				</tr>
				<tr class="hacks-content-title">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= postingList.get(i).getPostingNo() %>"><%= postingList.get(i).getTitle() %></a>
						</div>
					</td>
				</tr>
				<tr class="hacks-content">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= postingList.get(i).getPostingNo() %>"><%= postingList.get(i).getContent() %></a>
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
						<div class="hacks-btn">
							<a href="<%= request.getContextPath() %>/board/community/hacks?boardCode=<%= BoardCode.C1 %>">
								샐브's 레시피 더보기　<i class="fa-solid fa-rectangle-list"></i>
							</a>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</form>
