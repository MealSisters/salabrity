<%@ page import="board.model.dto.BoardCode" %>
<%@ page import="board.model.dto.PostingLike" %>
<%@ page import="board.model.dto.PostingAttach" %>
<%@ page import="member.model.dto.MemberRole" %>
<%@ page import="board.model.dto.PostingComment" %>
<%@ page import="java.util.List" %>
<%@ page import="board.model.dto.PostingExt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	PostingExt posting = (PostingExt) request.getAttribute("posting");
	
	List<PostingComment> comments = posting.getComments();
	
	boolean canLike = loginMember != null
			&& !(loginMember.getMemberId().equals(posting.getMemberId())
					|| loginMember.getMemberRole() == MemberRole.A);
	
	boolean canEdit = loginMember != null
			&& (loginMember.getMemberId().equals(posting.getMemberId())
					|| loginMember.getMemberRole() == MemberRole.A);
	
	PostingLike like = (PostingLike) request.getAttribute("like");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />

<div id="community-board-view-wrap">
	<div>
		<div class="main-title">Community</div>
		<div class="main-sub-title">샐뮤니티에서 자유롭게 꿀팁을 나누세요.</div>
	</div>
	<a class="community-hacks-link" href="<%= request.getContextPath() %>/board/community/hacks?boardCode=<%= BoardCode.C1 %>">
		<button type="button" class="community-btn" id="hacks-btn">샐브's 레시피</button>
	</a>
	<a class="community-general-link" href="<%= request.getContextPath() %>/board/community/general?boardCode=<%= BoardCode.C2 %>">
		<button type="button" class="community-btn" id="general-btn">자유게시판</button>
	</a>
	<br /><hr />
	<table class="tbl-posting-view">
		<thead>
			<tr>
				<th class="posting-view-writer"><i class="fa-solid fa-circle-user"></i>&nbsp;<%= posting.getMemberId() %></th>
				<th class="posting-view-reg-date"><%= posting.getRegDate() %></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th class="posting-view-title" colspan="2"><%= posting.getTitle() %></th>
			</tr>
			<tr>
				<td class="posting-view-board-name" colspan="2">
					<a href="<%= request.getContextPath() %>/board/community/hacks?boardCode=<%= BoardCode.C1 %>">in 샐브's 레시피</a>
				</td>
			</tr>
	<% 
		List<PostingAttach> attachments = posting.getAttachments();
		if(attachments != null && !attachments.isEmpty()) {
			for(PostingAttach attach : attachments) {
	%>
			<tr>
				<td class="posting-view-content" colspan="2">
					<div>
						<img src="<%= request.getContextPath() %>/upload/board/community/hacks/<%= attach.getRenamedFilename() %>" alt="<%= attach.getOriginalFilename() %>" />
					</div>
	<% 
			}
			
	%>
					<div>
						<%= posting.getContent() %>
					</div>
				</td>
			</tr>
	<% 			
		}
		else {
	%>
			<tr>
				<td class="posting-view-content" colspan="2">
					<div>
						<%= posting.getContent() %>
					</div>
				</td>
			</tr>
	<%
		}
	%>
			<tr>
				<td class="posting-view-content" colspan="2">
				</td>
			</tr>
			<tr>
				<td class="posting-view-cnt" colspan="2">
					<span class="posting-view-comment-tap">
						<a href="#comment-tap">
							<i class="fa-regular fa-comment"></i>&nbsp;comment
						</a>
					</span>
					<span class="posting-view-like-cnt">
						<i class="fa-solid fa-heart"></i>&nbsp;<%= posting.getLikeCount() %>
					</span>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="board-button-wrap">
