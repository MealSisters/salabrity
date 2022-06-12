<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
						<input type="text" name="memberId" value="honggd" readonly/>
					</div>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<div>
						<input type="email" name="qEmail" value="honggd@naver.com" readonly />
					</div>
				</td>
			</tr>
			<tr>
				<th>문의제목</th>
				<td>
					<div>
						<input type="text" name="qTitle" value="관리자님, 문의드립니다." readonly />
					</div>
				</td>
			</tr>
			<tr>
				<th>문의내용</th>
				<td>
					<div>
						<textarea rows="5" cols="40" name="qContent" readonly>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae dolore vero dolores placeat optio eligendi magnam odit provident fuga eius fugiat nulla aut magni temporibus dicta sed ullam commodi corporis!</textarea>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<form
			name="questionBoardReplyEnrollFrm" 
			action="<%= request.getContextPath() %>/board/question/questionReply" 
			method="POST" 
			enctype="multipart/form-data">
			<table class="tbl-admin-reply">
				<tr>
					<th>답변제목<sup>*</sup></th>
					<td>
						<div>
							<input type="text" name="rTitle" placeholder="답변제목을 입력하세요." />
						</div>
					</td>
				</tr>
				<tr>
					<th>답변내용<sup>*</sup></th>
					<td>
						<div>
							<textarea rows="5" cols="40" name="rContent" placeholder="답변내용을 입력하세요."></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<div class="board-attach-wrap">
						    <input class="board-attach-name" value="첨부파일" placeholder="첨부파일" readonly />
						    <label for="upFile">파일찾기</label>
						    <input type="file" id="upFile" />
						</div>
					</td>
				</tr>
			</table>
			<div class="board-button-wrap">
				<input type="submit" value="등록" id="board-enroll-btn" />
				<input type="reset" value="취소" id="board-reset-btn" />
			</div>
		</form>
	</div>
</div>
<script>
/**
 * questionBoardReplyEnrollFrm 유효성 검사
 */
window.addEventListener('load', () => {
	document.questionBoardReplyEnrollFrm.onsubmit = (e) => {
		const frm = e.target;
		
		const passwordVal = frm.password.value.trim();
		if(!/^.{4,}$/.test(passwordVal)) {
			alert("4자리 이상의 비밀번호를 입력해주세요.");
			frm.password.select();
			return false;
		}
		
		const titleVal = frm.title.value.trim();
		if(!/^.+$/.test(titleVal)) {
			alert("제목을 입력해주세요.");
			frm.title.select();
			return false;
		}
		
		const contentVal = frm.content.value.trim();
		if(!/^(.|\n)+$/.test(contentVal)) {
			alert("내용을 입력해주세요.");
			frm.content.select();
			return false;
		}
		
		return true;
	}
});

/**
 * 첨부파일명 변경
 */
const upFile = document.querySelector("#upFile");
upFile.addEventListener('change', () => {
	const upFileName = upFile.files[0].name; // value=fakepath
	document.querySelector(".board-attach-name").value = upFileName;
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>