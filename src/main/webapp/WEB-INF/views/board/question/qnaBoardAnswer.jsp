<%@ page import="board.model.dto.PostingExt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	PostingExt posting = (PostingExt) request.getAttribute("posting");
%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/question/questionBoard.css" />

<div id="question-board-reply-enroll-wrap">
	<span class="main-title">1:1문의 답변</span>
	<span class="main-sub-title">*표시가 된 곳은 필수 입력사항입니다.</span>
	<div>
		<table class="tbl-member-question">
			<tr>
				<th>작성자</th>
				<td>
					<div>
						<input type="text" name="qMemberId" value="<%= posting.getMemberId() %>" readonly/>
					</div>
				</td>
			</tr>
			<tr>
				<th>문의일자</th>
				<td>
					<div>
						<input type="email" name="qRegDate" value="<%= posting.getRegDate() %>" readonly />
					</div>
				</td>
			</tr>
			<tr>
				<th>문의제목</th>
				<td>
					<div>
						<input type="text" name="qTitle" value="<%= posting.getTitle() %>" readonly />
					</div>
				</td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td>
					<div>
						<textarea rows="5" cols="40" name="qContent" readonly><%= posting.getContent() %></textarea>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<form
			name="boardEnrollFrm" 
			action="<%= request.getContextPath() %>/admin/QnAList/answer" 
			method="POST" 
			enctype="multipart/form-data">
			<table class="tbl-admin-reply">
				<tr>
					<th>답변제목<sup>*</sup></th>
					<td>
						<div>
							<input type="text" name="aTitle" placeholder="답변제목을 입력하세요." />
						</div>
					</td>
				</tr>
				<tr>
					<th>답변내용<sup>*</sup></th>
					<td>
						<div>
							<textarea rows="5" cols="40" name="aContent" placeholder="답변내용을 입력하세요."></textarea>
						</div>
					</td>
				</tr>
				<tr>
				<tr>
					<th>첨부파일</th>
					<td>					
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
				<input type="hidden" name="aMemberId" value="<%= loginMember.getMemberId() %>" />
				<input type="hidden" name="postingLevel" value="2" />
				<input type="hidden" name="postingRef" value="<%= posting.getPostingNo() %>" />
				<input type="submit" value="등록" id="board-enroll-btn" />
				<input type="button" value="취소" id="board-reset-btn" onclick="history.go(-1);" />
			</div>
		</form>
	</div>
</div>
<script>
window.addEventListener('load', () => {
	getAttachs();
});

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