<% if(canLike) { %>
		<form 
			name="hacksLikeUpFrm"
			action="<%= request.getContextPath() %>/board/community/hacksLike" 
			method="POST" >
			<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>" />
			<input type="hidden" name="postingNo" value="<%= posting.getPostingNo() %>" />
			<input type="hidden" name="boardCode" value="<%= posting.getBoardCode() %>" />
			<%-- 좋아요 버튼은 본인/관리자 열람불가 --%>
			<button type="submit" id="board-like-btn">
	<% 
		List<PostingLike> likes = posting.getLikes();
		for(int i = 0; i < likes.size(); i++) {
			PostingLike pl = likes.get(i);
			if(pl.getStatus().equals("Y")) {
	%>
				love it&nbsp;<i class="fa-solid fa-heart"></i>
		<% 
		    }
		    else {
		%>
				love it&nbsp;<i class="fa-regular fa-heart"></i>
	<%
			}
		}
	%>
			</button>
		</form>
<% 
   }

   if(canEdit) { 
%>
		<%-- 수정/삭제 버튼은 본인/관리자만 열람 가능 --%>
		<input type="button" value="수정" id="board-update-btn" onclick="location.href='<%= request.getContextPath() %>/board/community/hacksUpdate?no=<%= posting.getPostingNo() %>';" />
		<input type="submit" value="삭제" id="board-delete-btn" onclick="deleteHacksBoard();" />
		<form 
			name="hacksBoardDeleteFrm" 
			action="<%= request.getContextPath() %>/board/community/hacksDelete" 
			method="POST">
			<input type="hidden" name="no" value="<%= posting.getPostingNo() %>" />
			<input type="hidden" name="boardCode" value="<%= posting.getBoardCode() %>" />
		</form>
<% } %>
	</div>
	<div class="comment-enroll-wrap" id="comment-tap">
		<h4>comment</h4>
		<form
			name="commentEnrollFrm"
			action="<%= request.getContextPath() %>/board/community/hacksView/commentEnroll" 
			method="POST">
			<input type="hidden" name="postingNo" value="<%= posting.getPostingNo() %>" />
			<input type="hidden" name="boardCode" value="<%= posting.getBoardCode() %>" />
			<input type="hidden" name="memberId" value="<%= loginMember != null ? loginMember.getMemberId() : "" %>" />
			<input type="hidden" name="commentLevel" value="1" />
			<input type="hidden" name="commentRef" value="0" />
			<textarea name="commentContent" cols="60" rows="3" placeholder="권리침해, 욕설 및 특정 대상을 비하하는 내용을 게시할 경우 이용약관 및 관련 법률에 의해 제재될 수 있습니다."></textarea>
			<button type="submit" class="comment-enroll-btn">등록</button>
		</form>
	</div>
<% if(comments != null && !comments.isEmpty()) { %>
	<table class="tbl-posting-comment-view">
<%
	for(PostingComment pc : comments) {
		
		boolean canDelete = loginMember != null 
				&& (loginMember.getMemberId().equals(pc.getMemberId()) 
						|| loginMember.getMemberRole() == MemberRole.A);
		
		if(pc.getCommentLevel() == 1) {
%>
		<tr class="level1">
        	<td>
        		<sub class="comment-writer"><%= pc.getMemberId() != null ? pc.getMemberId() : "(탈퇴회원)" %></sub>
        		<sub class="comment-date"><%= pc.getRegDate() %></sub>
        		<br />
	        	<span><%= pc.getCommentContent() %></span>
        	</td>
        	<td>
        		<button id="comment-reply-btn" value="<%= pc.getCommentNo() %>">답글</button>
        	<% if(canDelete) { %>
        		<button id="comment-delete-btn" value="<%= pc.getCommentNo() %>">삭제</button>
        	<% } %>
        	</td>
        </tr>
<%
		} else {
%>
        <tr class="level2">
        	<td>
        		<i class="fa-brands fa-replyd"></i>
        		<sub class="comment-writer"><%= pc.getMemberId() != null ? pc.getMemberId() : "(탈퇴회원)" %></sub>
        		<sub class="comment-date"><%= pc.getRegDate() %></sub>
        		<br />
        		<span>&nbsp;&nbsp;<%= pc.getCommentContent() %></span>
        	</td>
        	<td>
        	<% if(canDelete) { %>
        		<button id="comment-delete-btn" value="<%= pc.getCommentNo() %>">삭제</button>
        	<% } %>
        	</td>
        </tr>
<%
		}
	}
%>
	</table>
<% } %>
</div>
<form
	name="commentDeleteFrm"
	action="<%= request.getContextPath() %>/board/community/hacksView/commentDelete" 
	method="POST">
	<input type="hidden" name="commentNo" />
	<input type="hidden" name="postingNo" value="<%= posting.getPostingNo() %>" />
	<input type="hidden" name="boardCode" value="<%= posting.getBoardCode() %>" />
</form>
<script>
/**
 * 게시물 삭제
 */
const deleteHacksBoard = () => {
	const bool = confirm("게시물을 삭제하시겠습니까?");
	
	if(!bool) {
		alert('게시물 삭제를 취소합니다.');
		return;
	}
	else {
		document.hacksBoardDeleteFrm.submit();
	}
};

/**
 * 현재페이지 접속시 css 적용
 */
function communityMenuActive() {
    if($('a').hasClass('community-hacks-link')) {
        $('#hacks-btn').addClass('active');
        $('#general-btn').removeClass('active');
    }
}

/**
 * communityMenuActive() 호출
 */
$(document).ready(function() {
	communityMenuActive();
});

/**
 * 댓글 삭제
 */
