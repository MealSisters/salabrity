<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/question/questionBoard.css" />

<div id="faq-board-update-wrap">
	<span class="main-title">자주 묻는 질문</span>
	<span class="main-sub-title">*표시가 된 곳은 필수 입력사항입니다.</span>
	<div>
		<form
			name="faqBoardUpdateFrm" 
			action="<%= request.getContextPath() %>/board/faqUpdate" 
			method="POST" 
			enctype="multipart/form-data">
			<table class="tbl-board-update">
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
							<input type="text" name="title" value="Q. 정기구독 이용 중 수령일 / 주소지 변경이 가능한가요?" />
						</div>
					</td>
				</tr>
				<tr>
					<th>내용<sup>*</sup></th>
					<td>
						<div>
							<textarea rows="5" cols="40" name="content">정기 구독 이용 중에 주소지 변경이 가능한가요?</textarea>
						</div>
					</td>
				</tr>
			</table>
			<div class="board-button-wrap">
				<input type="submit" value="수정" id="board-update-btn" />
				<input type="reset" value="취소" id="board-reset-btn" />
			</div>
		</form>
	</div>
</div>
<script>
/**
 * faqBoardUpdateFrm 유효성 검사
 */
window.addEventListener('load', () => {
	document.faqBoardUpdateFrm.onsubmit = (e) => {
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
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>