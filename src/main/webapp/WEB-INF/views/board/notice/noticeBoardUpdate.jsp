<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/community/communityBoard.css" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/board/notice/noticeBoard.css" />

<div id="notice-board-update-wrap">
	<span class="main-title">공지사항</span>
	<span class="main-sub-title">*표시가 된 곳은 필수 입력사항입니다.</span>
	<div>
		<form
			name="noticeBoardUpdateFrm" 
			action="<%= request.getContextPath() %>/board/notice/noticeUpdate" 
			method="POST" 
			enctype="multipart/form-data">
			<table class="tbl-board-update">
				<tr>
					<th>분류<sup>*</sup></th>
					<td>
						<div>
							<select name="notice-board-select" class="notice-board-select" required>
								<option value="" <%-- selected --%>>선택</option>
								<option value="general">일반</option>
								<option value="event" selected>이벤트</option>
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
							<input type="text" name="title" value="[6월의 샐브이벤트]당첨회원 발표" />
						</div>
					</td>
				</tr>
				<tr>
					<th>내용<sup>*</sup></th>
					<td>
						<div>
							<textarea rows="5" cols="40" name="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique iusto amet ea ut facilis natus dolore laudantium optio recusandae ab et fuga voluptates facere molestiae cumque dolorum esse. Ad quia.</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<div class="board-attach-wrap">
							<div class="existing-attach-wrap">
								<%-- 기존에 존재하는 첨부 이미지가 있다면 추가
								<div class="existing-attach-img"></div> --%>
								<span class="existing-attach-name">[6월의 샐브이벤트]당첨회원 리스트.xlsx</span>
								<input type="checkbox" name="delFile" id="delFile" value="" />
								<label for="delFile">
									<sup>
										<svg width="30" height="15" xmlns="http://w3.org/2000/svg" version="1.1" viewbox="0 0 80 40">
								            <polyline class="st1" points="9.06 20.89 25.85 35.74 50.46 9.35"/>
								        </svg>									
								        <span>클릭시 삭제됩니다.</span>
									</sup>
								</label>
								<!-- <span class="attach-del-check">체크시 삭제됩니다.</span> -->
							</div>
							<br />
						    <input class="board-attach-name" value="첨부파일" placeholder="첨부파일" readonly />
						    <label for="upFile">파일찾기</label>
						    <input type="file" id="upFile" />
						</div>
					</td>
				</tr>
			</table>
			<div class="board-button-wrap">
				<input type="submit" value="수정" id="board-update-btn" />
				<input type="reset" value="취소" id="board-back-btn" onclick="history.go(-1);" />
			</div>
		</form>
	</div>
</div>
<script>
/**
 * noticeBoardUpdateFrm 유효성 검사
 */
window.addEventListener('load', () => {
	document.noticeBoardUpdateFrm.onsubmit = (e) => {
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