document.querySelectorAll("#comment-delete-btn").forEach((button) => {
	button.onclick = (e) => {
		const bool = confirm("댓글을 삭제하시겠습니까?");
		
		if(!bool) {
			alert("댓글 삭제를 취소합니다.");
			return;
		}
		else {
			const targetVal = e.target.value;
			const commentNo = document.querySelector("input[name=commentNo]");
			commentNo.value = targetVal;
			document.commentDeleteFrm.submit();
		}
	};
});

/**
 * 답글폼 동적 생성
 */
document.querySelectorAll("#comment-reply-btn").forEach((button) => {
		button.onclick = (e) => {
		if(<%= loginMember == null %>) {
			loginAlert();
			return;
		}
		
		const {value : commentRef} = e.target;
		console.log(commentRef);
		
		const tr = document.createElement("tr");
        const td = document.createElement("td");
        td.colSpan = "2";
        td.className = "comment-reply-wrap";
        
        const frm = document.createElement("form");
        frm.name = "commentEnrollFrm";
        frm.action = "<%= request.getContextPath() %>/board/community/hacksView/commentEnroll";
        frm.method = "POST";
        frm.onsubmit = commentSubmitHandler;

        const inputpostingNo = document.createElement("input");
        inputpostingNo.type = "hidden";
        inputpostingNo.name = "postingNo";        
        inputpostingNo.value = "<%= posting.getPostingNo() %>";
        
        const inputBoardCode = document.createElement("input");
        inputBoardCode.type = "hidden";
        inputBoardCode.name = "boardCode";        
        inputBoardCode.value = "<%= posting.getBoardCode() %>"
        
        const inputMemberId = document.createElement("input");
        inputMemberId.type = "hidden";
        inputMemberId.name = "memberId";
        inputMemberId.value = "<%= loginMember != null ? loginMember.getMemberId() : "" %>";
        
        const inputCommentLevel = document.createElement("input");
        inputCommentLevel.type = "hidden";
        inputCommentLevel.name = "commentLevel";
        inputCommentLevel.value = "2";
		
        const inputCommentRef = document.createElement("input");
        inputCommentRef.type = "hidden";
        inputCommentRef.name = "commentRef";
        inputCommentRef.value = commentRef;
        
        const textarea = document.createElement("textarea");
        textarea.name = "commentContent";
        textarea.cols = "60";
        textarea.rows = "3";
        textarea.placeholder = "권리침해, 욕설 및 특정 대상을 비하하는 내용을 게시할 경우 이용약관 및 관련 법률에 의해 제재될 수 있습니다.";
        
        const button = document.createElement("button");
        button.className = "comment-reply-btn";
        button.innerText = "등록";
        
        frm.append(inputpostingNo);
        frm.append(inputBoardCode);
        frm.append(inputMemberId);
        frm.append(inputCommentLevel);
        frm.append(inputCommentRef);
        frm.append(textarea);
        frm.append(button);
        td.append(frm);
        tr.append(td);
        
        const parent = e.target.parentElement.parentElement.parentElement;
        const ref = e.target.parentElement.parentElement.nextElementSibling;		
		const target = e.target.parentElement.parentElement;
		target.insertAdjacentElement('afterend', tr);
		
		e.target.onclick = null;
	};
});

/**
 * 댓글창 포커스시 비로그인일 경우 사용 제한 경고창 발생
 */
document.querySelector("textarea[name=commentContent]").onfocus = (e) => {
	if(<%= loginMember == null %>) loginAlert();
};

/**
 * 댓글 제출 폼
 */
const commentSubmitHandler = (e) => {
	if(<%= loginMember == null %>) {
		loginAlert();
		return false;		
	}
	
	/**
	 * 댓글 내용이 공백일 경우 대비
	 */
	const commentContentVal = e.target.commentContent.value.trim();
	if(!/^(.|\n)+$/.test(commentContentVal)) {
		alert("댓글 내용을 작성해주세요.");
		e.target.commentContent.focus();
		return false;
	}
};

document.commentEnrollFrm.onsubmit = commentSubmitHandler;

/**
 * 비로그인일 경우 사용 제한 경고창 발생
 */
const loginAlert = () => {
	alert("로그인 후 이용할 수 있습니다.");
	window.location.href = "<%= request.getContextPath() %>/member/login";
};

/**
 * 좋아요 기능
 */
window.onload = () => {
	const likeUp = () => {
		document.generalLikeUpFrm.submit();
	};
};
/* window.onload = () => {
	document.querySelector("#board-like-btn").addEventListener('click', () => {
		document.generalLikeUpFrm.submit();
	});
}; */
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>