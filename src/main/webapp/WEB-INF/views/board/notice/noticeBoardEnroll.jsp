<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/notice/noticeBoard.css" />

<div id="notice-board-enroll-wrap">
	<span class="main-title">공지사항</span>
	<span class="main-sub-title">*표시가 된 곳은 필수 입력사항입니다.</span>
	<div>
		<form
			name="generalBoardEnrollFrm" 
			action="<%= request.getContextPath() %>/board/notice/noticeEnroll" 
			method="POST" 
			enctype="multipart/form-data">
			<table class="tbl-board-enroll">
				<tr>
					<th>분류</th>
					<td>
						<div>
							<select name="notice-board-select" id="notice-board-select">
								<option value="" selected>--- 선택 ---</option>
								<option value="general"> 일반</option>
								<option value="event"> 이벤트</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<div>
							<input type="text" name="memberId" value="관리자" readonly/>
						</div>
					</td>
				</tr>
				<tr>
					<th>제목<sup>*</sup></th>
					<td>
						<div>
							<input type="text" name="title" placeholder="공지사항 게시글 제목" />
						</div>
					</td>
				</tr>
				<tr>
					<th>내용<sup>*</sup></th>
					<td>
						<div>
							<textarea rows="5" cols="40" name="content" placeholder="공지사항 게시글 상세"></textarea>
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
 * generalBoardEnrollFrm 유효성 검사
 */
window.addEventListener('load', () => {
	document.generalBoardEnrollFrm.onsubmit = (e) => {
		const frm = e.target;
		
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