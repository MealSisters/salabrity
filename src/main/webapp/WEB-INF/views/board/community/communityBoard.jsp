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
		<div class="community-hacks-layout">
			<div class="main-title">Community</div>
			<div class="main-sub-title">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</div>
			<div class="hacks-title">
				<a href="<%= request.getContextPath() %>/board/community/hacks?boardCode=<%= BoardCode.C1 %>">
					<i class="fa-solid fa-caret-right"></i>&nbsp;샐브's 레시피
				</a>
			</div>
			<div class="community-hacks-contents-wrap">
<%
	if(cPostingList != null && !cPostingList.isEmpty()) {
		for(int i = 0; i < READ_COUNT; i++) {
%>
				<div class="hacks-content-wrap">
<%
			List<PostingAttach> attachments = cPostingList.get(i).getAttachments();
			if(attachments != null && !attachments.isEmpty()) {
				for(int j = 0; j < 1; j++) {
%>
					<div class="hacks-img">
						<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= cPostingList.get(i).getPostingNo() %>">
							<img style="width: 300px; height: 300px;" src="<%= request.getContextPath() %>/upload/board/community/hacks/<%= attachments.get(j).getRenamedFilename() %>" alt="<%= attachments.get(j).getOriginalFilename() %>" />
						</a>
					</div>
		<%
				}
			}
		%>
					<div class="hacks-content-title">
						<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= cPostingList.get(i).getPostingNo() %>"><%= cPostingList.get(i).getTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></a>
					</div>
					<div class="hacks-content">
						<a href="<%= request.getContextPath() %>/board/community/hacksView?no=<%= cPostingList.get(i).getPostingNo() %>"><%= cPostingList.get(i).getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></a>
					</div>
					<div>
						<span class="comment-cnt">
							<i class="fa-regular fa-comment"></i><%= cPostingList.get(i).getCommentCount() %>
						</span>
						<span class="like-cnt">
							<%= cPostingList.get(i).getLikeCount() %><i class="fa-solid fa-heart"></i>
						</span>
					</div>
				</div>
	<%		
		 	}
		}
	%>
			</div>
			<div class="hacks-btn">
				<a href="<%= request.getContextPath() %>/board/community/hacks?boardCode=<%= BoardCode.C1 %>">
					샐브's 레시피 더보기　<i class="fa-solid fa-rectangle-list"></i>
				</a>
			</div>
		</div>
	</div>
	<!-- 자유게시판 -->
	<div id="community-general-wrap">
		<div class="community-general-layout">
			<div class="general-title">
				<a href="<%= request.getContextPath() %>/board/community/general?boardCode=<%= BoardCode.C2 %>">
					<i class="fa-solid fa-caret-right"></i>&nbsp;자유게시판
				</a>
			</div>
			<div class="community-general-contents-wrap">
	<%
		if(pPostingList != null && !pPostingList.isEmpty()) {
			for(int i = 0; i < READ_COUNT; i++) {
	%>
				<div class="general-content-wrap">
					<div class="general-content-writer">작성자&nbsp;<%= pPostingList.get(i).getMemberId() %></div>
					<div class="general-content-reg-date">작성일&nbsp;<%= pPostingList.get(i).getRegDate() %></div>
					<div class="general-content-title">
						<a href="<%= request.getContextPath() %>/board/community/generalView?no=<%= pPostingList.get(i).getPostingNo() %>"><%= pPostingList.get(i).getTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></a>					
					</div>
					<div class="general-content">
						<a href="<%= request.getContextPath() %>/board/community/generalView?no=<%= pPostingList.get(i).getPostingNo() %>"><%= pPostingList.get(i).getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %></a>
					</div>
					<div>
						<span class="comment-cnt">
							<i class="fa-regular fa-comment"></i><%= pPostingList.get(i).getCommentCount() %>
						</span>
						<span class="like-cnt">
							<%= pPostingList.get(i).getLikeCount() %><i class="fa-solid fa-heart"></i>
						</span>
					</div>
				</div>
	<%
			}
		}
	%>
			</div>
			<div class="general-btn">
				<a href="<%= request.getContextPath() %>/board/community/general?boardCode=<%= BoardCode.C2 %>">
					자유게시판 더보기　<i class="fa-solid fa-rectangle-list"></i>
				</a>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>