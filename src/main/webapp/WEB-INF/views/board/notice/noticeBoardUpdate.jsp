<%@ page import="board.model.dto.PostingAttach" %>
<%@ page import="java.util.List" %>
<%@ page import="board.model.dto.PostingExt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	PostingExt posting = (PostingExt) request.getAttribute("posting");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/notice/noticeBoard.css" />

<div id="notice-board-update-wrap">
	<span class="main-title">공지사항</span>
	<span class="main-sub-title">*표시가 된 곳은 필수 입력사항입니다.</span>
	<div>
		<form
			name="boardUpdateFrm" 
			action="<%= request.getContextPath() %>/board/noticeUpdate" 
			method="POST" 
			enctype="multipart/form-data">
			<table class="tbl-board-update">
				<tr>
					<th>분류<sup>*</sup></th>
					<td>
						<div>
							<select name="noticeBoardSelect" class="notice-board-select" required>
								<option value="">선택</option>
								<option value="general">일반</option>
								<option value="event">이벤트</option>
							<%-- <% if(noticeBoardSelect != null && noticeBoardSelect.equals("general")) { %>
								<option value="general" selected>일반</option>
							<%
							   }
							   else {
							%>
								<option value="general">일반</option>
							<% } %>
							
							<% if(noticeBoardSelect != null && noticeBoardSelect.equals("event")) { %>
								<option value="event" selected>이벤트</option>
							<%
							   }
							   else {
							%>
								<option value="event">이벤트</option>
							<% } %> --%>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<div>
							<input type="text" name="memberId" value="<%= posting.getMemberId() %>" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<th>제목<sup>*</sup></th>
					<td>
						<div>
							<input type="text" name="title" value="<%= posting.getTitle() %>" />
						</div>
					</td>
				</tr>
				<tr>
					<th>내용<sup>*</sup></th>
					<td>
						<div>
							<textarea rows="5" cols="40" name="content"><%= posting.getContent() %></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
			<% 
				List<PostingAttach> attachments = posting.getAttachments();
				if(attachments != null && !attachments.isEmpty()) {
					for(int i = 0; i < attachments.size(); i++) {
						PostingAttach attach = attachments.get(i);
			%>
						<div class="board-attach-wrap">
							<div class="existing-attach-wrap">								
								<div class="existing-attach-img">
									<img src="<%= request.getContextPath() %>/upload/board/notice/<%= attach.getRenamedFilename() %>" alt="<%= attach.getOriginalFilename() %>" />
								</div>
								<span class="existing-attach-name"><%= attach.getOriginalFilename() %></span>
								<input type="checkbox" name="delFile" id="delFile<%= i + 1 %>" value="<%= attach.getPostingAttachNo() %>" />
								<label for="delFile<%= i + 1 %>">
									<sup>
										<svg width="30" height="15" xmlns="http://w3.org/2000/svg" version="1.1" viewbox="0 0 80 40">
								            <polyline class="st1" points="9.06 20.89 25.85 35.74 50.46 9.35"/>
								        </svg>									
								        <span>클릭시 삭제됩니다.</span>
									</sup>
								</label>
							</div>
						</div>
			<% 
					}
				}
			%>	
						<div class="board-attach-wrap" id="board-attach1-wrap">
				            <p class="attach-name"></p>
				            <input type="file" name="attach1" id="attach1" />
				            <div class="attach-btn-wrap">
				                <button type="button">파일찾기</button>
				            </div>
				        </div>
						<div class="board-attach-wrap" id="board-attach2-wrap">
				            <p class="attach-name"></p>
				            <input type="file" name="attach2" id="attach2" />
				            <div class="attach-btn-wrap">
				                <button type="button">파일찾기</button>
				            </div>
				        </div>
						<div class="board-attach-wrap" id="board-attach3-wrap">
				            <p class="attach-name"></p>
				            <input type="file" name="attach3" id="attach3" />
				            <div class="attach-btn-wrap">
				                <button type="button">파일찾기</button>
				            </div>
				        </div>
					</td>
				</tr>
			</table>
			<div class="board-button-wrap">
				<input type="submit" value="수정" id="board-update-btn" />
				<input type="hidden" name="no" value="<%= posting.getPostingNo() %>" />
				<input type="hidden" name="boardCode" value="<%= posting.getBoardCode() %>" />
				<input type="reset" value="취소" id="board-back-btn" onclick="history.go(-1);" />
			</div>
		</form>
	</div>
</div>
<script>
/**
 * 첨부파일 가져오기
 */
const getAttachs = () => {
    const attach1 = document.querySelector("#attach1");
    const attach1Name = document.querySelector("#board-attach1-wrap p.attach-name");
    const attach1Btn = document.querySelector("#board-attach1-wrap button");
    upFile(attach1, attach1Name, attach1Btn);
    
    const attach2 = document.querySelector("#attach2");
    const attach2Name = document.querySelector("#board-attach2-wrap p.attach-name");
    const attach2Btn = document.querySelector("#board-attach2-wrap button");
    upFile(attach2, attach2Name, attach2Btn);
    
    const attach3 = document.querySelector("#attach3");
    const attach3Name = document.querySelector("#board-attach3-wrap p.attach-name");
    const attach3Btn = document.querySelector("#board-attach3-wrap button");
    upFile(attach3, attach3Name, attach3Btn);
};

/**
 * 첨부파일명 변경
 */
const upFile = (attach, attachName, attachBtn) => {
	attach.addEventListener('change', (e) => {
		attachName.innerHTML = e.target.files[0].name;
    });
	attachBtn.addEventListener('click', () => {
		attach.click();
    });
};
</script>
<script src="<%= request.getContextPath() %>/js/validation.js"></script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>