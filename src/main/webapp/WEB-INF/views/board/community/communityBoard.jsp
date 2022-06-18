<%@ page import="board.model.dto.BoardCode" %>
<%@ page import="board.model.dto.PostingAttach" %>
<%@ page import="board.model.dto.PostingExt" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<PostingExt> cPostingList = (List<PostingExt>) request.getAttribute("cPostingList");
	List<PostingExt> pPostingList = (List<PostingExt>) request.getAttribute("pPostingList");
	
	final int READ_COUNT = 3;
%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />
<!-- 커뮤니티게시판 메인 -->
<div id="community-board-wrap">
	<!-- 샐브's 레시피 -->
	<div id="community-hacks-wrap">
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
	if(cPostingList != null && !cPostingList.isEmpty()) {
		for(int i = 0; i < READ_COUNT; i++) {
			List<PostingAttach> attachments = cPostingList.get(i).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(int j = 0; j < 1; j++) {
%>
				<tr class="hacks-img">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= cPostingList.get(i).getPostingNo() %>">
								<img src="<%= request.getContextPath() %>/upload/board/community/hacks/<%= attachments.get(j).getRenamedFilename() %>" alt="<%= attachments.get(j).getOriginalFilename() %>" />
							</a>
						</div>
					</td>
				</tr>
		<%
				}
			}
		%>
				<tr class="hacks-content-title">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= cPostingList.get(i).getPostingNo() %>"><%= cPostingList.get(i).getTitle() %></a>
						</div>
					</td>
				</tr>
				<tr class="hacks-content">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= cPostingList.get(i).getPostingNo() %>"><%= cPostingList.get(i).getContent() %></a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="comment-cnt">
							<i class="fa-regular fa-comment"></i><%= cPostingList.get(i).getCommentCount() %>
						</div>
					</td>
					<td>
						<div class="like-cnt">
							<%= cPostingList.get(i).getLikeCount() %><i class="fa-solid fa-heart"></i>
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
	<!-- 자유게시판 -->
	<div id="community-general-wrap">
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
		if(pPostingList != null && !pPostingList.isEmpty()) {
			for(int i = 0; i < READ_COUNT; i++) {
	%>
				<tr class="general-content-writer">
					<td colspan="2">
						<div>작성자&nbsp;<%= pPostingList.get(i).getMemberId() %></div>
					</td>
				</tr>
				<tr class="general-content-reg-date">
					<td colspan="2">
						<div>작성일&nbsp;<%= pPostingList.get(i).getRegDate() %></div>
					</td>
				</tr>
				<tr class="general-content-title">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/generalView?no=<%= pPostingList.get(i).getPostingNo() %>"><%= pPostingList.get(i).getTitle() %></a>					
						</div>
					</td>
				</tr>
				<tr class="general-content">
					<td colspan="2">
						<div>
							<a href="<%= request.getContextPath() %>/board/community/generalView?no=<%= pPostingList.get(i).getPostingNo() %>"><%= pPostingList.get(i).getContent() %></a>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="comment-cnt">
							<i class="fa-regular fa-comment"></i><%= pPostingList.get(i).getCommentCount() %>
						</div>
					</td>
					<td>
						<div class="like-cnt">
							<%= pPostingList.get(i).getLikeCount() %><i class="fa-solid fa-heart"></i>
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
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>